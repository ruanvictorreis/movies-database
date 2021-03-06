//
//  Movie.swift
//  TMDB
//
//  Created by Ruan Reis on 04/05/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Foundation

struct Movie: Decodable {

    let id: Int

    let title: String

    let overview: String
    
    let releaseDate: String
    
    let voteAverage: Double
    
    let posterPath: String?
    
    let backdropPath: String?
    
    var relaseDateFormatted: String? {
        releaseDate
            .asDate(format: "yyyy-MM-dd")?
            .stringFormat
    }
}
