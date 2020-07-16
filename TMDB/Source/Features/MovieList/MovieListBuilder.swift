//
//  MovieListBuilder.swift
//  TMDB
//
//  Created by Ruan Reis on 19/05/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Foundation

class MovieListBuilder {
    
    // MARK: - Public functions
    
    func build() -> MovieListViewController? {
        let viewController = R.storyboard.main.movieListViewController()
        let interactor = MovieListInteractor()
        let presenter = MovieListPresenter()
        let router = MovieListRouter()
        
        viewController?.interactor = interactor
        viewController?.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}
