//
//  ViewController.swift
//  TMDB
//
//  Created by Ruan Reis on 10/04/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import UIKit
import RxSwift

class PopularMoviesViewController: UIViewController {
    
    @IBOutlet private var collectionView: UICollectionView!
    
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        MoviesListWorker().fetchPopularMovies()
    }
}
