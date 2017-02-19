//
//  HomeVC.swift
//  MovieNYTReviews
//
//  Created by X50207BA on 14/12/16.
//  Copyright © 2016 Sandra. All rights reserved.
//

import UIKit
import CoreData
import Sync

//*********************************************************
// MARK: EXTENSIONS
//*********************************************************
public extension String {
    func substring(from : Int) -> String? {
        if (from >= 10) {
            return nil
        }
        let fromIndex = self.index(self.startIndex, offsetBy: from)
        return self.substring(from: fromIndex)
    }
}

//*********************************************************
// MARK: CLASS
//*********************************************************
class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    // Variables declaration
    // -----------------------------------------------------
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableMovies: UITableView!
    var jsonPagin = 0
    var moviesArrayResult:[NSManagedObject] = []
    var imageFilmsArrayResult:[NSManagedObject] = []
    var imagesCache:NSCache<AnyObject, AnyObject>! //Learned here -> http://bit.ly/2iGHWJZ
    lazy var refreshControl: UIRefreshControl = {  //Learned here -> http://bit.ly/2iTPv01
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(HomeVC.handleRefresh), for: UIControlEvents.valueChanged)
        return refreshControl
    }()
    @IBOutlet weak var syncActivity: UIActivityIndicatorView!
    @IBOutlet weak var syncBackground: UIView!
    @IBOutlet weak var labelBackground: UILabel!
    
    //*********************************************************
    // MARK: View Loading
    //*********************************************************
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableMovies.addSubview(self.refreshControl)
        self.imagesCache = NSCache()
        self.searchBar.delegate = self
        self.tableMovies.delegate = self
        self.tableMovies.dataSource = self
        tableMovies.isScrollEnabled = false
        self.syncActivity.startAnimating()
        
        if ApiManager.sharedInstance.internetStatus() != .notReachable {
            ApiManager.sharedInstance.getJSONs(jsonPagin, remoteHandler: {
                success in
                if success! {
                    print("Filling array from Api")
                    self.loadingFromCoreData()
                } else {
                    print("Error")
                }
            })
        } else {
            print("Filling array from local CoreData")
            loadingFromCoreData()
        }
    }
    
    // Fill arrays with Core Data info and reload tableView
    // -----------------------------------------------------
    func loadingFromCoreData() {
        self.moviesArrayResult = CoreDataManager.sharedInstance.getAllTheMovies()
        self.imageFilmsArrayResult = CoreDataManager.sharedInstance.getAllImageFilms()
        //print(self.moviesArrayResult)
        self.tableMovies.reloadData()
        self.tableMovies.isScrollEnabled = true
        self.syncActivity.stopAnimating()
        self.syncBackground.isHidden = true
        self.labelBackground.isHidden = true
    }
    
    // Refresh data when pull  - Learned here -> http://bit.ly/2iTPv01
    // -----------------------------------------------------
    func handleRefresh() {
        // Do some reloading of data and update the table view's data source
        // Fetch more objects from a web service, for example...
        print("Checking new data")
        
        self.moviesArrayResult.removeAll()
        self.imageFilmsArrayResult.removeAll()
        
        if ApiManager.sharedInstance.internetStatus() != .notReachable {
            ApiManager.sharedInstance.getJSONs(jsonPagin, remoteHandler: {
                success in
                if success! {
                    print("Filling array from Api")
                    self.loadingFromCoreData()
                    self.refreshControl.endRefreshing()
                } else {
                    print("Error")
                }
            })
        } else {
            print("Filling array from local CoreData")
            loadingFromCoreData()
            self.refreshControl.endRefreshing()
        }
    }
    
    //*********************************************************
    // MARK: Movies TableView
    //*********************************************************
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if moviesArrayResult.count != 0{
            return moviesArrayResult.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieListCell
        //print(indexPath.row)
        if moviesArrayResult.count > 0 {
            // Set title and headline movie in table cell
            cell.titleMovie.text = moviesArrayResult[indexPath.row].value(forKey: "displayTitle") as! String?
            let headline = moviesArrayResult[indexPath.row].value(forKey: "headline") as! String?
            cell.subtitleMovie.text = headline?.substring(from: 8)
            //cell.subtitleMovie.numberOfLines = 0
            //cell.subtitleMovie.adjustsFontSizeToFitWidth = true
            
            // Set image movie in table cell WITHOUT CACHE - v.1
            /*DispatchQueue.global().async {
                let multi = NSKeyedUnarchiver.unarchiveObject(with: self.moviesArrayResult[indexPath.row].value(forKey: "multimedia") as! Data)
                var source = multi as! Dictionary<String, Any>
                let url:URL = URL(string: source["src"] as! String)!
                
                if let data = NSData(contentsOf: url){
                    DispatchQueue.main.async {
                        cell.imageMovie.image = UIImage(data: data as Data)
                        self.tableMovies.isScrollEnabled = true
                    }
                }
            }*/
            
            // Set image movie in table cell WITH CACHE
            if self.imagesCache.object(forKey: (indexPath as NSIndexPath).row as AnyObject) != nil {
                // Use cache
                //print("Cached image used, no need to download it")
                cell.imageMovie?.image = self.imagesCache.object(forKey: (indexPath as NSIndexPath).row as AnyObject) as? UIImage
            } else {
                // Not use cache. Take image from local Core Data
                DispatchQueue.main.async {
                    let img:UIImage! = UIImage(data: self.imageFilmsArrayResult[indexPath.row].value(forKey: "image") as! Data)
                    cell.imageMovie?.image = img
                    //Set cache image to use it from now on
                    self.imagesCache.setObject(img, forKey: (indexPath as NSIndexPath).row as AnyObject)
                }
            }
            self.tableMovies.isScrollEnabled = true
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMovie:Movie = self.moviesArrayResult[indexPath[1]] as! Movie
        performSegue(withIdentifier: "toDetailSegue", sender: selectedMovie)
    }

    
    //*********************************************************
    // MARK: Navigation
    //*********************************************************
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
        
        let movie:Movie = sender as! Movie
        let link = NSKeyedUnarchiver.unarchiveObject(with: movie.link as! Data) as! [String : String]
        
        if segue.identifier == "toDetailSegue" {
            if let viewController = segue.destination as? DetailVC {
                viewController.navigationItem.title = movie.displayTitle
                viewController.subtitleFromList = movie.summaryShort
                viewController.urlString = link["url"]!
            }
        }
    }
    
}

