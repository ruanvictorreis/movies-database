//
//  MovieListViewController.swift
//  TMDB
//
//  Created by Ruan Reis on 10/04/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import UIKit

protocol MovieListViewControllerProtocol {
    
    func showMoviesList(_ movies: [Movie])
    
    func showMovieListError(errorMessage: String)
}

class MovieListViewController: UIViewController {
    
    // MARK: - VIP properties
    
    var interactor: MovieListInteractorProtocol!
    
    var router: MovieListRouterProtocol!
    
    // MARK: - IBOutlets
    
    @IBOutlet private var collectionView: UICollectionView!
    
    // MARK: - Private properties
    
    private var moviesList = [Movie]()
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        fetchMovieList()
    }
    
    // MARK: - Private functions
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func fetchMovieList() {
        showLoading()
        interactor.fetchMovieList()
    }
    
    private func fetchNextPage() {
        showLoading()
        interactor.fetchNextPage()
    }
}

// MARK: - Protocol requirements extension

extension MovieListViewController: MovieListViewControllerProtocol {
    
    func showMoviesList(_ movies: [Movie]) {
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
    
    func showMovieListError(errorMessage: String) {
        showAlert(title: R.Localizable.errorTitle(), message: errorMessage)
    }
}

// MARK: - UICollectionViewDatasource extension

extension MovieListViewController: UICollectionViewDataSource {
    
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

// MARK: - UICollectionViewDelegateExtension

extension MovieListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        
        let lastRowIndex = collectionView.numberOfItems(inSection: indexPath.section) - 1
        
        if lastRowIndex == indexPath.row {
            fetchNextPage()
        }
        
        cell.alpha = 0.0
        cell.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        
        UIView.animate(withDuration: 0.4, delay: 0.0, options: .allowUserInteraction, animations: {
            cell.alpha = 1.0
            cell.transform = .identity
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        router.proceedToMovieDetails(movie: moviesList[indexPath.item])
    }
}

// MARK: - UICollectionViewDelegateFlowLayout extension

extension MovieListViewController: UICollectionViewDelegateFlowLayout {
    
    private var margin: CGFloat {
        return 16.0
    }
    
    private var insetForSections: UIEdgeInsets {
        return UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
    }
    
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
