//
//  MovieDetailsRouter.swift
//  TMDB
//
//  Created by Ruan Reis on 11/06/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Foundation

protocol MovieDetailRouterProtocol {
    
    func proceedToMovieDetails(movie: Movie)
}

class MovieDetailsRouter: MovieDetailRouterProtocol {
    
    // MARK: - VIP properties
    
    weak var viewController: MovieDetailsViewController!
    
    // MARK: - Public functions
    
    func proceedToMovieDetails(movie: Movie) {
        guard let nextScene = MovieDetailsBuider().build(movie: movie)
            else { return }
        
        viewController.navigationController?
            .pushViewController(nextScene, animated: true)
    }
}
