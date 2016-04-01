//
//  Trailer.swift
//  MovieSenseiTV
//
//  Created by Dan Isacson on 01/04/16.
//  Copyright © 2016 dna. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Trailer {
    
    var id: String?
    
    init(json: JSON) {
        self.id = json["key"].string
    }
    
}