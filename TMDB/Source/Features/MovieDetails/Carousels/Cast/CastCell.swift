//
//  CastCell.swift
//  TMDB
//
//  Created by Ruan Reis on 29/06/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import UIKit

class CastCell: UICollectionViewCell {
    
    @IBOutlet private var castName: UILabel!
    
    func setup(cast: Cast) {
        castName.text = cast.name
    }
}
