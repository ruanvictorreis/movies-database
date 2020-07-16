//
//  Double+Extensions.swift
//  TMDB
//
//  Created by Ruan Reis on 18/06/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Foundation

extension Double {
    
    var currencyFormat: String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en-US")
        return formatter.string(from: NSNumber(value: self))
    }
}
