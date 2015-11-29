//
//  MoviePreview.swift
//  MovieSenseiTV
//
//  Created by Dan Isacson on 29/11/15.
//  Copyright © 2015 dna. All rights reserved.
//

import Foundation
import SwiftyJSON

/// Used to store data in movies listed in array. For example when fetching upcoming movies.
class MoviePreview {
    let id: Int?
    let title: String?
    let adult: Bool?
    private let backdropPath: String?
    private let posterPath: String?
    
    init(json: JSON) {
        self.id = json["id"].int
        self.title = json["title"].string
        self.adult = json["adult"].bool
        self.backdropPath = json["backdrop_path"].string
        self.posterPath = json["poster_path"].string
    }
    
    func getBackdropUrl(size: BackdropSize) -> NSURL? {
        if let backdropPath = self.backdropPath {
            return NSURL(string: Configuration.baseUrl + size.rawValue + backdropPath)
        }
        return nil
    }
    
    func getPosterUrl(size: PosterSize) -> NSURL? {
        if let posterPath = self.posterPath {
            return NSURL(string: Configuration.baseUrl + size.rawValue + posterPath)
        }
        return nil
    }
}