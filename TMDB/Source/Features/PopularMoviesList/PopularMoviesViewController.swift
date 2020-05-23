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
    
    private var isLoading = true
    
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
        showLoading()
        interactor.fetchPopularMovies()
    }
    
    func fetchNextPage() {
        showLoading()
        interactor.fetchNextPage()
    }
}

extension PopularMoviesViewController: UICollectionViewDataSource {
    
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
        
        cell.setup(movie: moviesList[indexPath.item])
        
        return cell
    }
}

extension PopularMoviesViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        
        let lastRowIndex = collectionView.numberOfItems(inSection: indexPath.section) - 1
        
        if lastRowIndex == indexPath.row {
            fetchNextPage()
        }
    }
}

extension PopularMoviesViewController: UICollectionViewDelegateFlowLayout {
    
    // MARK: - Private Properties
    private var margin: CGFloat {
        return 16.0
    }
    
    private var insetForSections: UIEdgeInsets {
        return UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
    }
    
    // MARK: - Internal Methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return insetForSections
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return margin
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return margin
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding = insetForSections.left + insetForSections.right + margin
        let width = (view.bounds.size.width - padding) / 2
        let ratio: CGFloat = 1.85
        let height = width * ratio
        return CGSize(width: width, height: height)
    }
}

extension PopularMoviesViewController: PopularMoviesViewControllerProtocol {
    
    func showPopularMoviesList(_ movies: [Movie]) {
        var indexPaths: [IndexPath] = []
        
        for index in movies.indices {
            indexPaths.append(IndexPath(item: index + (moviesList.count), section: 0))
        }
        
        moviesList.append(contentsOf: movies)
        
        self.collectionView.performBatchUpdates({
            self.collectionView.insertItems(at: indexPaths)
        })
        
        hideLoading()
    }
}
