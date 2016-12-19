//
//  ApiManager.swift
//  MovieNYTReviews
//
//  Created by Sandra on 18/12/16.
//  Copyright © 2016 Sandra. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON //In Terminal to fix error: carthage update --platform iOS --no-use-binaries

class ApiManager: NSObject {
    
    func getTest() {
        //var myJson:Data = Data()
        Alamofire.request("https://api.nytimes.com/svc/movies/v2/reviews/search.json?&api-key=0f74e88f53854f4687876afdb617a208").responseJSON { response in
            /*print(response.request as Any)  // original URL request
            print(response.response as Any) // HTTP URL response
            print(response.data as Any)     // server data
            print(response.result)   // result of response serialization*/
            
            if let JSONN = response.result.value {
                print("JSON: \(JSONN)")
                //myJson = JSON as! Data
                let myJson = JSON(JSONN)
                /*if let userName = myJson[0][0][0] {
                    print(userName)
                }*/
            }
        }
        
     /*   let json = JSON(data: myJson)
        if json[0]["display_title"].string != nil {
            //Now you got your value
            print(json[0]["display_title"].string!)
        }*/
        
    }
    
}
