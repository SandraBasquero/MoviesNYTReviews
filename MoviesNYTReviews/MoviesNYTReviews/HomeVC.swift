//
//  HomeVC.swift
//  MoviesNYTReviews
//
//  Created by X50207BA on 12/12/16.
//  Copyright © 2016 Sandra. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableMovies: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
            cell.titleMovie.text = "lalala yeah"
            cell.subtitleMovie.text = "sub lalalla"
            
            
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

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
