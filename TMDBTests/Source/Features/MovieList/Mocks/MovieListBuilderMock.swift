//
//  MovieListBuilderMock.swift
//  TMDBTests
//
//  Created by Ruan Reis on 25/07/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

@testable import TMDB

class MovieListBuilderMock {
    
    func build(movieListWorker: MovieListWorkerProtocol) -> MovieListViewControllerMock {
        let viewController = MovieListViewControllerMock()
        let presenter = MovieListPresenter()
        let interactor = MovieListInteractor(movieListWorker: movieListWorker)
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
}
