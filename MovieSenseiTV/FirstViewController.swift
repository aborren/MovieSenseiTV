//
//  FirstViewController.swift
//  MovieSenseiTV
//
//  Created by Dan Isacson on 20/11/15.
//  Copyright © 2015 dna. All rights reserved.
//

import UIKit
import Alamofire

class FirstViewController: UIViewController {

    @IBOutlet weak var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.testNetwork()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func testNetwork(){
        Alamofire.request(.GET, "https://httpbin.org/get")
            .responseJSON { response in
                self.testLabel.text = response.description
        }
    }

}

