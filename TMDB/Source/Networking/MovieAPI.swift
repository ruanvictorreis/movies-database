//
//  MoviesAPI.swift
//  TMDB
//
//  Created by Ruan Reis on 04/05/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Foundation

struct MovieAPI {

    // MARK: - Definitions
    enum ImageSize: String {
        case original
        case w780
        case w500
        case w300
        case w200
    }

    // MARK: - Internal Properties
    static let key: String = "4a2227bffae9ea53eebcaa7d05098303"
    static let version: Int = 3
    static let baseURL: String = "https://api.themoviedb.org/\(MovieAPI.version)"
    static let imageURL: String = "https://image.tmdb.org/t/p"
    
    static var language: String {
        return Locale.current.collatorIdentifier ?? R.Localizable.language()
    }
    
    static func build(image: String, size: ImageSize) -> String {
        return "\(MovieAPI.imageURL)/\(size.rawValue)/\(image)"
    }
    
    static func build(section: Section, page: Int) -> String {
        return "\(MovieAPI.baseURL)/movie/\(section.rawValue)"
            + "?api_key=\(MovieAPI.key)&language=\(language)&page=\(page)"
    }
    
    static func build(detailsOf id: Int) -> String {
        return "\(MovieAPI.baseURL)/movie/\(id)?api_key=\(MovieAPI.key)"
            + "&language=\(language)&append_to_response=videos,credits,recommendations"
    }
}
