//
//  MovieDetailsViewController.swift
//  TMDB
//
//  Created by Ruan Reis on 27/05/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet private var posterImage: UIImageView!
    
    @IBOutlet private var backdropImage: UIImageView!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let posterPath = movie?.posterPath {
            posterImage.load(url: MovieAPI.build(image: posterPath, size: .w500))
        }
        
        if let backdropPath = movie?.backdropPath {
            backdropImage.load(url: MovieAPI.build(image: backdropPath, size: .original))
        }
    }
}
