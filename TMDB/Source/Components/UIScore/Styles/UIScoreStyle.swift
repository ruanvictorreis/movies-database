//
//  UIScoreStyle.swift
//  TMDB
//
//  Created by Ruan Reis on 04/06/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import UIKit

protocol UIScoreStyleProtocol {
    
    var textColor: UIColor { get }
    
    var filledColor: UIColor { get }
    
    var unfilledColor: UIColor { get }
    
    var backgroundColor: UIColor { get }
    
}

enum UIScoreViewStyle {
    case none
    case red
    case green
    case yellow
    
    var instance: UIScoreStyleProtocol {
        switch self {
        case .red:
            return Red()
        case .green:
            return Green()
        case . yellow:
            return Yellow()
        default:
            return Default()
        }
    }
}
