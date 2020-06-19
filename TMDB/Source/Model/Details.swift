//
//  Details.swift
//  TMDB
//
//  Created by Ruan Reis on 18/06/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Foundation

struct Details {
    
    let budget: String
    
    let duration: String
    
    init(_ response: MovieDetailsResponse) {
        self.budget = response.budget.currencyFormat ?? ""
        self.duration = response.runtime.durationFormat ?? ""
    }
}
