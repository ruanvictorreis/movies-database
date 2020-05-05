//
//  MoviesListWorker.swift
//  TMDB
//
//  Created by Ruan Reis on 04/05/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import RxSwift
import Foundation

struct MoviesListResponse: Decodable {

    let page: Int

    let results: [Movie]

    enum CodingKeys: String, CodingKey {
        case page
        case results
    }
}

class MoviesListWorker {

    private let baseURL: String = APIRoutes.apiBaseURL

    private let apiKey: String = APIRoutes.apiKey

    private let section: String = "popular"

    private let page: String = "1"

    func fetchPopularMovies() -> Single<MoviesListResponse> {
        let url = "\(baseURL)/movie/\(section)?api_key=\(apiKey)&page=\(page)"
        return Network().request(url: url, method: .get, returnType: MoviesListResponse.self)
    }
}
