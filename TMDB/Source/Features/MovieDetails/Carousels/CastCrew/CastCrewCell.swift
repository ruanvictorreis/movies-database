//
//  CastCrewCell.swift
//  TMDB
//
//  Created by Ruan Reis on 29/06/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import UIKit
import Alamofire

class CastCrewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet private var title: UILabel!
    
    @IBOutlet private var subtitle: UILabel!
    
    @IBOutlet private var castCrewImage: UICircularImageView!
    
    // MARK: - Public properties
    
    static var size = CGSize(width: 125.0, height: 192)
    
    // MARK: - Public functions
    
    override func prepareForReuse() {
        clearForReuse()
    }
    
    func setup(_ dataSource: CastCrewDataSource) {
        title.text = dataSource.title
        subtitle.text = dataSource.subtitle
        
        if let profile = dataSource.profilePath {
            castCrewImage.load(url: MovieAPI.build(image: profile, size: .w200))
        }
    }
    
    // MARK: - Private functions
    
    private func clearForReuse() {
        title.text = nil
        subtitle.text = nil
        castCrewImage.cancel()
        castCrewImage.image = nil
    }
}
