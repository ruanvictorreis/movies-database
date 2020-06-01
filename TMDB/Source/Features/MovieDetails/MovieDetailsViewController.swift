//
//  MovieDetailsViewController.swift
//  TMDB
//
//  Created by Ruan Reis on 27/05/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet private var movieTitle: UILabel!
    
    @IBOutlet private var releaseDate: UILabel!
    
    @IBOutlet private var posterImage: UIImageView!
    
    @IBOutlet private var backdropImage: UIImageView!
    
    @IBOutlet private var overviewTitle: UILabel!
    
    @IBOutlet private var overviewDescription: UILabel!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTitle.text = movie?.title
        releaseDate.text = movie?.relaseDateFormatted
        overviewTitle.text = R.Localizable.overview()
        overviewDescription.text = movie?.overview
        
        if let posterPath = movie?.posterPath {
            posterImage.load(url: MovieAPI.build(image: posterPath, size: .w500))
        }
        
        if let backdropPath = movie?.backdropPath {
            backdropImage.load(url: MovieAPI.build(image: backdropPath, size: .original))
        }
    }
}
