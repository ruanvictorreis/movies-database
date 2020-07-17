//
//  RecommendationCarouselView.swift
//  TMDB
//
//  Created by Ruan Reis on 12/07/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import UIKit

class RecommendationCarouselView: UIView {
    
    // MARK: - IBOutlets
    
    @IBOutlet private var recommendationTitle: UILabel!
    
    @IBOutlet private var recommendationCollection: UICollectionView!
    
    // MARK: - Private properties
    
    private var recommendationList: [Movie] = []
    
    // MARK: - Public properties
    
    weak var delegate: MovieDetailsViewControllerProtocol?
    
    // MARK: - Public functions
    
    func setupUI(_ details: Details?) {
        recommendationTitle.text = R.Localizable.recommendations()
        
        guard let details = details else { return }
        
        recommendationList = details.recommendations
        recommendationCollection.delegate = self
        recommendationCollection.dataSource = self
        recommendationCollection.reloadData()
    }
}

// MARK: - Extension for UICollectionViewDataSource

extension RecommendationCarouselView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recommendationList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "RecommendationCell"
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
            as? RecommendationCell else { return UICollectionViewCell() }
        
        cell.setup(recommendationList[indexPath.item])
        
        return cell
    }
}

// MARK: - Extension for UICollectionViewDelegate

extension RecommendationCarouselView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.showRecommendationDetails(recommendationList[indexPath.item])
    }
}

// MARK: - Extension for UICollectionViewDelegateFlowLayout

extension RecommendationCarouselView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return RecommendationCell.size
    }
}
