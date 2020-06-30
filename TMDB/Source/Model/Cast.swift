//
//  Cast.swift
//  TMDB
//
//  Created by Ruan Reis on 29/06/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Foundation

struct Cast: Decodable {
    
    let name: String
    
    let character: String
    
    let profilePath: String?
}
