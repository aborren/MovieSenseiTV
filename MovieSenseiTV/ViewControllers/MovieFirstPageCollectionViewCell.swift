//
//  MovieFirstPageCollectionViewCell.swift
//  MovieSenseiTV
//
//  Created by Dan Isacson on 12/12/15.
//  Copyright © 2015 dna. All rights reserved.
//

import UIKit
import Kingfisher

class MovieFirstPageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    var moviePreview: MoviePreview?
    
    func setup(moviePreview: MoviePreview){
        self.moviePreview = moviePreview
        
        if let url = moviePreview.getPosterUrl(PosterSize.w780) {
            self.imageView.kf_setImageWithURL(url)
        }
    }
}
