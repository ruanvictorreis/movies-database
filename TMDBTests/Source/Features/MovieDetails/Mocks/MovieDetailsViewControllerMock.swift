//
//  MovieDetailsViewControllerMock.swift
//  TMDBTests
//
//  Created by Ruan Reis on 20/07/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

@testable import TMDB

class MovieDetailsViewControllerMock: MovieDetailsViewControllerProtocol {
    
    var details: Details?
    
    var recommendation: Movie?
    
    var showMovieDetailsCalled = false
    
    var showRecommendationDetailsCalled = false
    
    func showMovieDetails(_ details: Details) {
        self.details = details
        self.showMovieDetailsCalled = true
    }
    
    func showRecommendationDetails(_ movie: Movie) {
        self.recommendation = movie
        self.showRecommendationDetailsCalled = true
    }
}
