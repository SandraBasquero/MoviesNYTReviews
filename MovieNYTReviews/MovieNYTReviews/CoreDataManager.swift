//
//  CoreDataManager.swift
//  MovieNYTReviews
//
//  Created by X50207BA on 28/12/16.
//  Copyright © 2016 Sandra. All rights reserved.
//

import UIKit
import SwiftyJSON
import Sync
import CoreData


class CoreDataManager: NSObject {
    
    private override init() {}
    static let sharedInstance:CoreDataManager = CoreDataManager()
    
    //*********************************************************
    // MARK: Context
    //*********************************************************

    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    
    //*********************************************************
    // MARK: CoreData queries
    //*********************************************************
    
    func getAllTheMovies() {
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
    
    
    func movieAlreadyInLocal(newTitle:String) -> Bool {
        var exist = false
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "displayTitle == %@", newTitle)
        
        do {
        let searchResults = try getContext().fetch(fetchRequest)
        print(searchResults.count)
            exist = (searchResults.count == 0) ? false : true
        } catch {
            print("Error with request: \(error)")
        }
        return exist
    }
    
    
    //*********************************************************
    // MARK: Save data to CoreData
    //*********************************************************

    func saveData(_ movieResult:JSON)  {
        let context = getContext()
        //retrieve the entity that we just created
        let entity =  NSEntityDescription.entity(forEntityName: "Movie", in: context)
        
        let transc = NSManagedObject(entity: entity!, insertInto: context)
        
        print(movieResult)
        
        transc.hyp_fill(with: movieResult.dictionaryObject!) //Sync framework
        
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
    }
    
}
