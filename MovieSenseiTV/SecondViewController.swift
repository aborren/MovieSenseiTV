
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
        NetworkHandler.getMovieById("4476", callback: self.callback)
        NetworkHandler.getMoviesPopular(1) { (movies, error) -> () in
            if let m = movies {
                for x in m {
                    debugPrint(x.getBackdropUrl(BackdropSize.original))
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func callback(movie: Movie?, error: NSError?){
        if let url = movie?.getBackdropUrl(BackdropSize.original) {
            self.testimage.kf_setImageWithURL(url)
        }
        debugPrint(movie?.getGenreNamesSeparatedBy(", "))
    }

}

