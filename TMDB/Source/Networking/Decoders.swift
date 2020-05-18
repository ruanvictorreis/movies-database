//
//  Decoder.swift
//  TMDB
//
//  Created by Ruan Reis on 17/05/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Foundation

protocol Decoder {
    
//    associatedtype T
//
//    var expectation: T { get }
//
//    func decode(from data: Data) -> T?
    
}

class UseDefaultDecoder<T: Decodable>: Decoder {

    var expectation: T.Type
    
    init(expectation: T.Type) {
        self.expectation = expectation
    }
    
    func decode(from data: Data) -> T? {
        return try? JSONDecoder().decode(T.self, from: data)
    }
}

class SnakeCaseDecoder<T: Decodable>: Decoder {

    var expectation: T.Type
    
    init(expectation: T.Type) {
        self.expectation = expectation
    }
    
    func decode(from data: Data) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try? decoder.decode(expectation.self, from: data)
    }
}
