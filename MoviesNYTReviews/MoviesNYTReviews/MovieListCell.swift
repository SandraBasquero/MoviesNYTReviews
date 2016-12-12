//
//  MovieListCell.swift
//  MoviesNYTReviews
//
//  Created by X50207BA on 12/12/16.
//  Copyright © 2016 Sandra. All rights reserved.
//

import UIKit

class MovieListCell: UITableViewCell {
    
    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var titleMovie: UILabel!
    @IBOutlet weak var subtitleMovie: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
