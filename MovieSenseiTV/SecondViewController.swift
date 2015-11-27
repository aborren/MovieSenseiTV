
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
        self.setupTestImage()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupTestImage(){
        self.testimage.kf_setImageWithURL(NSURL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQT_oViOWTXEGGCQx77jw1EW56HHU1PEdpbP-6ZWNxmP7a0itxFnK8K5JQ")!)
    }

}

