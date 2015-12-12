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
    
    let genres: [String] = ["action", "drama", "comedy", "romance", "family", "horror"]
    
    var popularMovies: [MoviePreview] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NetworkHandler.getMoviesPopular(1, callback: self.popularMoviesCallback)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return 4
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
            }
            
            return cell
    }
    
    
    func popularMoviesCallback(movies: [MoviePreview]?, error: NSError?){
        if let popularMovies = movies {
            self.popularMovies = popularMovies
            self.tableView.reloadData()
        }
    }
    
    override func didUpdateFocusInContext(context: UIFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
        
        
        
        /*if let prevcell = context.previouslyFocusedView as? testCell {
        UIView.animateWithDuration(0.2, animations: { () -> Void in
        prevcell.updateImageSize(self.originSize)
        })
        }
        
        if let newcell = context.nextFocusedView as? testCell {
        UIView.animateWithDuration(0.2, animations: { () -> Void in
        newcell.updateImageSize(self.bigSize)
        })
        }*/
    }
    
}


extension MoviesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
            
            if collectionView.tag == 0 {
                return self.genres.count
            }else {
                return self.popularMovies.count
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
            }else if collectionView.tag == 1 {
                cell = collectionView.dequeueReusableCellWithReuseIdentifier("movieCollectionCell",
                    forIndexPath: indexPath)
                
                let moviePreview = self.popularMovies[indexPath.row]
                (cell as? MovieFirstPageCollectionViewCell)?.setupImage(moviePreview)
            } else {
                cell = collectionView.dequeueReusableCellWithReuseIdentifier("movieCollectionCell",
                    forIndexPath: indexPath)
            }
            
            return cell

    }
}
