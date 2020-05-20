//
//  PopularMoviesPresenter.swift
//  TMDB
//
//  Created by Ruan Reis on 19/05/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Alamofire

protocol PopularMoviesPresenterProtocol {
    
    func showPopularMovies(_ response: MoviesListResponse?)
    
    func showPopularMoviesError(_ error: AFError?)
    
}

class PopularMoviesPresenter: PopularMoviesPresenterProtocol {
    
    var viewController: PopularMoviesViewControllerProtocol!
    
    init() {
        
    }
    
    func showPopularMovies(_ response: MoviesListResponse?) {
        guard let moviesList = response?.results else { return }
        viewController.showPopularMoviesList(moviesList)
    }
    
    func showPopularMoviesError(_ error: AFError?) {
        
    }
    
}
