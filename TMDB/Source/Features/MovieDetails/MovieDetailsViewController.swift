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
    
    @IBOutlet private var overviewTitle: UILabel!
    
    @IBOutlet private var overviewDescription: UILabel!
    
    @IBOutlet private var circularProgress: UICircularProgressView!
    
    @IBOutlet private var posterImage: UIImageView!
    
    @IBOutlet private var backdropImage: UIImageView!
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateCircularProgress()
    }
    
    private func setupUI() {
        movieTitle.text = movie.title
        overviewTitle.text = R.Localizable.overview()
        overviewDescription.text = movie.overview
        releaseDate.text = movie.relaseDateFormatted
        
        if let posterPath = movie.posterPath {
            posterImage.load(url: MovieAPI.build(image: posterPath, size: .w500))
        }
        
        if let backdropPath = movie.backdropPath {
            backdropImage.load(url: MovieAPI.build(image: backdropPath, size: .original))
        }
        
        setupCircularProgress()
    }
    
    private func setupCircularProgress() {
        circularProgress.text = "\(movie.rating)%"
        circularProgress.backgroundLayerColor = .darkness
        circularProgress.progressBarUnfilledColor = .darkGray
        
        if movie.voteAverage >= 7.0 {
            circularProgress.progressBarFilledColor = .lightGreen
            circularProgress.progressBarUnfilledColor = .darkGreen
        } else if movie.voteAverage >= 4.0 {
            circularProgress.progressBarUnfilledColor = .darkYellow
            circularProgress.progressBarFilledColor = .lightYellow
        } else if movie.voteAverage != 0.0 {
            circularProgress.progressBarUnfilledColor = .darkRed
            circularProgress.progressBarFilledColor = .lightRed
        }
        
    }
    
    private func animateCircularProgress() {
        circularProgress.animate(
            withProgress: CGFloat(movie.voteAverage / 10))
    }
}
