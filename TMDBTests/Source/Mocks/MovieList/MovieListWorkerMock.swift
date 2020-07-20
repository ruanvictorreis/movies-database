//
//  MovieListWorkerMock.swift
//  TMDBTests
//
//  Created by Ruan Reis on 20/07/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Alamofire
@testable import TMDB

class MovieListWorkerSuccessMock: MovieListWorkerProtocol {
    
    var currentPage = 1
    
    func nextPage() {
        currentPage += 1
    }
    
    func fetchMovieList(section: Section,
                        sucess: @escaping MovieListSuccess,
                        failure: @escaping MovieListError) {
        sucess(
            MoviesListResponseBuilder()
                .success(page: currentPage))
    }
}

class MovieListWorkerFailureMock: MovieListWorkerProtocol {
    
    var currentPage = 1
    
    func nextPage() {
        currentPage += 1
    }
    
    func fetchMovieList(section: Section,
                        sucess: @escaping MovieListSuccess,
                        failure: @escaping MovieListError) {
        failure(nil)
    }
}

class MovieListWorkerEmptyMock: MovieListWorkerProtocol {
    
    var currentPage = 1
    
    func nextPage() {
        currentPage += 1
    }
    
    func fetchMovieList(section: Section,
                        sucess: @escaping MovieListSuccess,
                        failure: @escaping MovieListError) {
        sucess(nil)
    }
}
