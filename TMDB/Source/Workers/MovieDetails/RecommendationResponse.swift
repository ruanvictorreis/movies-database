//
//  RecommendationResponse.swift
//  TMDB
//
//  Created by Ruan Reis on 15/07/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Foundation

struct RecommendationResponse: Decodable {
    
    let page: Int
    
    let results: [Movie]
}
