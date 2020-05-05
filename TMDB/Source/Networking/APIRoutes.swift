//
//  TheMovieAPI.swift
//  TMDB
//
//  Created by Ruan Reis on 04/05/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Foundation

struct APIRoutes {

    // MARK: - Definitions
    enum ImageSize: String {
        case original
        case w780
        case w500
        case h632
    }

    // MARK: - Internal Properties
    static let apiKey: String = "4a2227bffae9ea53eebcaa7d05098303"
    static let apiVersion: Int = 3
    static let apiBaseURL: String = "https://api.themoviedb.org/\(APIRoutes.apiVersion)"
}
