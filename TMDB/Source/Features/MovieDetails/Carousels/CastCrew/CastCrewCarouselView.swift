//
//  CastCarouselView.swift
//  TMDB
//
//  Created by Ruan Reis on 10/07/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import UIKit

class CastCrewCarouselView: UIView {
    
    // MARK: - IBOutlets
    
    @IBOutlet private var castCrewTitle: UILabel!
    
    @IBOutlet private var castCrewCollection: UICollectionView!
    
    // MARK: - Private properties
    
    private var castCrewList: [CastCrewDataSource] = []
    
    // MARK: - Public functions
    
    func setupUI(_ details: Details?) {
        castCrewTitle.text = R.Localizable.castCrew()
        
        guard let details = details else { return }
        
        castCrewList.append(contentsOf:
            details.cast.map({
                CastCrewDataSource(
                    title: $0.name,
                    subtitle: $0.character,
                    profilePath: $0.profilePath)
            }))
        
        castCrewList.append(contentsOf:
            details.crew.map({
                CastCrewDataSource(
                    title: $0.name,
                    subtitle: $0.job,
                    profilePath: $0.profilePath)
            }))
        
        castCrewCollection.delegate = self
        castCrewCollection.dataSource = self
        castCrewCollection.reloadData()
    }
}

// MARK: - Extension for UICollectionViewDataSource

extension CastCrewCarouselView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return castCrewList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "CastCrewCell"
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
            as? CastCrewCell else { return UICollectionViewCell() }
        
        cell.setup(castCrewList[indexPath.item])
        
        return cell
    }
}

// MARK: - Extension for UICollectionViewDelegateFlowLayout

extension CastCrewCarouselView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CastCrewCell.size
    }
}
