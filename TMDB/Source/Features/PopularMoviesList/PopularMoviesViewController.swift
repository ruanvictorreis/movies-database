//
//  PopularMoviesViewController.swift
//  TMDB
//
//  Created by Ruan Reis on 10/04/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import UIKit
import RxSwift

protocol PopularMoviesViewControllerProtocol {
    
    func showPopularMoviesList(_ movies: [Movie])
}

class PopularMoviesViewController: UIViewController {
    
    @IBOutlet private var collectionView: UICollectionView!
    
    private var moviesList = [Movie]()
    
    private let disposeBag = DisposeBag()
    
    var interactor: PopularMoviesInteractorProtocol!
    
    var router: PopularMoviesRouterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCycle()
        setupCollectionView()
        fetchPopularMovies()
    }
    
    func setupCycle() {
        PopularMoviesBuilder().build(self)
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func fetchPopularMovies() {
        interactor.fetchPopularMovies()
    }
}

extension PopularMoviesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath)
            as? MovieCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.setup(title: moviesList[indexPath.row].title)
        
        return cell
    }
}

extension PopularMoviesViewController: PopularMoviesViewControllerProtocol {
    
    func showPopularMoviesList(_ movies: [Movie]) {
        moviesList.append(contentsOf: movies)
        collectionView.reloadData()
    }
}
