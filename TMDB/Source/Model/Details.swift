//
//  Details.swift
//  TMDB
//
//  Created by Ruan Reis on 18/06/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Foundation

struct Details {
    
    let genres: String
    
    let budget: String
    
    let revenue: String
    
    let duration: String
    
    private let genresCount = 3
    
    private let separator = ", "
    
    init(_ response: MovieDetailsResponse) {
        self.budget = response.budget.currencyFormat ?? ""
        self.revenue = response.revenue.currencyFormat ?? ""
        self.duration = response.runtime.durationFormat ?? ""
        
        self.genres = response.genres
            .prefix(genresCount)
            .map({ $0.name })
            .joined(separator: separator)
    }
}
