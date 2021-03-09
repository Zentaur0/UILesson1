//
//  AvatarView.swift
//  Lesson5
//
//  Created by Egor Petrov on 06.02.2021.
//

import UIKit

@IBDesignable class AvatarView: UIView {

    @IBOutlet var imageView: UIImageView! {
        didSet {
            self.imageView.layer.cornerRadius = self.cornerRadius
            self.imageView.clipsToBounds = true
            self.imageView.layer.borderColor = self.borderColor.cgColor
        }
    }

   @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor = .black {
        didSet {
            self.layer.borderColor = borderColor.cgColor
            self.layer.borderWidth = 2
        }
    }

    @IBInspectable var shadowOffset: CGSize = .zero {
        didSet {
            self.layer.shadowColor = UIColor.gray.cgColor
            self.layer.shadowOpacity = 0.6
            self.layer.shadowOffset = shadowOffset
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    
}
