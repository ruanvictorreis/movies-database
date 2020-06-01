//
//  String+Extensions.swift
//  TMDB
//
//  Created by Ruan Reis on 01/06/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Foundation

extension String {
    
    func asDate(format: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.calendar = Calendar(identifier: .gregorian)
        return formatter.date(from: self)
    }
}
