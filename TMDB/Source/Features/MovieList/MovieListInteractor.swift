//
//  MovieListInteractor.swift
//  TMDB
//
//  Created by Ruan Reis on 19/05/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Foundation

protocol MovieListInteractorProtocol {
    
    func fetchMovieList()
    
    func fetchNextPage()
    
}

class MovieListInteractor: MovieListInteractorProtocol {
    
    // MARK: - VIP properties
    
    var presenter: MovieListPresenterProtocol!
    
    // MARK: - Private properties
    
    private var section: Section = .popular
    
    private let movieListWorker: MovieListWorkerProtocol
    
    // MARK: - Inits
    
    init() {
        self.movieListWorker = MovieListWorker()
    }
    
    init(movieListWorker: MovieListWorkerProtocol) {
        self.movieListWorker = movieListWorker
    }
    
    // MARK: - Public functions
    
    func fetchMovieList() {
        movieListWorker.fetchMovieList(
            section: section,
            sucess: { [weak self] response in
                self?.presenter.showMoviesList(response)
            },
            failure: { [weak self] error in
                self?.presenter.showMovieListError(error)
            })
    }
    
    func fetchNextPage() {
        movieListWorker.nextPage()
        fetchMovieList()
    }
}
