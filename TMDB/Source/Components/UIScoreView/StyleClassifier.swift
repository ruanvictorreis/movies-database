//
//  StyleClassifier.swift
//  TMDB
//
//  Created by Ruan Reis on 06/06/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Foundation

struct StyleClassifier {
    
    let score: Double
    
    var style: UIScoreStyleProtocol {
         switch score {
         case 7...10:
             return Green()
         case 5...7:
             return Yellow()
         case 0...5:
             return Red()
         default:
            return Default()
         }
     }
}
