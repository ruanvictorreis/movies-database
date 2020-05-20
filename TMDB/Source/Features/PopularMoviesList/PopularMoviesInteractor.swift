//
//  PopularMoviesInteractor.swift
//  TMDB
//
//  Created by Ruan Reis on 19/05/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Foundation

protocol PopularMoviesInteractorProtocol {
    
    func fetchPopularMovies()
    
}

class PopularMoviesInteractor: PopularMoviesInteractorProtocol {
    
    var presenter: PopularMoviesPresenterProtocol!
    
    private let popularMoviesWorker: PopularMoviesWorkerProtocol
    
    init() {
        self.popularMoviesWorker = PopularMoviesWorker()
    }
    
    func fetchPopularMovies() {
        popularMoviesWorker
            .fetchPopularMovies(
                sucess: { [weak self] response in
                    self?.presenter.showPopularMovies(response)
                },
                failure: { [weak self] error in
                    self?.presenter.showPopularMoviesError(error)
            })
    }
}
