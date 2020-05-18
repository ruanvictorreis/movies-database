//
//  SnakeCaseDecoder.swift
//  TMDB
//
//  Created by Ruan Reis on 18/05/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Foundation

class SnakeCaseDecoder<T: Decodable>: DefaultDecoder<T> {
    
    override func decode(from data: Data) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try? decoder.decode(expectation.self, from: data)
    }
}
