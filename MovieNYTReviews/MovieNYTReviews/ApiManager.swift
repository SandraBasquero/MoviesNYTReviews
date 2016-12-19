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

class ApiManager: NSObject {
    
    func getTest() {
       // var myJson:[String: Any]?
        Alamofire.request("https://api.nytimes.com/svc/movies/v2/reviews/search.json?&api-key=0f74e88f53854f4687876afdb617a208").responseJSON { response in
            
            if let JSONN = response.result.value as? [String: Any] {
                //print("JSON: \(JSONN["results"])")
                let resultss:NSArray = JSONN["results"] as! NSArray
                //print(resultss[0])
                let dictio:NSDictionary = resultss[0] as! NSDictionary
                print(dictio.value(forKey: "display_title")!)
            }
        }
    }
    
}
