//
//  MovieListPresenterProtocol.swift
//  TMDB
//
//  Created by Ruan Reis on 19/05/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Alamofire

protocol MovieListPresenterProtocol {
    
    func showMovieList(_ response: MovieListResponse?)
    
    func showMovieListError(_ error: AFError?)
    
}

class MovieListPresenter: MovieListPresenterProtocol {
    
    // MARK: - VIP properties
    
    var viewController: MovieListViewControllerProtocol!
    
    // MARK: - Public functions
    
    func showMovieList(_ response: MovieListResponse?) {
        guard let moviesList = response?.results else {
            viewController.showMovieListError(
                errorMessage: R.Localizable.errorDescription())
            return
        }
        
        viewController.showMovieList(moviesList)
    }
    
    func showMovieListError(_ error: AFError?) {
        viewController.showMovieListError(
            errorMessage: error?.errorDescription ?? R.Localizable.errorDescription())
    }
    
}
