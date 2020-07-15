//
//  RecommendationCell.swift
//  TMDB
//
//  Created by Ruan Reis on 12/07/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import UIKit

class RecommendationCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet private var movieImage: UIImageView!
    
//    @IBOutlet private var movieTitle: UILabel!
    
    // MARK: - Public properties
    
    static var size = CGSize(width: 250.0, height: 170.0)
    
    // MARK: - Public functions
    
    override func prepareForReuse() {
        clearForReuse()
    }
    
    func setup(_ movie: Movie) {
//        movieTitle.text = movie.title
        
        if let backdrop = movie.backdropPath {
            movieImage.load(url: MovieAPI.build(image: backdrop, size: .original))
        }
    }
    
    // MARK: - Private functions
    
    private func clearForReuse() {
        movieImage.cancel()
        movieImage.image = nil
    }
}
