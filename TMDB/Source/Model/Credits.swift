//
//  Credits.swift
//  TMDB
//
//  Created by Ruan Reis on 29/06/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Foundation

struct Credits: Decodable {
    
    let cast: [Cast]
    
    let crew: [Crew]
    
}
