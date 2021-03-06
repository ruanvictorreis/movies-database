//
//  UIImageView+Extensions.swift
//  TMDB
//
//  Created by Ruan Reis on 21/05/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func load(url: String, completion: (() -> Void)? = nil) {
        kf.setImage(
            with: URL(string: url),
            options: [.transition(.fade(0.3))]) { _ in
                completion?()
        }
    }
    
    func cancel() {
        kf.cancelDownloadTask()
    }
}
