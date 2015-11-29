//
//  Movie.swift
//  MovieSenseiTV
//
//  Created by Dan Isacson on 29/11/15.
//  Copyright © 2015 dna. All rights reserved.
//

import Foundation
import SwiftyJSON

class Movie {
    let title: String?
    let adult: Bool?
    private let backdropPath: String?
    
    init(json: JSON){
        self.title = json["title"].string
        self.adult = json["adult"].bool
        self.backdropPath = json["backdrop_path"].string
    }
    
    func getBackdropUrl(size: BackdropSize)->NSURL?{
        if let backdropPath = self.backdropPath {
            return NSURL(string: Configuration.baseUrl + size.rawValue + backdropPath)
        }
        return nil
    }
}