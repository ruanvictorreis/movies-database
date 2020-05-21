//
//  MovieCollectionViewCell.swift
//  TMDB
//
//  Created by Ruan Reis on 18/05/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private var movieTitle: UILabel!
    
    @IBOutlet private var movieImage: UIImageView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(movie: Movie) {
        movieTitle.text = movie.title
        
        if let poster = movie.posterPath {
            movieImage.load(url: MovieAPI.build(image: poster, size: .w500))
        }
    }
}
