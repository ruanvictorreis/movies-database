//
//  MovieCollectionViewCell.swift
//  TMDB
//
//  Created by Ruan Reis on 18/05/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import UIKit
import Alamofire

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private var movieTitle: UILabel!
    
    @IBOutlet private var movieImage: UIImageView!
    
    private var request: DataRequest?
    
    override func prepareForReuse() {
        clearForReuse()
    }
    
    func setup(movie: Movie) {
        movieTitle.text = movie.title
        
        if let poster = movie.posterPath {
            movieImage.load(url: MovieAPI.build(image: poster, size: .w500))
        }
    }
    
    private func clearForReuse() {
        movieImage.cancel()
        movieImage.image = nil
        movieTitle.text = nil
    }
}
