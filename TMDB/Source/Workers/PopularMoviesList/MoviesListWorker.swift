//
//  MoviesListWorker.swift
//  TMDB
//
//  Created by Ruan Reis on 04/05/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Alamofire

class MoviesListWorker {
    
    private let baseURL: String = APIRoutes.apiBaseURL
    
    private let apiKey: String = APIRoutes.apiKey
    
    private let enconding = JSONEncoding.default
    
    private let section: String = "popular"
    
    private let page: String = "1"
    
    func fetchPopularMovies() {
        let url = "\(baseURL)/movie/\(section)?api_key=\(apiKey)&page=\(page)"
        
        return Network().request(
            data: RequestData(url: url, method: .get, encoding: enconding),
            decoder: SnakeCaseDecoder(expectation: MoviesListResponse.self),
            success: { result in
                print(String(describing: result))
        },
            failure: { error in
                print(String(describing: error))
        })
    }
}
