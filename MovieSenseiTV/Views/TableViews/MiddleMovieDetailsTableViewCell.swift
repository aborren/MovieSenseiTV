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
    var onButtonPressFunction: (() -> Void)?
    
    func setup(onButtonPressFunction: (() -> Void)?) {
        self.onButtonPressFunction = onButtonPressFunction
    }

    @IBAction func trailersButtonPressed(sender: AnyObject) {
        self.onButtonPressFunction?()
    }
}
