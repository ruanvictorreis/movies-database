//
//  MovieTrailerResponse.swift
//  TMDB
//
//  Created by Ruan Reis on 18/06/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Foundation

struct MovieTrailerResponse: Decodable {
    
    let results: [Video]
    
}
