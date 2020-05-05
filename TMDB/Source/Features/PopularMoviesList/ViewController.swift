//
//  ViewController.swift
//  TMDB
//
//  Created by Ruan Reis on 10/04/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        let worker = MoviesListWorker()

        worker.fetchPopularMovies()
            .asObservable()
            .subscribe(onNext: { movieList in
                print(movieList)
            }).disposed(by: disposeBag)

    }
}
