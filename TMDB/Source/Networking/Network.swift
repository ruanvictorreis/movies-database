//
//  Network.swift
//  TMDB
//
//  Created by Ruan Reis on 04/05/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Alamofire
import Foundation
import RxSwift

protocol Networking {

    func request<T: Decodable>(url: String,
                               method: HTTPMethod,
                               parameters: [String: Any]?,
                               returnType: T.Type) -> Single<T>
}

class Network: Networking {

    func request<T: Decodable>(url: String,
                               method: HTTPMethod = .get,
                               parameters: [String: Any]? = nil,
                               returnType: T.Type) -> Single<T> {

        return Single.create { single in
            let request = AF.request(url,
                                     method: method,
                                     parameters: parameters,
                                     encoding: JSONEncoding.default).validate()

            request.responseJSON { response in
                if let error = response.error {
                    return single(.error(error))
                }

                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let object = try decoder.decode(T.self, from: response.data ?? Data())
                    single(.success(object))
                } catch {
                    single(.error(error))
                }
            }

            return Disposables.create {
                request.cancel()
            }
        }
    }
}
