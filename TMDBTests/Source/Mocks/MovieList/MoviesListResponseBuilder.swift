//
//  MoviesListResponseBuilder.swift
//  TMDBTests
//
//  Created by Ruan Reis on 20/07/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

@testable import TMDB

struct MoviesListResponseBuilder {
    
    func build(page: Int = 1) -> MovieListResponse {
        let response = [
            1: [
                Movie(id: 1, title: "Joker", overview: "Overview", releaseDate: "20/06/2019",
                      voteAverage: 82.0, posterPath: nil, backdropPath: nil),
                
                Movie(id: 2, title: "Avengers: Ultimato", overview: "Overview", releaseDate: "25/04/2019",
                      voteAverage: 83.0, posterPath: nil, backdropPath: nil),
                
                Movie(id: 3, title: "Parasite", overview: "Overview", releaseDate: "07/11/2019",
                      voteAverage: 85.0, posterPath: nil, backdropPath: nil)],
            2: [
                Movie(id: 4, title: "Interstellar", overview: "Overview", releaseDate: "06/11/2014",
                      voteAverage: 83.0, posterPath: nil, backdropPath: nil),
                
                Movie(id: 5, title: "Dracula Untold", overview: "Overview", releaseDate: "23/10/2014",
                      voteAverage: 63.0, posterPath: nil, backdropPath: nil),
                
                Movie(id: 6, title: "1917", overview: "Overview", releaseDate: "25/12/2019",
                      voteAverage: 79.0, posterPath: nil, backdropPath: nil)]
        ]
        
        return MovieListResponse(page: page, totalPages: 2, results: response[page] ?? [], totalResults: 3)
    }
}
