//
//  PosterCell.swift
//  flix_demo
//
//  Created by user144731 on 9/18/18.
//  Copyright © 2018 Roberto Bradley. All rights reserved.
//

import UIKit

class PosterCell: UICollectionViewCell {
    @IBOutlet weak var posterImageView: UIImageView!
    var movie: Movie!{
        didSet {
            posterImageView.af_setImage(withURL: movie.posterUrl!)
        }
    }
    
}
