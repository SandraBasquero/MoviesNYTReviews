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

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableMovies: UITableView!
    var jsonPagin = 0
    var moviesArrayResult:[NSManagedObject] = []
    
    
    //*********************************************************
    // MARK: View Loading
    //*********************************************************
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBar.delegate = self
        self.tableMovies.delegate = self
        self.tableMovies.dataSource = self
        tableMovies.isScrollEnabled = false
        
        ApiManager.sharedInstance.getJSONs(jsonPagin, remoteHandler: {
            success in
            if success! {
                print("Filling array")
                self.moviesArrayResult = CoreDataManager.sharedInstance.getAllTheMovies()
                //print(self.moviesArrayResult)
                self.tableMovies.reloadData()
                self.tableMovies.isScrollEnabled = true
            } else {
                print("Error")
            }
        })
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
            cell.subtitleMovie.numberOfLines = 0
            cell.subtitleMovie.adjustsFontSizeToFitWidth = true
            // Set image movie in table cell
            DispatchQueue.global().async {
                let multi = NSKeyedUnarchiver.unarchiveObject(with: self.moviesArrayResult[indexPath.row].value(forKey: "multimedia") as! Data)
                var source = multi as! Dictionary<String, Any>
                let url:URL = URL(string: source["src"] as! String)!
                
                if let data = NSData(contentsOf: url){
                    DispatchQueue.main.async {
                        cell.imageMovie.image = UIImage(data: data as Data)
                        self.tableMovies.isScrollEnabled = true
                    }
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("select row \(indexPath[1])")
        let currentCell = tableView.cellForRow(at: indexPath)! as! MovieListCell
        //print("select row \(currentCell.titleMovie.text)")
        performSegue(withIdentifier: "toDetailSegue", sender: currentCell)
    }
    
    
    
    //*********************************************************
    // MARK: Navigation
    //*********************************************************
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
        
        if segue.identifier == "toDetailSegue" {
            if let viewController = segue.destination as? DetailVC {
                let cellSel: MovieListCell = sender as! MovieListCell
                viewController.navigationItem.title = cellSel.titleMovie.text
                viewController.subtitleFromList = cellSel.subtitleMovie.text
            }
        }
    }
    
}

