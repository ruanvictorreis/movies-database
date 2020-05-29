//
//  MovieListRouter.swift
//  TMDB
//
//  Created by Ruan Reis on 19/05/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Foundation

protocol MovieListRouterProtocol {
    
    func proceedToMovieDetails(movie: Movie)
    
}

class MovieListRouter: MovieListRouterProtocol {
    
    var viewController: MovieListViewController!
    
    func proceedToMovieDetails(movie: Movie) {
        guard let movieDetails = R.storyboard.main.movieDetails() else {
            return
        }
        
        movieDetails.movie = movie
        
        viewController.navigationController?.pushViewController(movieDetails, animated: true)
    }
    
}
    