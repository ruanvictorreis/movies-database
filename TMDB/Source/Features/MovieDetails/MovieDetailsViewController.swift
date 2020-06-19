//
//  MovieDetailsViewController.swift
//  TMDB
//
//  Created by Ruan Reis on 27/05/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import UIKit

protocol MovieDetailsViewControllerProtocol: AnyObject {
    
    func showMovieDetails(_ details: Details)
}

class MovieDetailsViewController: UIViewController {

    // MARK: - VIP properties
    
    var interactor: MovieDetailInteractorProtocol!
    
    var router: MovieDetailRouterProtocol!
    
    // MARK: - IBOutlets
    
    @IBOutlet private var movieTitle: UILabel!
    
    @IBOutlet private var releaseDate: UILabel!
    
    @IBOutlet private var scoreView: UIScoreView!
    
    @IBOutlet private var posterImage: UIImageView!
    
    @IBOutlet private var backdropImage: UIImageView!
    
    @IBOutlet private var overviewTitle: UILabel!
    
    @IBOutlet private var overviewDescription: UILabel!
    
    @IBOutlet private var informationTitle: UILabel!
    
    @IBOutlet private var duration: UILabel!
    
    @IBOutlet private var budget: UILabel!
    
    // MARK: - Public properties
    
    var movie: Movie!
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchMovieDetails()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scoreView.animate()
    }
    
    // MARK: - Private functions
    
    private func fetchMovieDetails() {
        interactor.fetchMovieDetails(of: movie.id)
    }
    
    private func setupUI() {
        overviewTitle.text = R.Localizable.overview()
        informationTitle.text = R.Localizable.informations()
        duration.text = R.Localizable.duration()
        budget.text = R.Localizable.budget()
        
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
    
    private func setupUI(_ details: Details) {
        let regular: UIFont = .systemFont(ofSize: 16, weight: .regular)
        let semibold: UIFont = .systemFont(ofSize: 16, weight: .semibold)
        
        let attrBudget = AttributedStringBuilder()
            .text(R.Localizable.budget(), font: semibold, color: .lightGray)
            .text(details.budget, font: regular, color: .lightGray)
            .build()
        
        let attrDuration = AttributedStringBuilder()
            .text(R.Localizable.duration(), font: semibold, color: .lightGray)
            .text(details.duration, font: regular, color: .lightGray)
            .build()
        
        budget.attributedText = attrBudget
        duration.attributedText = attrDuration
    }
}

// MARK: - Protocol requirements extension

extension MovieDetailsViewController: MovieDetailsViewControllerProtocol {
    
    func showMovieDetails(_ details: Details) {
        setupUI(details)
    }
}
