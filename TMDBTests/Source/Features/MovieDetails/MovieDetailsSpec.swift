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
            context("Should show the details of the movie"){
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
                    expect(viewController.details?.duration).to(equal("2h"))
                    expect(viewController.details?.budget).to(equal("$1,000,000.00"))
                    expect(viewController.details?.revenue).to(equal("$2,000,000.00"))
                    expect(viewController.details?.cast.count).to(beGreaterThan(0))
                    expect(viewController.details?.crew.count).to(beGreaterThan(0))
                    expect(viewController.details?.genres.count).to(beGreaterThan(0))
                    expect(viewController.details?.recommendations.count).to(beGreaterThan(0))
                }
            }
        }
    }
}
