//
//  MovieDetailsWorkerMock.swift
//  TMDBTests
//
//  Created by Ruan Reis on 21/07/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Alamofire
@testable import TMDB

class MovieDetailsWorkerSucessMock: MovieDetailsWorkerProtocol {
    
    func fetchMovieDetails(of movieId: Int,
                           sucess: @escaping MovieDetailsSuccess,
                           failure: @escaping MovieDetailsError) {
        sucess(MovieDetailsResponseMock.build())
    }
}

class MovieDetailsWorkerFailureMock: MovieDetailsWorkerProtocol {
    
    func fetchMovieDetails(of movieId: Int,
                           sucess: @escaping MovieDetailsSuccess,
                           failure: @escaping MovieDetailsError) {
        failure(nil)
    }
}

class MovieDetailsWorkerEmptyMock: MovieDetailsWorkerProtocol {
    
    func fetchMovieDetails(of movieId: Int,
                           sucess: @escaping MovieDetailsSuccess,
                           failure: @escaping MovieDetailsError) {
        sucess(nil)
    }
}
