//
//  MiddleMovieDetailsTableViewCell.swift
//  MovieSenseiTV
//
//  Created by Dan Isacson on 01/04/16.
//  Copyright © 2016 dna. All rights reserved.
//

import UIKit

class MiddleMovieDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var trailersButton: UIButton!
    @IBOutlet weak var imagesButton: UIButton!
    
    @IBOutlet weak var synopsisLabel: UILabel!
    
    
    var onTrailersButtonPressFunction: (() -> Void)?
    var onImagesButtonPressFunction: (() -> Void)?
    
    func setup(onTrailersButtonPressFunction: (() -> Void)?, onImagesButtonPressFunction: (() -> Void)?, movie: Movie?) {
        self.onTrailersButtonPressFunction = onTrailersButtonPressFunction
        self.onImagesButtonPressFunction = onImagesButtonPressFunction
        self.synopsisLabel.text = movie?.overview
        
    }

    @IBAction func trailersButtonPressed(sender: AnyObject) {
        self.onTrailersButtonPressFunction?()
    }
    @IBAction func imagesButtonPressed(sender: AnyObject) {
        self.onImagesButtonPressFunction?()
    }
}
