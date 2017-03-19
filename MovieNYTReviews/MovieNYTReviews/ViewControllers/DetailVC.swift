//
//  DetailVC.swift
//  MovieNYTReviews
//
//  Created by X50207BA on 14/12/16.
//  Copyright © 2016 Sandra. All rights reserved.
//

import UIKit

class DetailVC: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var subtitleDetail: UILabel!
    var subtitleFromList:String?
    @IBOutlet weak var articleWebView: UIWebView!
    var urlString = ""
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationTitleStyle()
        
        self.articleWebView.delegate = self
        
        self.activity.startAnimating()
        self.subtitleDetail.text = subtitleFromList
        
        //Loading film review URL in UIWebView
        let url = NSURL (string: urlString)
        let requestObj = URLRequest(url: url! as URL)
        self.articleWebView.loadRequest(requestObj)
    }
    
    //Stop and hide Activity Indicator
    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.activity.stopAnimating()
        self.activity.isHidden = true
    }
    
    // Title style
    func navigationTitleStyle() {
        let frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        let tlabel = UILabel(frame: frame)
        tlabel.text = navigationItem.title
        tlabel.textColor = UIColor.black
        tlabel.font = UIFont(name: "Cheltenham", size: 23.0)
        tlabel.backgroundColor = UIColor.clear
        tlabel.adjustsFontSizeToFitWidth = true
        tlabel.textAlignment = .center
        self.navigationItem.titleView = tlabel
    }

}
