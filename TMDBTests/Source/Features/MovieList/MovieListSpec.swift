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
        var viewController: MovieListViewControllerMock!
        
        describe("List of movies") {
            context("Given that the app starts presenting a list of movies") {
                afterEach {
                    viewController = nil
                }
                
                beforeEach {
                    viewController = MovieListBuilderMock()
                        .build(movieListWorker: MovieListWorkerSuccessMock())
                }
                
                it("view is presenting movie list from first page") {
                    viewController.interactor.fetchMovieList()
                    expect(viewController.movieList).to(haveCount(3))
                    expect(viewController.showMovieListCalled).to(beTrue())
                    
                    let firstMovie = viewController.movieList.first
                    expect(firstMovie?.title).to(equal("Joker"))
                    
                    let lastMovie = viewController.movieList.last
                    expect(lastMovie?.title).to(equal("Parasite"))
                }
                
                it("view is presenting movie list from the next page") {
                    viewController.interactor.fetchMovieList()
                    viewController.interactor.fetchNextPage()
                    expect(viewController.movieList).to(haveCount(6))
                    expect(viewController.showMovieListCalled).to(beTrue())
                    
                    let firstMovie = viewController.movieList.first
                    expect(firstMovie?.title).to(equal("Joker"))
                    
                    let lastMovie = viewController.movieList.last
                    expect(lastMovie?.title).to(equal("1917"))
                }
            }
            
            context("Given that an error occurred while fetching the list of movies") {
                afterEach {
                    viewController = nil
                }
                
                beforeEach {
                    viewController = MovieListBuilderMock()
                        .build(movieListWorker: MovieListWorkerFailureMock())
                }
                
                it("view is presenting error alert") {
                    viewController.interactor.fetchMovieList()
                    expect(viewController.movieList).to(haveCount(0))
                    expect(viewController.showMovieListCalled).to(beFalse())
                    expect(viewController.showMovieListErrorCalled).to(beTrue())
                    expect(viewController.errorMessage).to(equal(R.Localizable.errorDescription()))
                }
                
                it("view is presenting error alert also when fetching next page") {
                    viewController.interactor.fetchNextPage()
                    expect(viewController.movieList).to(haveCount(0))
                    expect(viewController.showMovieListCalled).to(beFalse())
                    expect(viewController.showMovieListErrorCalled).to(beTrue())
                    expect(viewController.errorMessage).to(equal(R.Localizable.errorDescription()))
                }
            }
            
            context("Given that the api returns an empty response and status code 200") {
                afterEach {
                    viewController = nil
                }
                
                beforeEach {
                    viewController = MovieListBuilderMock()
                        .build(movieListWorker: MovieListWorkerEmptyMock())
                }
                
                it("view is presenting error alert when response is empty") {
                    viewController.interactor.fetchNextPage()
                    expect(viewController.movieList).to(haveCount(0))
                    expect(viewController.showMovieListCalled).to(beFalse())
                    expect(viewController.showMovieListErrorCalled).to(beTrue())
                    expect(viewController.errorMessage).to(equal(R.Localizable.errorDescription()))
                }
                
                it("view is presenting error alert also when fetching next page") {
                    viewController.interactor.fetchNextPage()
                    expect(viewController.movieList).to(haveCount(0))
                    expect(viewController.showMovieListCalled).to(beFalse())
                    expect(viewController.showMovieListErrorCalled).to(beTrue())
                    expect(viewController.errorMessage).to(equal(R.Localizable.errorDescription()))
                }
            }
        }
    }
}
