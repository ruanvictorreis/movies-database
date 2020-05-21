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
    
    func fetchPopularMovies(sucess: @escaping PopularMoviesSuccess, failure: @escaping PopularMoviesError) {
        let enconding = JSONEncoding.default
        let url = MovieAPI.build(section: .popular, page: 1)
        
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
