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
            }
        }
    }
}
