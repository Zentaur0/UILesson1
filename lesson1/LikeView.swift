//
//  LikeView.swift
//  lesson1
//
//  Created by Антон Сивцов on 16.02.2021.
//

import UIKit

final class HeartButton: UIStackView {
    private var heart: [UIButton] = []
    var countOfHearts = 0 {
        didSet {
            updateButtonSelectedState()
        }
    }
    
    var count = UILabel()
    var heartSize: CGSize = CGSize(width: 35, height: 35)
    var heartsCount = 1
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    @objc func heartButtonTapped(button: UIButton) {
        guard let index = heart.firstIndex(of: button) else {
            fatalError("The button \(button) is not in heart array \(heart)")
        }
            
            let selectedHeart = index + 1
            
            if selectedHeart == countOfHearts {
                countOfHearts = 0
            } else {
                countOfHearts = selectedHeart
            }
        }
    
    private func setupButton() {
        
        for button in heart {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        heart.removeAll()
        
        let bundle = Bundle(for: type(of: self))
        let liked = UIImage(named: "liked", in: bundle, compatibleWith: self.traitCollection)
        let disliked = UIImage(named: "disliked", in: bundle, compatibleWith: self.traitCollection)
        
        for _ in 0..<heartsCount {
        let button = UIButton()
        
        button.setImage(liked, for: .normal)
        button.setImage(disliked, for: .selected)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: heartSize.height).isActive = true
        button.widthAnchor.constraint(equalToConstant: heartSize.width).isActive = true
            
        button.addTarget(self, action: #selector(HeartButton.heartButtonTapped(button:)), for: .touchUpInside)
        
        addArrangedSubview(button)
        
        self.heart.append(button)
        }
        
        updateButtonSelectedState()
    }
    
    func updateButtonSelectedState() {
        for (index, button) in heart.enumerated() {
            button.isSelected = index < countOfHearts
        }
    }
}
