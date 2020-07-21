//
//  MovieDetailsResponseBuilder.swift
//  TMDBTests
//
//  Created by Ruan Reis on 21/07/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

@testable import TMDB

struct MovieDetailsResponseMock {
    
    func build() -> MovieDetailsResponse {
        let genres = [Genre(id: 1, name: "Fantasy")]
        let cast = [Cast(name: "Robert John Downey Jr", character: "Tony Stark", profilePath: nil)]
        let crew = [Crew(name: "Joe Russo", job: "Director", profilePath: nil)]
        let credits = Credits(cast: cast, crew: crew)
        
        let recommendation = RecommendationResponse(
            page: 1, results: MoviesListResponseMock.build().results)
        
        return MovieDetailsResponse(
            budget: 1000000,
            revenue: 2000000,
            runtime: 120,
            genres: genres,
            credits: credits,
            recommendations: recommendation)
    }
}
