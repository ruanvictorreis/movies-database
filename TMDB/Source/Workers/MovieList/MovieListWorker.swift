//
//  MovieListWorker.swift
//  TMDB
//
//  Created by Ruan Reis on 04/05/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Alamofire

typealias MovieListSuccess = (_ response: MoviesListResponse?) -> Void
typealias MovieListError = (_ error: AFError?) -> Void

protocol MovieListWorkerProtocol {
    
    func fetchMovieList(section: Section,
                        sucess: @escaping MovieListSuccess,
                        failure: @escaping MovieListError)
    
    func nextPage()
    
}

class MovieListWorker: MovieListWorkerProtocol {

    private var currentPage = 1
    
    func fetchMovieList(section: Section,
                        sucess: @escaping MovieListSuccess,
                        failure: @escaping MovieListError) {
        
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
