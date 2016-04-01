//
//  SeriesViewController.swift
//  MovieSenseiTV
//
//  Created by Dan Isacson on 01/04/16.
//  Copyright © 2016 dna. All rights reserved.
//

import UIKit
import XCDYouTubeKit
import AVKit

class SeriesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func clicked(sender: AnyObject) {

        let videoIdentifier = "dKrVegVI0Us"
        let playerViewController = AVPlayerViewController()
        self.presentViewController(playerViewController, animated: true, completion: nil)

        XCDYouTubeClient.defaultClient().getVideoWithIdentifier(videoIdentifier) { [weak playerViewController] (video: XCDYouTubeVideo?, error: NSError?) in
            if let streamURL = (video?.streamURLs[XCDYouTubeVideoQualityHTTPLiveStreaming] ??
                video?.streamURLs[XCDYouTubeVideoQuality.HD720.rawValue] ??
                video?.streamURLs[XCDYouTubeVideoQuality.Medium360.rawValue] ??
                video?.streamURLs[XCDYouTubeVideoQuality.Small240.rawValue]) {
                playerViewController?.player = AVPlayer(URL: streamURL)
                playerViewController?.player?.play()
            } else {
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        }

    }
}
