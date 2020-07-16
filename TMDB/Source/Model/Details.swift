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
    
    let cast: [Cast]
    
    let crew: [Crew]
    
    let recommendations: [Movie]
    
    init(_ response: MovieDetailsResponse) {
        self.budget = response.budget.currencyFormat ?? ""
        self.revenue = response.revenue.currencyFormat ?? ""
        self.duration = response.runtime.durationFormat ?? ""
        
        self.cast = Array(response
            .credits.cast
            .prefix(5))
        
        self.crew = Array(response
            .credits.crew
            .prefix(5))
        
        self.genres = response.genres
            .prefix(3)
            .map({ $0.name })
            .joined(separator: ", ")
        
        self.recommendations = response.recommendations.results
    }
}
