//
//  UICircularImageView.swift
//  TMDB
//
//  Created by Ruan Reis on 07/07/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import Foundation

import UIKit

@IBDesignable
class UICircularImageView: UIImageView {

    // MARK: - Internal Properties

    @IBInspectable var isCircular: Bool = true {
        didSet {
            setupUI()
        }
    }

    @IBInspectable var cornerRadius: CGFloat = 10.0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
    }

    @IBInspectable var borderedWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = self.borderedWidth
        }
    }

    @IBInspectable var borderedColor: UIColor = .lightGray {
        didSet {
            self.layer.borderColor = self.borderedColor.cgColor
        }
    }

    // MARK: - Lifecycle

    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupUI()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        self.layer.cornerRadius = isCircular ? self.frame.width / 2 : cornerRadius
        self.layer.borderWidth = borderedWidth
        self.layer.borderColor = borderedColor.cgColor
    }
}
