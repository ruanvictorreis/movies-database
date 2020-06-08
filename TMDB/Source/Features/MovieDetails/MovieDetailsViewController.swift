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
    
    @IBOutlet private var scoreView: UIScoreView!
    
    @IBOutlet private var posterImage: UIImageView!
    
    @IBOutlet private var backdropImage: UIImageView!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scoreView.animate()
    }
    
    private func setupUI() {
        guard let movie = self.movie else { return }
        
        overviewTitle.text = R.Localizable.overview()
        
        movieTitle.text = movie.title
        overviewDescription.text = movie.overview
        releaseDate.text = movie.relaseDateFormatted
        
        let scoreSorter = ScoreSorter()
        scoreView.score = movie.voteAverage
        scoreView.style = scoreSorter.style(forScore: movie.voteAverage)
        
        if let posterPath = movie.posterPath {
            posterImage.load(url: MovieAPI.build(image: posterPath, size: .w500))
        }
        
        if let backdropPath = movie.backdropPath {
            backdropImage.load(url: MovieAPI.build(image: backdropPath, size: .original))
        }
    }
}
