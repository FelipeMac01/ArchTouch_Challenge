//
//  Movie.swift
//  ArchTouch_Challenge
//
//  Created by Pedro Machado on 04/02/19.
//  Copyright © 2019 Felipe Mac. All rights reserved.
//

import Foundation

class Movie {
    
    var vote_count: Int?
    var id: Int?
    var video: Bool?
    var vote_average: Double?
    var title: String?
    var popularity: Double?
    var poster_path: String?
    var original_language: String?
    var original_title: String?
    var genre_ids: [Int]?
    var backdrop_path: String?
    var adult: Bool?
    var overview: String?
    var release_date: String?
    
    init(dictionary: [String:AnyObject]) {
        
        if let value = dictionary["vote_count"] as? Int {
            vote_count = value
        }
        if let value = dictionary["id"] as? Int {
            id = value
        }
        if let value = dictionary["video"] as? Bool {
            video = value
        }
        if let value = dictionary["vote_average"] as? Double {
            vote_average = value
        }
        if let value = dictionary["title"] as? String {
            title = value
        }
        if let value = dictionary["popularity"] as? Double {
            popularity = value
        }
        if let value = dictionary["poster_path"] as? String {
            poster_path = value
        }
        if let value = dictionary["original_language"] as? String {
            original_language = value
        }
        if let value = dictionary["original_title"] as? String {
            original_title = value
        }
        if let value = dictionary["genre_ids"] as? [Int] {
            genre_ids = value
        }
        if let value = dictionary["backdrop_path"] as? String {
            backdrop_path = value
        }
        if let value = dictionary["adult"] as? Bool {
            adult = value
        }
        if let value = dictionary["overview"] as? String {
            overview = value
        }
        if let value = dictionary["release_date"] as? String {
            release_date = value
        }
    }
}
