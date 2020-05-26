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
    
    var presenter: MovieListPresenterProtocol!
    
    private var section: Section = .popular
    
    private let movieListWorker: MovieListWorkerProtocol
    
    init() {
        self.movieListWorker = MovieListWorker()
    }
    
    func fetchMovieList() {
        movieListWorker
            .fetchMovieList(
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
