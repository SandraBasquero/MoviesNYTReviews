//
//  HomeVC.swift
//  MovieNYTReviews
//
//  Created by X50207BA on 14/12/16.
//  Copyright © 2016 Sandra. All rights reserved.
//

import UIKit


class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableMovies: UITableView!
    var jsonPagin = 20
    var morePagesMovie = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ApiManager.sharedInstance.getJSONs(jsonPagin)

       /* ApiManager.sharedInstance.hasMoreResults(self.jsonPagin, remoteHandler: {
            more in
            self.morePagesMovie = more!
            self.jsonPagin = self.jsonPagin + 20
            print(self.jsonPagin)
            if self.morePagesMovie {
                ApiManager.sharedInstance.getJSONs(self.jsonPagin)
            }
        })*/
        
        
        self.searchBar.delegate = self
        self.tableMovies.delegate = self
        self.tableMovies.dataSource = self
    }
    
    
    // MARK: - Movies TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        /*if currentRecipes.count != 0{
         return currentRecipes.count
         }else{
         return 0
         }*/
        return 3 //number of table rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieListCell
        
        //if (currentRecipes.count != 0){
        //let recipe = 3
        cell.titleMovie.text = "lalala yeah \(indexPath[1]+1)"
        cell.subtitleMovie.text = "sub lalalla \(indexPath[1]+1)"
        
        
        /*DispatchQueue.global().async {
         let imgURL: URL = URL(string: recipe.image!)!
         if let data = NSData(contentsOf: imgURL){
         DispatchQueue.main.async {
         cell.recipeImage.image = UIImage(data: data as Data)
         }
         }
         }*/
        
        //}
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("select row \(indexPath[1])")
        let currentCell = tableView.cellForRow(at: indexPath)! as! MovieListCell
        print("select row \(currentCell.titleMovie.text)")
        performSegue(withIdentifier: "toDetailSegue", sender: currentCell)
    }
    
    
    
    // MARK: - Navigation
    
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

