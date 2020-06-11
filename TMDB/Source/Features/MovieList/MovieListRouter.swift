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
    
    // MARK: - VIP properties
    
    weak var viewController: MovieListViewController!
    
    // MARK: - Public functions
    
    func proceedToMovieDetails(movie: Movie) {
        guard let nextScene = MovieDetailsBuider().build(movie: movie)
            else { return }
        
        viewController.navigationController?
            .pushViewController(nextScene, animated: true)
    }
}
