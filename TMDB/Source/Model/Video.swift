//
//  Video.swift
//  TMDB
//
//  Created by Ruan Reis on 18/06/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Foundation

struct Video: Decodable {
    
    let id: String
    
    let key: String
    
    let name: String
    
    let site: String
    
    let size: Int
    
    let type: String
}
