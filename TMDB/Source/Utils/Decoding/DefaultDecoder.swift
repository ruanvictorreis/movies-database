//
//  DefaultDecoder.swift
//  TMDB
//
//  Created by Ruan Reis on 17/05/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Foundation

class DefaultDecoder<T: Decodable> {
    
    var expectation: T.Type
    
    init(expectation: T.Type) {
        self.expectation = expectation
    }
    
    func decode(from data: Data) -> T? {
        return try? JSONDecoder().decode(T.self, from: data)
    }
}
