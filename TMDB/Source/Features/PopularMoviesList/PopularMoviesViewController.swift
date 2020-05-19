//
//  PopularMoviesViewController.swift
//  TMDB
//
//  Created by Ruan Reis on 10/04/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import UIKit
import RxSwift

class PopularMoviesViewController: UIViewController {
    
    @IBOutlet private var collectionView: UICollectionView!
    
    private var moviesList = [Movie]()
    
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()

        MoviesListWorker().fetchPopularMovies { [weak self] results in
            self?.moviesList.append(contentsOf: results)
            self?.collectionView.reloadData()
        }
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
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

//extension PopularMoviesViewController: UICollectionViewDelegateFlowLayout {
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        
//        return CGSize(width: collectionView.frame.size.width/2, height: collectionView.frame.size.width/2)
//    }
//    
//    func collectionView(collectionView: UICollectionView,
//            layout collectionViewLayout: UICollectionViewLayout,
//            minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
//        return 2.0
//    }
//
//    func collectionView(collectionView: UICollectionView, layout
//            collectionViewLayout: UICollectionViewLayout,
//            minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
//        return 2.0
//    }
//}
