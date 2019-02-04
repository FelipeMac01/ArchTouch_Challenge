//
//  Genres.swift
//  ArchTouch_Challenge
//
//  Created by Pedro Machado on 04/02/19.
//  Copyright © 2019 Felipe Mac. All rights reserved.
//

import Foundation

class Genres {
    
    var id: Int?
    var name: String?
    
    init(dictionary: [String:AnyObject]) {
        
        if let value = dictionary["id"] as? Int? {
            id = value
        }
        if let value = dictionary["name"] as? String {
            name = value
        }
    }
}
