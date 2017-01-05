//
//  ApiManager.swift
//  MovieNYTReviews
//
//  Created by Sandra on 18/12/16.
//  Copyright © 2016 Sandra. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import SwiftyJSON //In Terminal to fix error: carthage update --platform iOS --no-use-binaries
import Sync
import CoreData
import SystemConfiguration


//*********************************************************
// MARK: PROTOCOLS
//*********************************************************
protocol Utilities {}


//*********************************************************
// MARK: EXTENSIONS
//*********************************************************
extension NSObject:Utilities{
    
    //*********************************************************
    // Internet connection  http://stackoverflow.com/a/40574012
    //*********************************************************
    enum ReachabilityStatus {
        case notReachable
        case reachableViaWWAN
        case reachableViaWiFi
    }
    
    var currentReachabilityStatus: ReachabilityStatus {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return .notReachable
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return .notReachable
        }
        
        if flags.contains(.reachable) == false {
            // The target host is not reachable.
            return .notReachable
        }
        else if flags.contains(.isWWAN) == true {
            // WWAN connections are OK if the calling application is using the CFNetwork APIs.
            return .reachableViaWWAN
        }
        else if flags.contains(.connectionRequired) == false {
            // If the target host is reachable and no connection is required then we'll assume that you're on Wi-Fi...
            return .reachableViaWiFi
        }
        else if (flags.contains(.connectionOnDemand) == true || flags.contains(.connectionOnTraffic) == true) && flags.contains(.interventionRequired) == false {
            // The connection is on-demand (or on-traffic) if the calling application is using the CFSocketStream or higher APIs and no [user] intervention is needed
            return .reachableViaWiFi
        }
        else {
            return .notReachable
        }
    }
}

//*********************************************************
// MARK: CLASS
//*********************************************************
class ApiManager: NSObject {
    
    private override init() {}
    static let sharedInstance:ApiManager = ApiManager()
    let apiKey:String = "0f74e88f53854f4687876afdb617a208"
    var morePages = true
    
    
    //*********************************************************
    // MARK: Get all the movies from api, check if they are
    //          already in CoreData and if they not, save them
    //          in CoreData.
    //          For now, no paging - TODO.
    //*********************************************************
    
    func getJSONs(_ pagin:Int, remoteHandler: @escaping (Bool?) -> Void) {
        let url = "https://api.nytimes.com/svc/movies/v2/reviews/search.json?&api-key="+apiKey+"&offset="+String(pagin)
     
        Alamofire.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                //print(json)
                self.morePages = json["has_more"].boolValue
                //let numForPage = json["num_results"]
                //print("--- \(json["num_results"]) movies showed. Are there more? \(self.morePages) ---")
                let results = json["results"].arrayValue
                for movie in results {
                    if (!CoreDataManager.sharedInstance.movieAlreadyInLocal(newTitle: movie["display_title"].stringValue)) {
                        CoreDataManager.sharedInstance.saveData(movie)
                        CoreDataManager.sharedInstance.saveFilmImage(movie)
                    }
                }
                remoteHandler(true)
            case .failure(let error):
                print(error)
                remoteHandler(false)
            }
        }
    }
    
    /*
    func hasMoreResults(_ page:Int, remoteHandler: @escaping (Bool?) -> Void) {
        let url = "https://api.nytimes.com/svc/movies/v2/reviews/search.json?&api-key="+apiKey+"&offset="+String(page)
        
        Alamofire.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                //self.morePages = json["has_more"].boolValue
                //let numForPage = json["num_results"]
                remoteHandler(json["has_more"].boolValue)
            case .failure(let error):
                print(error)
                remoteHandler(false)
            }
        }
    }*/

    
    //*********************************************************
    // MARK: Internet connection
    //*********************************************************
    
    func internetStatus() -> ReachabilityStatus {
        return currentReachabilityStatus
    }
    

}
