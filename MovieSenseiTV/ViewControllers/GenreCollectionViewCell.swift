//
//  GenreCollectionViewCell.swift
//  MovieSenseiTV
//
//  Created by Dan Isacson on 12/12/15.
//  Copyright © 2015 dna. All rights reserved.
//

import UIKit

class GenreCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func setImage(imageName: String){
        self.imageView.image = UIImage(named: imageName)
    }
}
