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
                print(results[0])
                //print("\(results[0]["display_title"].stringValue)")
                
                for movie in results {
                    print(movie["display_title"])
                    self.storeTranscription(movie)
                }
                
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
  
    // MARK: -------
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    
    func storeTranscription(_ movieTest:JSON) {
        
        //SAVE IN DB 
        
        let context = getContext()
        //retrieve the entity that we just created
        let entity =  NSEntityDescription.entity(forEntityName: "Movie", in: context)
        
        let transc = NSManagedObject(entity: entity!, insertInto: context)
        
        print(movieTest)
        
        transc.hyp_fill(with: movieTest.dictionaryObject!) //Sync framework
        
        //set the entity values
        //transc.setValue("Blade Runner", forKey: "displayTitle")
        //transc.setValue("The science fiction film!", forKey: "headline")
        
        //save the object
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        } catch {
            
        }
        
        
        //QUERY DB
        
        //create a fetch request, telling it about the entity
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        
        do {
            //go get the results
            let searchResults = try getContext().fetch(fetchRequest)
            
            //I like to check the size of the returned results!
            print ("num of results = \(searchResults.count)")
            
            //You need to convert to NSManagedObject to use 'for' loops
            for trans in searchResults as [NSManagedObject] {
                //get the Key Value pairs (although there may be a better way to do that...
                print("\(trans.value(forKey: "displayTitle"))")
                
                let expenses = NSKeyedUnarchiver.unarchiveObject(with: trans.value(forKey: "link") as! Data)
                var aa = expenses as! Dictionary<String, Any>
                print(aa.removeValue(forKey: "url")!)
            }
        } catch {
            print("Error with request: \(error)")
        }
    }

}
