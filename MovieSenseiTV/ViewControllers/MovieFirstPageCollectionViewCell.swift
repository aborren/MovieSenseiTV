//
//  MovieFirstPageCollectionViewCell.swift
//  MovieSenseiTV
//
//  Created by Dan Isacson on 12/12/15.
//  Copyright © 2015 dna. All rights reserved.
//

import UIKit

class MovieFirstPageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func setupImage(moviePreview: MoviePreview){
        if let url = moviePreview.getPosterUrl(PosterSize.w780) {
            self.imageView.kf_setImageWithURL(url)
        }
    }
}
