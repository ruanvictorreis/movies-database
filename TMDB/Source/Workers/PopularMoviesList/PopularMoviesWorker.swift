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
    
    func nextPage()
    
}

class PopularMoviesWorker: PopularMoviesWorkerProtocol {

    private var currentPage = 1
    
    private var section: Section = .popular
    
    func fetchPopularMovies(sucess: @escaping PopularMoviesSuccess, failure: @escaping PopularMoviesError) {
        let enconding = JSONEncoding.default
        let url = MovieAPI.build(section: section, page: currentPage)
        
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
    
    func nextPage() {
        self.currentPage += 1
    }
}
