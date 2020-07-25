//
//  MovieDetailsPresenter.swift
//  TMDB
//
//  Created by Ruan Reis on 11/06/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Alamofire
import Foundation

protocol MovieDetailsPresenterProtocol {
    
    func showMovieDetails(_ response: MovieDetailsResponse?)
    
    func showMovieDetailsError(_ error: AFError?)
    
}

class MovieDetailsPresenter: MovieDetailsPresenterProtocol {
    
    // MARK: - VIP properties
    
    weak var viewController: MovieDetailsViewControllerProtocol!
    
    // MARK: - Public functions
    
    func showMovieDetails(_ response: MovieDetailsResponse?) {
        guard let movieDetails = response else {
            showMovieDetailsError()
            return
        }
        
        let details = Details(movieDetails)
        viewController.showMovieDetails(details)
    }
    
    func showMovieDetailsError(_ error: AFError? = nil) {
        viewController.showMovieDetailsError(
            errorMessage: error?.errorDescription ?? R.Localizable.errorDescription())
    }
}
