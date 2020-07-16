//
//  AttributedStringBuilder.swift
//  TMDB
//
//  Created by Ruan Reis on 18/06/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import UIKit

class AttributedStringBuilder {
    
    private var attributedString = NSMutableAttributedString()
    
    @discardableResult
    func text(_ text: String, font: UIFont, color: UIColor = .black) -> AttributedStringBuilder {
        let attributes = [NSAttributedString.Key.font: font,
                          NSAttributedString.Key.foregroundColor: color]
        let string = NSAttributedString(string: text, attributes: attributes)
        attributedString.append(string)
        return self
    }
    
    func build() -> NSAttributedString {
        return attributedString
    }
    
}
