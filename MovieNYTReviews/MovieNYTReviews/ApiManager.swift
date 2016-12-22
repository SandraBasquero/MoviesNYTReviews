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
    
    let apiKey:String = "0f74e88f53854f4687876afdb617a208"
    
    func getTest() {
        let url = "https://api.nytimes.com/svc/movies/v2/reviews/search.json?&api-key="+apiKey
        Alamofire.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                //print(json)
                let more = json["has_more"]
                let numForPage = json["num_results"]
                print("--- \(numForPage) movies showed. Are there more? \(more) ---")
                let results = json["results"].arrayValue
                //print("\(results[0]["display_title"].stringValue)")
                for movie in results {
                    print(movie["display_title"])
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
