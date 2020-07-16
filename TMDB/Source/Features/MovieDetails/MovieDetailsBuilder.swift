//
//  MovieDetailsBuilder.swift
//  TMDB
//
//  Created by Ruan Reis on 11/06/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Foundation

class MovieDetailsBuider {
    
    // MARK: - Public functions
    
    func build(movie: Movie) -> MovieDetailsViewController? {
        let viewController = R.storyboard.main.movieDetails()
        let interactor = MovieDetailsInteractor()
        let presenter = MovieDetailsPresenter()
        let router = MovieDetailsRouter()
        
        viewController?.interactor = interactor
        viewController?.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        
        viewController?.movie = movie
        
        return viewController
    }
    
}
