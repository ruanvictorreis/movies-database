//
//  CastCell.swift
//  TMDB
//
//  Created by Ruan Reis on 29/06/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import UIKit
import Alamofire

class CastCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet private var castName: UILabel!
    
    @IBOutlet private var character: UILabel!
    
    @IBOutlet private var castImage: UICircularImageView!
    
    // MARK: - Public properties
    
    static var size = CGSize(width: 125.0, height: 200)
    
    // MARK: - Public functions
    
    override func prepareForReuse() {
        clearForReuse()
    }
    
    func setup(cast: Cast) {
        castName.text = cast.name
        character.text = cast.character
        
        if let profile = cast.profilePath {
            castImage.load(url: MovieAPI.build(image: profile, size: .w200))
        }
    }
    
    // MARK: - Private functions
    
    private func clearForReuse() {
        castImage.cancel()
        castImage.image = nil
        castName.text = nil
        character.text = nil
    }
}
