//
//  MovieDetailsWorker.swift
//  TMDB
//
//  Created by Ruan Reis on 17/06/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Alamofire
import Foundation

typealias MovieDetailsSuccess = (_ response: MovieDetailsResponse?) -> Void
typealias MovieDetailsError = (_ error: AFError?) -> Void

protocol MovieDetailsWorkerProtocol {
    
    func fetchMovieDetails(of movieId: Int,
                           sucess: @escaping MovieDetailsSuccess,
                           failure: @escaping MovieDetailsError)
}

class MovieDetailsWorker: MovieDetailsWorkerProtocol {
    
    func fetchMovieDetails(of movieId: Int,
                           sucess: @escaping MovieDetailsSuccess,
                           failure: @escaping MovieDetailsError) {
        
        let enconding = JSONEncoding.default
        let url = MovieAPI.build(detailsOf: movieId)
        
        Network().request(
            data: RequestData(url: url, method: .get, encoding: enconding),
            decoder: SnakeCaseDecoder(expectation: MovieDetailsResponse.self),
            success: { response in
                sucess(response)
            },
            failure: {error in
                failure(error)
            })
        
    }
}
