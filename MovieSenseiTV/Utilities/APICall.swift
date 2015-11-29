//
//  APICall.swift
//  MovieSenseiTV
//
//  Created by Dan Isacson on 29/11/15.
//  Copyright © 2015 dna. All rights reserved.
//

import Foundation

struct APICall {
    static let baseUrl = "http://api.themoviedb.org/3/"
    static func movie(id: String)-> String {
        return baseUrl + "movie/\(id)"
    }
}