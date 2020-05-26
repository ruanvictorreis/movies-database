//
//  UIImageView+Extensions.swift
//  TMDB
//
//  Created by Ruan Reis on 21/05/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Alamofire

extension UIImageView {
    
    func load(url: String, completation: ((DataRequest) -> Void)? = nil) {
        let request = AF.request(url)
        
        request.response { response in
            let statusCode = response.response?.statusCode
            if  statusCode == 200, let data = response.data {
                self.image = UIImage(data: data)
                completation?(request)
            }
        }
    }
}
