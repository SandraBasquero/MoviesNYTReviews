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
    
    func getAllTheMovies() -> [NSManagedObject] {
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        var moviesArray:[NSManagedObject] = []
        
        do {
            //go get the results
            let searchResults = try getContext().fetch(fetchRequest)
            
            //I like to check the size of the returned results!
            print ("num of results = \(searchResults.count)")
            
            //You need to convert to NSManagedObject to use 'for' loops
            for trans in searchResults as [NSManagedObject] {
                //get the Key Value pairs (although there may be a better way to do that...
                moviesArray.append(trans)
            }
        } catch {
            print("Error with request: \(error)")
        }
        return moviesArray
    }
    
    func getAllImageFilms() -> [NSManagedObject] {
        let fetchRequest: NSFetchRequest<ImageFilm> = ImageFilm.fetchRequest()
        var imagesArray:[NSManagedObject] = []
        
        do{
            let searchResults = try getContext().fetch(fetchRequest)
            for trans in searchResults as [NSManagedObject] {
                imagesArray.append(trans)
            }
        } catch {
            print(error)
        }
        return imagesArray
    }
    
    func movieAlreadyInLocal(newTitle:String) -> Bool {
        var exist = false
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest() //Entity
        fetchRequest.predicate = NSPredicate(format: "displayTitle == %@", newTitle)
        
        do {
        let searchResults = try getContext().fetch(fetchRequest)
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
        //print(movieResult)
        transc.hyp_fill(with: movieResult.dictionaryObject!) //Sync framework
        
        //save the object
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        } catch {
            
        }
    }
    
    func saveFilmImage(_ movieResult:JSON) {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "ImageFilm", in: context)
        let transc = NSManagedObject(entity: entity!, insertInto: context)
        
        // Save image
        let url:URL = URL(string: movieResult["multimedia"]["src"].stringValue)!
        if let data = try? Data(contentsOf: url) {
            transc.setValue(data, forKey: "image")
        }
        // Save date
        let date:NSDate = NSDate(fromDateString: movieResult["date_updated"].stringValue)!
        transc.setValue(date, forKey: "dateUpdated")

        //save the object
        do {
            try context.save()
            print("image saved!")
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        } catch {
            
        }
    }
    
}
