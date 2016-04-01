//
//  MoviesViewController.swift
//  MovieSenseiTV
//
//  Created by Dan Isacson on 12/12/15.
//  Copyright © 2015 dna. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let types: [String] = ["Upcoming", "Top rated", "Popular", "Now playing"]
    let genres: [String] = ["action", "drama", "comedy", "romance", "family", "horror"]
    
    var popularMovies: [MoviePreview] = []
    var upcomingMovies: [MoviePreview] = []
    var topRatedMovies: [MoviePreview] = []
    var nowPlayingMovies: [MoviePreview] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NetworkHandler.getMoviesPopular(1, callback: self.popularMoviesCallback)
        NetworkHandler.getMoviesUpcoming(1, callback: self.upcomingMoviesCallback)
        NetworkHandler.getMoviesTopRated(1, callback: self.topRatedMoviesCallback)
        NetworkHandler.getMoviesNowPlaying(1, callback: self.nowPlayingMoviesCallback)
        
        self.tableView.estimatedRowHeight = 300
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return 5
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell: UITableViewCell
            if indexPath.row == 0 {
                cell = tableView.dequeueReusableCellWithIdentifier("genreCell",
                    forIndexPath: indexPath)
                
                (cell as? GenreTableViewCell)?.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
            }else {
                cell = tableView.dequeueReusableCellWithIdentifier("movieCell",
                    forIndexPath: indexPath)
                (cell as? MovieFirstPageTableViewCell)?.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
                (cell as? MovieFirstPageTableViewCell)?.typeLabel.text = self.types[indexPath.row - 1]
            }
            
            return cell
    }
    
    
    func popularMoviesCallback(movies: [MoviePreview]?, error: NSError?){
        if let popularMovies = movies {
            self.popularMovies = popularMovies
            self.tableView.reloadData()
        }
    }
    
    func upcomingMoviesCallback(movies: [MoviePreview]?, error: NSError?){
        if let upcomingMovies = movies{
            self.upcomingMovies = upcomingMovies
            self.tableView.reloadData()
        }
    }
    
    func topRatedMoviesCallback(movies: [MoviePreview]?, error: NSError?){
        if let topRatedMovies = movies{
            self.topRatedMovies = topRatedMovies
            self.tableView.reloadData()
        }
    }
    
    func nowPlayingMoviesCallback(movies: [MoviePreview]?, error: NSError?){
        if let nowPlayingMovies = movies{
            self.nowPlayingMovies = nowPlayingMovies
            self.tableView.reloadData()
        }

    }
    
    override func didUpdateFocusInContext(context: UIFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let movieDetailsVC = segue.destinationViewController as? MovieDetailsViewController {
            if let moviePreview = (sender as? MovieFirstPageCollectionViewCell)?.moviePreview {
                movieDetailsVC.moviePreview = moviePreview
            }
        }
    }
    
}


extension MoviesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
            
            if collectionView.tag == 0 {
                return self.genres.count
            } else if collectionView.tag == 1 {
                return self.upcomingMovies.count
            }  else if collectionView.tag == 2 {
                return self.topRatedMovies.count
            } else if collectionView.tag == 3 {
                return self.popularMovies.count
            } else if collectionView.tag == 4 {
                return self.nowPlayingMovies.count
            }
            else {
                return 0
            }
    }
    
    func collectionView(collectionView: UICollectionView,
        cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
            
            let cell: UICollectionViewCell
            if collectionView.tag == 0 {
                cell = collectionView.dequeueReusableCellWithReuseIdentifier("genreCollectionCell",
                forIndexPath: indexPath)
                let genre = self.genres[indexPath.row]
                (cell as? GenreCollectionViewCell)?.setImage(genre)
            } else if collectionView.tag == 1 {
                cell = collectionView.dequeueReusableCellWithReuseIdentifier("movieCollectionCell",
                    forIndexPath: indexPath)
                
                let moviePreview = self.upcomingMovies[indexPath.row]
                (cell as? MovieFirstPageCollectionViewCell)?.setup(moviePreview)
            } else if collectionView.tag == 2 {
                cell = collectionView.dequeueReusableCellWithReuseIdentifier("movieCollectionCell",
                    forIndexPath: indexPath)
                
                let moviePreview = self.topRatedMovies[indexPath.row]
                (cell as? MovieFirstPageCollectionViewCell)?.setup(moviePreview)
            } else if collectionView.tag == 3 {
                cell = collectionView.dequeueReusableCellWithReuseIdentifier("movieCollectionCell",
                    forIndexPath: indexPath)
                
                let moviePreview = self.popularMovies[indexPath.row]
                (cell as? MovieFirstPageCollectionViewCell)?.setup(moviePreview)
            } else if collectionView.tag == 4 {
                cell = collectionView.dequeueReusableCellWithReuseIdentifier("movieCollectionCell",
                    forIndexPath: indexPath)
                
                let moviePreview = self.nowPlayingMovies[indexPath.row]
                (cell as? MovieFirstPageCollectionViewCell)?.setup(moviePreview)
            } else {
                cell = collectionView.dequeueReusableCellWithReuseIdentifier("movieCollectionCell",
                    forIndexPath: indexPath)
            }
            
            return cell

    }
}
