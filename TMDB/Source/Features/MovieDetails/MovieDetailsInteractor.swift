//
//  MovieDetailsInteractor.swift
//  TMDB
//
//  Created by Ruan Reis on 11/06/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Foundation

protocol MovieDetailInteractorProtocol {
    
    func fetchMovieDetails(of movieId: Int)
}

class MovieDetailsInteractor: MovieDetailInteractorProtocol {
    
    // MARK: - VIP properties
    
    var presenter: MovieDetailPresenterProtocol!
    
    // MARK: - Private properties
    
    private let movieDetailsWorker: MovieDetailsWorkerProtocol
    
    // MARK: - Init
    
    init() {
        self.movieDetailsWorker = MovieDetailsWorker()
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
