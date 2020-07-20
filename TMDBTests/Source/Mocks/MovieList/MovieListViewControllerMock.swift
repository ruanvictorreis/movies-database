//
//  MovieListViewControllerMock.swift
//  TMDBTests
//
//  Created by Ruan Reis on 19/07/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

@testable import TMDB

class MovieListViewControllerMock: MovieListViewControllerProtocol {
    
    var movieList: [Movie] = []
    
    var errorMessage: String?
    
    var showMovieListCalled = false
    
    var showMovieListErrorCalled = false
    
    func showMovieList(_ movies: [Movie]) {
        self.movieList.append(contentsOf: movies)
        self.showMovieListCalled = true
    }
    
    func showMovieListError(errorMessage: String) {
        self.errorMessage = errorMessage
        self.showMovieListErrorCalled = true
    }
}
