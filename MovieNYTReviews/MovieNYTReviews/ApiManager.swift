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
//import DATAStack
import Sync
import CoreData



class ApiManager: NSObject {
    
    private override init() {}
    static let sharedInstance:ApiManager = ApiManager()
    
    let apiKey:String = "0f74e88f53854f4687876afdb617a208"
    var morePages = true
    
    
    func getJSONs(_ pagin:Int, remoteHandler: @escaping (Bool?) -> Void) {
        let url = "https://api.nytimes.com/svc/movies/v2/reviews/search.json?&api-key="+apiKey+"&offset="+String(pagin)
     
        Alamofire.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                //print(json)
                self.morePages = json["has_more"].boolValue
                //let numForPage = json["num_results"]
                print("--- \(json["num_results"]) movies showed. Are there more? \(self.morePages) ---")
                let results = json["results"].arrayValue
                for movie in results {
                    if (!CoreDataManager.sharedInstance.movieAlreadyInLocal(newTitle: movie["display_title"].stringValue)) {
                        CoreDataManager.sharedInstance.saveData(movie)   
                    }
                }
                remoteHandler(true)
            case .failure(let error):
                print(error)
                remoteHandler(false)
            }
        }
    }
    
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
    }

}
