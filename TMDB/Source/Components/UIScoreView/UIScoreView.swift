//
//  UIScoreView.swift
//  TMDB
//
//  Created by Ruan Reis on 06/06/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import UIKit

@IBDesignable
class UIScoreView: UIView {

    // MARK: - Internal Properties
    @IBInspectable var text: String = "NR" {
        didSet {
            setupUI()
        }
    }

    @IBInspectable var textColor: UIColor = .white {
        didSet {
            setupUI()
        }
    }

    @IBInspectable var progressBarUnfilledColor: UIColor = .lightGray {
        didSet {
            setupUI()
        }
    }

    @IBInspectable var progressBarFilledColor: UIColor = .darkGray {
        didSet {
            setupUI()
        }
    }

    @IBInspectable var backgroundLayerColor: UIColor = .black {
        didSet {
            setupUI()
        }
    }

    // MARK: - Private Properties
    private var backgroundLayer: CAShapeLayer!
    private var progressLayer: CAShapeLayer!
    private var trackLayer: CAShapeLayer!
    private var percentageLabel: UILabel = UILabel()

    // MARK: - Lifecycle
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupUI()
    }
    
    // MARK: - Internal Methods
    /// Method used to animate circular progress bar
    ///
    /// - Parameter progress: The value of this property must be in the range 0.0 to 1.0.
    func animate(withProgress progress: CGFloat = 0.0) {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = progress
        basicAnimation.duration = 1.0
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        basicAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)

        progressLayer.add(basicAnimation, forKey: "progressAnimation")
    }

    // MARK: - Private Methods
    private func setupUI() {
        self.backgroundColor = .clear
        self.layer.cornerRadius = self.frame.size.width / 2

        backgroundLayer = createCircleShapeLayer(withStrokeColor: backgroundLayerColor,
                                                           fillColor: .clear)
        backgroundLayer.lineWidth = 10.0
        self.layer.addSublayer(backgroundLayer)

        trackLayer = self.createCircleShapeLayer(withStrokeColor: progressBarUnfilledColor,
                                                      fillColor: backgroundLayerColor)
        trackLayer.lineWidth = 5.0
        self.layer.addSublayer(trackLayer)

        progressLayer = createCircleShapeLayer(withStrokeColor: progressBarFilledColor,
                                                         fillColor: .clear)
        progressLayer.lineWidth = 5.0
        progressLayer.transform = CATransform3DMakeRotation(-.pi / 2.0, 0.0, 0.0, 1.0)
        progressLayer.strokeEnd = 0.0
        self.layer.addSublayer(progressLayer)

        percentageLabel.textAlignment = .center
        percentageLabel.text = text
        percentageLabel.textColor = textColor
        percentageLabel.font = .systemFont(ofSize: 12.0, weight: .semibold)
        percentageLabel.frame = self.bounds
        self.addSubview(percentageLabel)

        self.layoutIfNeeded()
        self.clipsToBounds = false
    }

    private func createCircleShapeLayer(withStrokeColor strokeColor: UIColor, fillColor: UIColor) -> CAShapeLayer {

        let layer = CAShapeLayer()
        let circularPath = UIBezierPath(
            arcCenter: CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2),
            radius: (self.frame.width - 1.5) / 2,
            startAngle: 0.0,
            endAngle: 2 * .pi,
            clockwise: true)

        layer.path = circularPath.cgPath
        layer.strokeColor = strokeColor.cgColor
        layer.fillColor = fillColor.cgColor
        layer.lineCap = .round
        layer.position = self.center
        layer.frame = self.bounds

        return layer
    }
}

extension UIScoreView {
    
    func setupStyle(forScore score: Double) {
        self.text = "\(String(format: "%.0f", score * 10))%"
        setupStyle(withStyle: StyleClassifier(score: score).style)
    }
    
    func setupStyle(withStyle style: UIScoreStyleProtocol) {
        textColor = style.textColor
        progressBarFilledColor = style.filledColor
        progressBarUnfilledColor = style.unfilledColor
        backgroundLayerColor = style.backgroundColor
    }
    
    func animate(withProgress progress: Double?) {
        if let progress = progress {
            animate(withProgress: CGFloat(progress / 10))
        }
    }
}
