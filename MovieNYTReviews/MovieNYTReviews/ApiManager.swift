//
//  ApiManager.swift
//  MovieNYTReviews
//
//  Created by Sandra on 18/12/16.
//  Copyright © 2016 Sandra. All rights reserved.
//

import UIKit
import Alamofire

class ApiManager: NSObject {
    
    func getTest() {
        //var myJson:Dictionary<String, Any>
        Alamofire.request("https://api.nytimes.com/svc/movies/v2/reviews/search.json?&api-key=0f74e88f53854f4687876afdb617a208").responseJSON { response in
            /*print(response.request as Any)  // original URL request
            print(response.response as Any) // HTTP URL response
            print(response.data as Any)     // server data
            print(response.result)   // result of response serialization*/
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
              //  myJson = JSON as! Dictionary<String, Any>
            }
        }
        
        
       /* if let statusesArray = try? JSONSerialization.jsonObject(with: myJson, options: .allowFragments) as? [[String: Any]],
            let user = statusesArray[0]["user"] as? [String: Any],
            let username = user["name"] as? String {
            // Finally we got the username
        }*/
    }
    
}
