//
//  MovieDetailsViewController.swift
//  MovieSenseiTV
//
//  Created by Dan Isacson on 20/02/16.
//  Copyright © 2016 dna. All rights reserved.
//

import UIKit
import Kingfisher
import AVKit
import XCDYouTubeKit

class MovieDetailsViewController: UIViewController {

    var moviePreview: MoviePreview?
    var movie: Movie? {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let id = self.moviePreview?.id {
            NetworkHandler.getMovieById("\(id)", callback: self.movieCallback)
        }
        
        self.tableView.estimatedRowHeight = 500
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func movieCallback(movie: Movie?, error: NSError?) {
        debugPrint(movie)
        self.movie = movie
    }
    
    func showTrailerView() {
        
        guard let videoIdentifier = self.movie?.trailers.first?.id else {
            return
        }
        
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
    
    func showImageView() {
        
        self.performSegueWithIdentifier("toImages", sender: self)
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vc = segue.destinationViewController as? ImagesViewController {
            vc.imageUrl = self.moviePreview?.getBackdropUrl(BackdropSize.original)
        }
    }
    
}

extension MovieDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, canFocusRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let topCell = self.tableView.dequeueReusableCellWithIdentifier("TopMovieDetailsTableViewCell", forIndexPath: indexPath) as! TopMovieDetailsTableViewCell
            topCell.setup(movie, moviePreview: moviePreview)
            return topCell
        case 1:
            let middleCell = self.tableView.dequeueReusableCellWithIdentifier("MiddleMovieDetailsTableViewCell", forIndexPath: indexPath) as! MiddleMovieDetailsTableViewCell
                middleCell.setup(self.showTrailerView, onImagesButtonPressFunction: self.showImageView)
                return middleCell
        default:
                return UITableViewCell()
        }
    }
}
