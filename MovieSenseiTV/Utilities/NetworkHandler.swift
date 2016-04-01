//
//  NetworkHandler.swift
//  MovieSenseiTV
//
//  Created by Dan Isacson on 29/11/15.
//  Copyright © 2015 dna. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkHandler {
    // TODO: - this key should be hidden from the public repository.
    private static let APIKey = "9e4746b32f8e924b795985cc297a518f"
    private static let parameter: [String:AnyObject] = ["api_key":NetworkHandler.APIKey]
    
    static func getMovieById(id: String, callback: (movie: Movie?, error: NSError?)->() ) {
        Alamofire.request(.GET, APICall.movie(id), parameters: NetworkHandler.parameter)
        .responseJSON { response in
            switch response.result {
            case .Success(let data):
                let movie = Movie(json: JSON(data))
                callback(movie: movie, error: nil)
            case .Failure(let error):
                callback(movie: nil, error: error)
            }
        }
    }
    
    private static func getMoviePreviewListForAPICall(apiCall: String, page: Int, callback: (movies: [MoviePreview]?, error: NSError?)->()) {
        var parameters = self.parameter
        parameters["page"] = page
        Alamofire.request(.GET, apiCall, parameters: parameters)
            .responseJSON { response in
                switch response.result {
                case .Success(let data):
                    let json = JSON(data)["results"]
                    var moviePreviews: [MoviePreview] = []
            
                    for i in 0..<json.count {
                        moviePreviews.append(MoviePreview(json: json[i]))
                    }
                    
                    callback(movies: moviePreviews, error: nil)
                case .Failure(let error):
                    callback(movies: nil, error: error)
                }
        }
    }
    
    static func getMoviesNowPlaying(page: Int, callback: (movies: [MoviePreview]?, error: NSError?)->()) {
        NetworkHandler.getMoviePreviewListForAPICall(APICall.movieNowPlaying, page: page, callback: callback)
    }
    
    static func getMoviesPopular(page: Int, callback: (movies: [MoviePreview]?, error: NSError?)->()) {
        NetworkHandler.getMoviePreviewListForAPICall(APICall.moviePopular, page: page, callback: callback)
    }
    
    static func getMoviesTopRated(page: Int, callback: (movies: [MoviePreview]?, error: NSError?)->()) {
        NetworkHandler.getMoviePreviewListForAPICall(APICall.movieTopRated, page: page, callback: callback)
    }
    
    static func getMoviesUpcoming(page: Int, callback: (movies: [MoviePreview]?, error: NSError?)->()) {
        NetworkHandler.getMoviePreviewListForAPICall(APICall.movieUpcoming, page: page, callback: callback)
    }
    
}