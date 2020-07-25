//
//  MovieDetailsSpec.swift
//  TMDBTests
//
//  Created by Ruan Reis on 20/07/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Quick
import Nimble
@testable import TMDB

class MovieDetailsSpec: QuickSpec {
    
    override func spec() {
        var interactor: MovieDetailsInteractor!
        var presenter: MovieDetailsPresenter!
        var viewController: MovieDetailsViewControllerMock!
        
        describe("Movie Details") {
            context("Given that the user selected a movie") {
                afterEach {
                    interactor = nil
                    presenter = nil
                    viewController = nil
                }
                
                beforeEach {
                    viewController = MovieDetailsViewControllerMock()
                    presenter = MovieDetailsPresenter()
                    interactor = MovieDetailsInteractor(
                        movieDetailsWorker: MovieDetailsWorkerSucessMock())
                    
                    interactor.presenter = presenter
                    presenter.viewController = viewController
                }
                
                it("view is presenting the movie details") {
                    interactor.fetchMovieDetails(of: 1)
                    expect(viewController.details).notTo(beNil())
                    expect(viewController.showMovieDetailsCalled).to(beTrue())
                    expect(viewController.details?.duration).to(equal("2h"))
                    expect(viewController.details?.budget).to(equal("$1,000,000.00"))
                    expect(viewController.details?.revenue).to(equal("$2,000,000.00"))
                    expect(viewController.details?.cast.count).to(beGreaterThan(0))
                    expect(viewController.details?.crew.count).to(beGreaterThan(0))
                    expect(viewController.details?.genres.count).to(beGreaterThan(0))
                    expect(viewController.details?.recommendations.count).to(beGreaterThan(0))
                }
            }
            
            context("Given that an error occurred while fetching the movie details") {
                afterEach {
                    interactor = nil
                    presenter = nil
                    viewController = nil
                }
                
                beforeEach {
                    viewController = MovieDetailsViewControllerMock()
                    presenter = MovieDetailsPresenter()
                    interactor = MovieDetailsInteractor(
                        movieDetailsWorker: MovieDetailsWorkerFailureMock())
                    
                    interactor.presenter = presenter
                    presenter.viewController = viewController
                }
                
                it("view is presenting error alert") {
                    interactor.fetchMovieDetails(of: 1)
                    expect(viewController.details).to(beNil())
                    expect(viewController.showMovieDetailsCalled).to(beFalse())
                    expect(viewController.showMovieDetailsErrorCalled).to(beTrue())
                    expect(viewController.errorMessage).to(equal(R.Localizable.errorDescription()))
                }
            }
            
            
            context("Given that the api returns an empty response and status code 200") {
                afterEach {
                    interactor = nil
                    presenter = nil
                    viewController = nil
                }
                
                beforeEach {
                    viewController = MovieDetailsViewControllerMock()
                    presenter = MovieDetailsPresenter()
                    interactor = MovieDetailsInteractor(
                        movieDetailsWorker: MovieDetailsWorkerEmptyMock())
                    
                    interactor.presenter = presenter
                    presenter.viewController = viewController
                }
                
                it("view is presenting error alert when response is empty") {
                    interactor.fetchMovieDetails(of: 1)
                    expect(viewController.details).to(beNil())
                    expect(viewController.showMovieDetailsCalled).to(beFalse())
                    expect(viewController.showMovieDetailsErrorCalled).to(beTrue())
                    expect(viewController.errorMessage).to(equal(R.Localizable.errorDescription()))
                }
            }
        }
    }
}
