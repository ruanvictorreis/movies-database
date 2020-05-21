//
//  MoviesAPI.swift
//  TMDB
//
//  Created by Ruan Reis on 04/05/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Foundation

struct API {

    // MARK: - Definitions
    enum ImageSize: String {
        case original
        case w780
        case w500
        case w300
        case w200
    }

    // MARK: - Internal Properties
    static let apiKey: String = "4a2227bffae9ea53eebcaa7d05098303"
    static let apiVersion: Int = 3
    static let apiBaseURL: String = "https://api.themoviedb.org/\(MoviesAPI.apiVersion)"
    static let apiImageURL: String = "https://image.tmdb.org/t/p"
    
    static func build(imagePath: String, size: ImageSize) -> String {
        return "\(apiImageURL)/\(size.rawValue)/\(imagePath)"
    }
    
}
