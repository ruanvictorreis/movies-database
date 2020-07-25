//
//  MovieDetailsInteractor.swift
//  TMDB
//
//  Created by Ruan Reis on 11/06/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Foundation

protocol MovieDetailsInteractorProtocol {
    
    func fetchMovieDetails(of movieId: Int)
}

class MovieDetailsInteractor: MovieDetailsInteractorProtocol {
    
    // MARK: - VIP properties
    
    var presenter: MovieDetailsPresenterProtocol!
    
    // MARK: - Private properties
    
    private let movieDetailsWorker: MovieDetailsWorkerProtocol
    
    // MARK: - Inits
    
    init() {
        self.movieDetailsWorker = MovieDetailsWorker()
    }
    
    init(movieDetailsWorker: MovieDetailsWorkerProtocol) {
        self.movieDetailsWorker = movieDetailsWorker
    }
    
    // MARK: - Public functions
    
    func fetchMovieDetails(of movieId: Int) {
        movieDetailsWorker.fetchMovieDetails(
            of: movieId,
            sucess: { [weak self] response in
                self?.presenter.showMovieDetails(response)
            },
            failure: { [weak self] error in
                self?.presenter.showMovieDetailsError(error)
            })
    }
}
