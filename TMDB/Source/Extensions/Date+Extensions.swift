//
//  Date+Extensions.swift
//  TMDB
//
//  Created by Ruan Reis on 01/06/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Foundation

extension Date {

    var formattedString: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        formatter.locale = .current
        return formatter.string(from: self)
    }
}
