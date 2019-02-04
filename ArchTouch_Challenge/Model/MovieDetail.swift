//
//  MovieDetail.swift
//  ArchTouch_Challenge
//
//  Created by Pedro Machado on 04/02/19.
//  Copyright © 2019 Felipe Mac. All rights reserved.
//

import Foundation

class MovieDetail {
    
    var adult: Bool?
    var backdrop_path: String?
    //var belongs_to_collection: [belongs_to_collection]?
    var budget: Int?
    //var genres: [genres]?
    var homepage: String?
    var id: Int?
    var imdb_id: String?
    var original_language: String?
    var original_title: String?
    var overview: String?
    var popularity: Double?
    var poster_path: String?
    //var production_companies: [production_companies]?
    //var production_countries: [production_countries]?
    var release_date: String?
    var revenue: Int?
    var runtime: Int?
    //var spoken_languages: [spoken_languages]?
    var status: String?
    var tagline: String?
    var title: String?
    var video: Bool?
    var vote_average: Double?
    var vote_count: Int?
        
    init(dictionary: [String:AnyObject]) {
        if let value = dictionary["adult"] as? Bool {
            adult = value
        }
        if let value = dictionary["backdrop_path"] as? String {
            backdrop_path = value
        }
        if let value = dictionary["budget"] as? Int {
            budget = value
        }
        if let value = dictionary["homepage"] as? String {
            homepage = value
        }
        if let value = dictionary["id"] as? Int {
            id = value
        }
        if let value = dictionary["imdb_id"] as? String {
            imdb_id = value
        }
        if let value = dictionary["original_language"] as? String {
            original_language = value
        }
        if let value = dictionary["original_title"] as? String {
            original_title = value
        }
        if let value = dictionary["overview"] as? String {
            overview = value
        }
        if let value = dictionary["popularity"] as? Double {
            popularity = value
        }
        if let value = dictionary["poster_path"] as? String {
            poster_path = value
        }
        if let value = dictionary["release_date"] as? String {
            release_date = value
        }
        if let value = dictionary["revenue"] as? Int {
            revenue = value
        }
        if let value = dictionary["runtime"] as? Int {
            runtime = value
        }
        if let value = dictionary["status"] as? String {
            status = value
        }
        if let value = dictionary["tagline"] as? String {
            tagline = value
        }
        if let value = dictionary["title"] as? String {
            title = value
        }
        if let value = dictionary["video"] as? Bool {
            video = value
        }
        if let value = dictionary["vote_average"] as? Double {
            vote_average = value
        }
        if let value = dictionary["vote_count"] as? Int {
            vote_count = value
        }
    }
}
