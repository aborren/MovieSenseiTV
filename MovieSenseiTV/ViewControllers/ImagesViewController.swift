//
//  ImagesViewController.swift
//  MovieSenseiTV
//
//  Created by Dan Isacson on 02/04/16.
//  Copyright © 2016 dna. All rights reserved.
//

import UIKit
import Kingfisher

class ImagesViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var imageUrl: NSURL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = self.imageUrl {
            self.imageView.kf_setImageWithURL(url)
        }
        
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(ImagesViewController.handleSwipe))
        swipe.direction = .Left
        self.imageView.addGestureRecognizer(swipe)
    }
    
    func handleSwipe(swipe: UISwipeGestureRecognizer) {
       debugPrint("swipe")
    }

}
