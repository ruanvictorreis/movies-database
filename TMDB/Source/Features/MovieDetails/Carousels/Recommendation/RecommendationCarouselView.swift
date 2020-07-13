//
//  RecommendationCarouselView.swift
//  TMDB
//
//  Created by Ruan Reis on 12/07/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import UIKit

class RecommendationCarouselView: UIView {
    
    // MARK: - IBOutlets
    
    @IBOutlet private var recommendationTitle: UILabel!
    
    // MARK: - Public functions
    
    func setupUI(_ details: Details?) {
        recommendationTitle.text = R.Localizable.recommendations()
    }
}
