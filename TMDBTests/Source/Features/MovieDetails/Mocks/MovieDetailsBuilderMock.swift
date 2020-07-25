//
//  MovieDetailsBuilderMock.swift
//  TMDBTests
//
//  Created by Ruan Reis on 25/07/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

@testable import TMDB

class MovieDetailsBuilderMock {
    
    func build(movieDetailsWorker: MovieDetailsWorkerProtocol) -> MovieDetailsViewControllerMock {
        let viewController = MovieDetailsViewControllerMock()
        let presenter = MovieDetailsPresenter()
        let interactor = MovieDetailsInteractor(movieDetailsWorker: movieDetailsWorker)
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
    
}
