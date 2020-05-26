//
//  MovieListResponse.swift
//  TMDB
//
//  Created by Ruan Reis on 05/05/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Foundation

struct MoviesListResponse: Decodable {
    
    let page: Int
    
    let totalPages: Int
    
    let results: [Movie]
    
    let totalResults: Int
    
}
