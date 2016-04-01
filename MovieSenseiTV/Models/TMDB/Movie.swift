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
    var id: Int?
    let title: String?
    let adult: Bool?
    private let backdropPath: String?
    private let posterPath: String?
    let overview: String?
    let releaseDate: String?
    let runtime: Int?
    private let genres: [Genre]
    let status: String?
    let tagline: String?
    let voteAverage: NSNumber?
    let voteCount: Int?
    var trailers: [Trailer] = []
    
    init(json: JSON) {
        self.id = json["id"].int
        self.title = json["title"].string
        self.adult = json["adult"].bool
        self.backdropPath = json["backdrop_path"].string
        self.posterPath = json["poster_path"].string
        self.overview = json["overview"].string
        self.releaseDate = json["release_date"].string
        self.runtime = json["runtime"].int
        self.genres = Movie.initGenresFromJSON(json["genres"])
        self.status = json["status"].string
        self.tagline = json["tagline"].string
        self.voteAverage = json["vote_average"].number
        self.voteCount = json["vote_count"].int
        
        if let trailerJSONArray = json["videos"]["results"].array {
            for trailerJSON in trailerJSONArray {
                self.trailers.append(Trailer(json: trailerJSON))
            }
            
            self.trailers.forEach { trailer in
                debugPrint(trailer.id)
            }
        }
    }
    
    private static func initGenresFromJSON(json: JSON) -> [Genre] {
        var genres: [Genre] = []
        for i in 0..<json.count {
            let genre = Genre(json: json[i])
            genres.append(genre)
        }
        return genres
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
    
    func getGenreNamesSeparatedBy(separator: String) -> String {
        var genresString = ""
        for genre in self.genres {
            if let name = genre.name {
                genresString += name
            }
            
            if genre.id != genres.last?.id {
                genresString += separator
            }
        }
        return genresString
    }
}