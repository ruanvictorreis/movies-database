//
//  MovieDetailsResponse.swift
//  TMDB
//
//  Created by Ruan Reis on 17/06/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Foundation

struct MovieDetailsResponse: Decodable {
    
    let budget: Int
    
    let revenue: Int
    
    let runtime: Int
    
    let genres: [Genre]
    
    let videos: MovieTrailerResponse
    
}
