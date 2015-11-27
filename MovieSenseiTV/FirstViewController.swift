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
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.testNetworkCall()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func testNetworkCall(){
        Alamofire.request(.GET, "https://httpbin.org/get")
            .responseJSON { response in
                debugPrint(response)
        }
    }
}

