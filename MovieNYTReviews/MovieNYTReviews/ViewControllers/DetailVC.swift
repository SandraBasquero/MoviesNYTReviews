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
    var urlString = ""
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //self.activity.startAnimating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationTitleStyle()
        
        self.activity.startAnimating()
        self.subtitleDetail.text = subtitleFromList
        
        let url = NSURL (string: urlString)
        let requestObj = URLRequest(url: url! as URL)
        //self.articleWebView.loadRequest(requestObj)
        loadURL(requestObj, completion:{
            success in
            self.activity.stopAnimating()
        })
    }
    
    func loadURL(_ url: URLRequest, completion:(Bool?)->Void) {
        self.articleWebView.loadRequest(url)
        completion(true)
    }
    
    func navigationTitleStyle() {
        let frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        let tlabel = UILabel(frame: frame)
        tlabel.text = navigationItem.title
        tlabel.textColor = UIColor.black
        tlabel.font = UIFont(name: "System", size: 18.0)
        tlabel.backgroundColor = UIColor.clear
        tlabel.adjustsFontSizeToFitWidth = true
        tlabel.textAlignment = .center
        self.navigationItem.titleView = tlabel
    }

}
