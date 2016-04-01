//
//  TopMovieDetailsTableViewCell.swift
//  MovieSenseiTV
//
//  Created by Dan Isacson on 20/02/16.
//  Copyright © 2016 dna. All rights reserved.
//

import UIKit

class TopMovieDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var voteCountLabel: UILabel!
    
    @IBOutlet weak var infoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(movie: Movie?, moviePreview: MoviePreview?) {
        if let url = moviePreview?.getBackdropUrl(BackdropSize.w1280) {
            self.topImageView.kf_setImageWithURL(url)
        }
        
        self.titleLabel.text = moviePreview?.title
        
        if let rating = movie?.voteAverage {
            
            self.ratingLabel.text = String(format: "%.1f", rating.doubleValue)
        }
        
        if let votes = movie?.voteCount {
            self.voteCountLabel.text = "\(votes) votes"
        }
        
        if let runtime = movie?.runtime, release = movie?.releaseDate, genre = movie?.getGenreNamesSeparatedBy(", ") {
            self.infoLabel.text = "Runtime: \(runtime) min | Released: \(release) | Genres: \(genre)"
        }
    }

}
