//
//  PopularMoviesWorker.swift
//  TMDB
//
//  Created by Ruan Reis on 04/05/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Alamofire

typealias PopularMoviesSuccess = (_ response: MoviesListResponse?) -> Void
typealias PopularMoviesError = (_ error: AFError?) -> Void

protocol PopularMoviesWorkerProtocol {
    
    func fetchPopularMovies(sucess: @escaping PopularMoviesSuccess, failure: @escaping PopularMoviesError)
    
}

class PopularMoviesWorker: PopularMoviesWorkerProtocol {
    
    private let baseURL: String = APIRoutes.apiBaseURL
    
    private let apiKey: String = APIRoutes.apiKey
    
    private let enconding = JSONEncoding.default
    
    private let section: String = "popular"
    
    private let page: String = "1"
    
    func fetchPopularMovies(sucess: @escaping PopularMoviesSuccess, failure: @escaping PopularMoviesError) {
        let url = "\(baseURL)/movie/\(section)?api_key=\(apiKey)&page=\(page)"
        
        Network().request(
            data: RequestData(url: url, method: .get, encoding: enconding),
            decoder: SnakeCaseDecoder(expectation: MoviesListResponse.self),
            success: { response in
                sucess(response)
            },
            failure: {error in
                failure(error)
            })
    }
}
