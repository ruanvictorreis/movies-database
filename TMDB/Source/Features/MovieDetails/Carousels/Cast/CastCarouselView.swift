//
//  CastCarouselView.swift
//  TMDB
//
//  Created by Ruan Reis on 10/07/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import UIKit

class CastCarouselView: UIView {
    
    @IBOutlet private var castCrewTitle: UILabel!
    
    @IBOutlet private var castCollection: UICollectionView!
    
    var details: Details?
    
    func setupUI(_ details: Details?) {
        self.details = details
        castCrewTitle.text = R.Localizable.castCrew()
        
        castCollection.delegate = self
        castCollection.dataSource = self
        castCollection.reloadData()
    }
}

// MARK: - Extension for UICollectionViewDelegate

extension CastCarouselView: UICollectionViewDelegate {
    
}

// MARK: - Extension for UICollectionViewDataSource

extension CastCarouselView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return details?.cast.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CastCell", for: indexPath)
            as? CastCell else { return UICollectionViewCell() }
        
        if let cast = details?.cast[indexPath.item] {
            cell.setup(cast: cast)
        }
        
        return cell
    }
}

// MARK: - Extension for UICollectionViewDelegateFlowLayout

extension CastCarouselView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CastCell.size
    }
}
