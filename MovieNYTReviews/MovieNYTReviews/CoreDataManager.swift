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
    
    // Get all movies from local Core Data
    // -----------------------------------------------------
    func getAllTheMovies() -> [NSManagedObject] {
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        //fetchRequest.sortDescriptors = [NSSortDescriptor(key: "dateUpdated", ascending: false)]
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
    
    // Get image movies from local Core Data
    // -----------------------------------------------------
    func getAllImageFilms() -> [NSManagedObject] {
        let fetchRequest: NSFetchRequest<ImageFilm> = ImageFilm.fetchRequest()
        //fetchRequest.sortDescriptors = [NSSortDescriptor(key: "dateUpdated", ascending: false)]
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
    
    // Check by title if a movie is already in local Core Data
    // -----------------------------------------------------
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

    // Save Api data in local Core Data
    // -----------------------------------------------------
    func saveData(_ movieResult:JSON)  {
        let context = getContext()
        //retrieve the entity that we just created
        let entity =  NSEntityDescription.entity(forEntityName: "Movie", in: context)
        let transc = NSManagedObject(entity: entity!, insertInto: context)
        //print(movieResult)
        transc.hyp_fill(with: movieResult.dictionaryObject!) //Sync framework
        
        //Save the object
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        } catch {
            
        }
    }
    
    // Save image film and date from Api in local Core Data
    // -----------------------------------------------------
    func saveFilmImage(_ movieResult:JSON) {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "ImageFilm", in: context)
        let transc = NSManagedObject(entity: entity!, insertInto: context)
        
        // Save image
        if (movieResult["multimedia"]["src"].null != nil) {
            let image = UIImage(named: "icon-default-film")
            let imageData = NSData(data: UIImagePNGRepresentation(image!)!)
            transc.setValue(imageData, forKey: "image")
        } else {
            let url:URL = URL(string: movieResult["multimedia"]["src"].stringValue)!
            if let data = try? Data(contentsOf: url) {
                transc.setValue(data, forKey: "image")
            }
        }
        
        // Save date
        let date:NSDate = NSDate(fromDateString: movieResult["date_updated"].stringValue)!
        transc.setValue(date, forKey: "dateUpdated")

        //Save the object
        do {
            try context.save()
            print("image saved!")
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        } catch {
            
        }
    }
    
}
