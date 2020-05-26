//
//  MovieListPresenterProtocol.swift
//  TMDB
//
//  Created by Ruan Reis on 19/05/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Alamofire

protocol MovieListPresenterProtocol {
    
    func showMoviesList(_ response: MoviesListResponse?)
    
    func showMovieListError(_ error: AFError?)
    
}

class MovieListPresenter: MovieListPresenterProtocol {
    
    var viewController: MovieListViewControllerProtocol!
    
    init() {
        
    }
    
    func showMoviesList(_ response: MoviesListResponse?) {
        guard let moviesList = response?.results else { return }
        viewController.showMoviesList(moviesList)
    }
    
    func showMovieListError(_ error: AFError?) {
        let message = error?.errorDescription ?? "default error"
        viewController.showMovieListError(errorMessage: message)
    }
    
}
