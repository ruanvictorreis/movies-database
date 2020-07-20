//
//  MovieListSpec.swift
//  TMDBTests
//
//  Created by Ruan Reis on 19/07/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Quick
import Nimble
@testable import TMDB

class MovieListSpec: QuickSpec {
    
    override func spec() {
        var interactor: MovieListInteractor!
        var presenter: MovieListPresenter!
        var viewController: MovieListViewControllerMock!
            
        describe("List of movies") {
            context("Should show a list of popular movies") {
                afterEach {
                    interactor = nil
                    presenter = nil
                    viewController = nil
                }
                
                beforeEach {
                    let movieListWorker = MovieListWorkerSuccessMock()
                    interactor = MovieListInteractor(movieListWorker: movieListWorker)
                    viewController = MovieListViewControllerMock()
                    presenter = MovieListPresenter()
                    interactor.presenter = presenter
                    presenter.viewController = viewController
                }
                
                it("view is presenting movie list from first page") {
                    interactor.fetchMovieList()
                    expect(viewController.movieList).to(haveCount(3))
                    expect(viewController.showMovieListCalled).to(beTrue())
                    
                    let firstMovie = viewController.movieList.first
                    expect(firstMovie?.title).to(equal("Joker"))
                    
                    let lastMovie = viewController.movieList.last
                    expect(lastMovie?.title).to(equal("Parasite"))
                }
                
                it("view is presenting movie list from the next page") {
                    interactor.fetchMovieList()
                    interactor.fetchNextPage()
                    expect(viewController.movieList).to(haveCount(6))
                    expect(viewController.showMovieListCalled).to(beTrue())
                    
                    let firstMovie = viewController.movieList.first
                    expect(firstMovie?.title).to(equal("Joker"))
                    
                    let lastMovie = viewController.movieList.last
                    expect(lastMovie?.title).to(equal("1917"))
                }
            }
            
            context("something went wrong when fetching the movies") {
                afterEach {
                    interactor = nil
                    presenter = nil
                    viewController = nil
                }
                
                beforeEach {
                    let movieListWorker = MovieListWorkerFailureMock()
                    interactor = MovieListInteractor(movieListWorker: movieListWorker)
                    viewController = MovieListViewControllerMock()
                    presenter = MovieListPresenter()
                    interactor.presenter = presenter
                    presenter.viewController = viewController
                }
                
                it("view is presenting error alert") {
                    interactor.fetchMovieList()
                    expect(viewController.movieList).to(haveCount(0))
                    expect(viewController.showMovieListCalled).to(beFalse())
                    expect(viewController.showMovieListErrorCalled).to(beTrue())
                    expect(viewController.errorMessage).to(equal(R.Localizable.errorDescription()))
                }
                
                it("view is presenting error alert also when fetching next page") {
                    interactor.fetchNextPage()
                    expect(viewController.movieList).to(haveCount(0))
                    expect(viewController.showMovieListCalled).to(beFalse())
                    expect(viewController.showMovieListErrorCalled).to(beTrue())
                    expect(viewController.errorMessage).to(equal(R.Localizable.errorDescription()))
                }
            }
            
            context("api returns an empty response and status code 200") {
                afterEach {
                    interactor = nil
                    presenter = nil
                    viewController = nil
                }
                
                beforeEach {
                    let movieListWorker = MovieListWorkerEmptyMock()
                    interactor = MovieListInteractor(movieListWorker: movieListWorker)
                    viewController = MovieListViewControllerMock()
                    presenter = MovieListPresenter()
                    interactor.presenter = presenter
                    presenter.viewController = viewController
                }
                
                it("view is presenting error alert when response is empty") {
                    interactor.fetchNextPage()
                    expect(viewController.movieList).to(haveCount(0))
                    expect(viewController.showMovieListCalled).to(beFalse())
                    expect(viewController.showMovieListErrorCalled).to(beTrue())
                    expect(viewController.errorMessage).to(equal(R.Localizable.errorDescription()))
                }
                
                it("view is presenting error alert also when fetching next page") {
                    interactor.fetchNextPage()
                    expect(viewController.movieList).to(haveCount(0))
                    expect(viewController.showMovieListCalled).to(beFalse())
                    expect(viewController.showMovieListErrorCalled).to(beTrue())
                    expect(viewController.errorMessage).to(equal(R.Localizable.errorDescription()))
                }
            }
        }
    }
}
