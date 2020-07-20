//
//  MovieListWorkerMock.swift
//  TMDBTests
//
//  Created by Ruan Reis on 20/07/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

@testable import TMDB

class MovieListWorkerMockSuccess: MovieListWorkerProtocol {
    
    var currentPage = 1
    
    func nextPage() {
        currentPage += 1
    }
    
    func fetchMovieList(section: Section,
                        sucess: @escaping MovieListSuccess,
                        failure: @escaping MovieListError) {
        
        sucess(MoviesListResponseMock.build(page: currentPage))
    }
}
