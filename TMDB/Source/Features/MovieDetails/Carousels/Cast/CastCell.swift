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
    
    @IBOutlet private var castImage: UICircularImageView!
    
    // MARK: - Public properties
    
    static var size = CGSize(width: 100.0, height: 150.0)
    
    // MARK: - Private properties
    
    private var request: DataRequest?
    
    // MARK: - Public functions
    
    override func prepareForReuse() {
        clearForReuse()
    }
    
    func setup(cast: Cast) {
        castName.text = cast.name
        
        if let profile = cast.profilePath {
            castImage.load(url: MovieAPI.build(image: profile, size: .w200)) { [weak self] request in
                self?.request = request
            }
        }
    }
    
    // MARK: - Private functions
    
    private func clearForReuse() {
        castImage.image = nil
        request?.cancel()
    }
}
