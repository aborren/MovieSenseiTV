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
    private static let parameter = ["api_key":NetworkHandler.APIKey]
    
    class func getMovieById(id: String, callback: (movie: Movie?, error: NSError?)->()){
        debugPrint(APICall.movie("550"))
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
}