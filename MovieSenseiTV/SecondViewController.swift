
//
//  SecondViewController.swift
//  MovieSenseiTV
//
//  Created by Dan Isacson on 20/11/15.
//  Copyright © 2015 dna. All rights reserved.
//

import UIKit
import Kingfisher

class SecondViewController: UIViewController {

    @IBOutlet var testimage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint("second view loaded")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        NetworkHandler.getMovieById("135397", callback: self.callback)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func callback(movie: Movie?, error: NSError?){
        if let url = movie?.getBackdropUrl(BackdropSize.w300) {
            self.testimage.kf_setImageWithURL(url)
        }
    }

}

