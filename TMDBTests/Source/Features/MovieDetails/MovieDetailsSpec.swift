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
        var viewController: MovieDetailsViewControllerMock!
        
        describe("Movie Details") {
            context("Given that the MovieDetails scene has initialized") {
                it("All components of the architecture must be initialized") {
                    let interactor = MovieDetailsInteractor()
                    expect(interactor).notTo(beNil())
                    
                    let presenter = MovieDetailsPresenter()
                    expect(presenter).notTo(beNil())
                }
            }
            
            context("Given that the user selected a movie") {
                afterEach {
                    viewController = nil
                }
                
                beforeEach {
                    viewController = MovieDetailsBuilderMock()
                        .build(movieDetailsWorker: MovieDetailsWorkerSucessMock())
                }
                
                it("view is presenting the movie details") {
                    viewController.interactor.fetchMovieDetails(of: 1)
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
                    viewController = nil
                }
                
                beforeEach {
                    viewController = MovieDetailsBuilderMock()
                        .build(movieDetailsWorker: MovieDetailsWorkerFailureMock())
                }
                
                it("view is presenting error alert") {
                    viewController.interactor.fetchMovieDetails(of: 1)
                    expect(viewController.details).to(beNil())
                    expect(viewController.showMovieDetailsCalled).to(beFalse())
                    expect(viewController.showMovieDetailsErrorCalled).to(beTrue())
                    expect(viewController.errorMessage).to(equal(R.Localizable.errorDescription()))
                }
            }
            
            
            context("Given that the api returns an empty response and status code 200") {
                afterEach {
                    viewController = nil
                }
                
                beforeEach {
                    viewController = MovieDetailsBuilderMock()
                        .build(movieDetailsWorker: MovieDetailsWorkerEmptyMock())
                }
                
                it("view is presenting error alert when response is empty") {
                    viewController.interactor.fetchMovieDetails(of: 1)
                    expect(viewController.details).to(beNil())
                    expect(viewController.showMovieDetailsCalled).to(beFalse())
                    expect(viewController.showMovieDetailsErrorCalled).to(beTrue())
                    expect(viewController.errorMessage).to(equal(R.Localizable.errorDescription()))
                }
            }
        }
    }
}
