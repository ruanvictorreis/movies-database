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
    
    func fetchNextPage()
    
    func currentPageLoaded(indexPath: IndexPath)
    
}

class PopularMoviesInteractor: PopularMoviesInteractorProtocol {
    
    var presenter: PopularMoviesPresenterProtocol!
    
    private var isLoading = false
    
    private var rowsCount: Int = 0
    
    private let popularMoviesWorker: PopularMoviesWorkerProtocol
    
    init() {
        self.popularMoviesWorker = PopularMoviesWorker()
    }
    
    func fetchPopularMovies() {
        isLoading = true
        
        popularMoviesWorker
            .fetchPopularMovies(
                sucess: { [weak self] response in
                    self?.presenter.showPopularMovies(response)
                },
                failure: { [weak self] error in
                    self?.presenter.showPopularMoviesError(error)
            })
    }
    
    func fetchNextPage() {
        if !isLoading {
            popularMoviesWorker.nextPage()
            fetchPopularMovies()
        }
    }
    
    func currentPageLoaded(indexPath: IndexPath) {
        if indexPath.row > rowsCount {
            isLoading = false
            rowsCount = indexPath.row
        }
    }
}
