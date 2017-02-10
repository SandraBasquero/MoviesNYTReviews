//
//  DetailVC.swift
//  MovieNYTReviews
//
//  Created by X50207BA on 14/12/16.
//  Copyright © 2016 Sandra. All rights reserved.
//

import UIKit


class DetailVC: UIViewController {
    
    @IBOutlet weak var subtitleDetail: UILabel!
    var subtitleFromList:String?
    
    @IBOutlet weak var articleWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.subtitleDetail.text = subtitleFromList
        
        let url = NSURL (string: "http://www.nytimes.com/2017/02/02/movies/review-i-am-not-your-negro-review-james-baldwin.html")
        let requestObj = URLRequest(url: url! as URL)
        self.articleWebView.loadRequest(requestObj)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
