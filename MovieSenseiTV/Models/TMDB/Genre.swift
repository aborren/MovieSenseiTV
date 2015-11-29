//
//  Genre.swift
//  MovieSenseiTV
//
//  Created by Dan Isacson on 29/11/15.
//  Copyright © 2015 dna. All rights reserved.
//

import Foundation
import SwiftyJSON

class Genre {
    let id: Int?
    let name: String?
    
    init(json: JSON) {
        self.id = json["id"].int
        self.name = json["name"].string
    }
}