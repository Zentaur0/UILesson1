//
//  LikeView.swift
//  lesson1
//
//  Created by Антон Сивцов on 16.02.2021.
//

import UIKit

//
//final class LikeButton: UIControl {
//
//
//    init(initialState: State) {
//        super.init(frame: .zero)
//
//        self.addSubview(self.imageView)
//        self.addSubview(self.numberOfLikesLabel)
//    
//        self.applyState(initialState)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func applyState(_ state: State) {
//        switch state {
//        case let .liked(likes):
//            self.numberOfLikesLabel.text = "\(likes)"
////            self.imageView.backgroundColor = .red
//        case let .disliked(likes):
//            self.numberOfLikesLabel.text = "\(likes)"
////            self.imageView.backgroundColor = .orange
//        }
//    }
//}

@IBDesignable final class HeartButton: UIButton {

//    enum Heart {
//        case isLiked(Int)
//        case isDisliked(Int)
//    }
//
//    let heartView = UIImageView()
//    let numberOfLikesLabel = UILabel()
//
//    override var isHighlighted: Bool {
//        didSet {
//            if self.isHighlighted != oldValue {
//                self.alpha = self.isHighlighted ? 0.7 : 1
//            }
//        }
//    }
    
    @IBInspectable var filled: Bool = true
    @IBInspectable var strokeWidth: CGFloat = 2.0

    @IBInspectable var strokeColor: UIColor?

    override func draw(_ rect: CGRect) {
        
        
        let bezierPath = UIBezierPath(heartIn: self.bounds)

        if self.strokeColor != nil {
            self.strokeColor!.setStroke()
        } else {
            self.tintColor.setStroke()
        }

        bezierPath.lineWidth = self.strokeWidth
        bezierPath.stroke()

        if self.filled {
            self.tintColor.setFill()
            bezierPath.fill()
        }
    }
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.addSubview(self.heartView)
//        self.addSubview(self.numberOfLikesLabel)
//        
//        self.numberOfLikesLabel.text = "0"
//       
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
}

extension UIBezierPath {
    convenience init(heartIn rect: CGRect) {
        self.init()

        //Calculate Radius of Arcs using Pythagoras
        let sideOne = rect.width * 0.4
        let sideTwo = rect.height * 0.3
        let arcRadius = sqrt(sideOne*sideOne + sideTwo*sideTwo)/2

        //Left Hand Curve
        self.addArc(withCenter: CGPoint(x: rect.width * 0.3, y: rect.height * 0.35), radius: arcRadius, startAngle: 135.degreesToRadians, endAngle: 315.degreesToRadians, clockwise: true)

        //Top Centre Dip
        self.addLine(to: CGPoint(x: rect.width/2, y: rect.height * 0.2))

        //Right Hand Curve
        self.addArc(withCenter: CGPoint(x: rect.width * 0.7, y: rect.height * 0.35), radius: arcRadius, startAngle: 225.degreesToRadians, endAngle: 45.degreesToRadians, clockwise: true)

        //Right Bottom Line
        self.addLine(to: CGPoint(x: rect.width * 0.5, y: rect.height * 0.95))

        //Left Bottom Line
        self.close()
    }
}

extension Int {
    var degreesToRadians: CGFloat { return CGFloat(self) * .pi / 180 }
}
