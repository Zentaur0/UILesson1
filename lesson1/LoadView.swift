//
//  LoadView.swift
//  lesson1
//
//  Created by Антон Сивцов on 25.02.2021.
//

import UIKit

@IBDesignable class LoadView: UIStackView {

    let circle1 = UIView()
    let circle2 = UIView()
    let circle3 = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // первая точка
        self.addSubview(circle1)
        self.circle1.backgroundColor = .gray
        self.circle1.layer.cornerRadius = 6
        self.circle1.clipsToBounds = true
    
        self.circle1.translatesAutoresizingMaskIntoConstraints = false
        self.circle1.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.circle1.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.circle1.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.circle1.widthAnchor.constraint(equalToConstant: 12).isActive = true
        self.circle2.heightAnchor.constraint(equalToConstant: 12).isActive = true
        
        // вторая точка
        self.addSubview(circle2)
        self.circle2.backgroundColor = .gray
        self.circle2.layer.cornerRadius = 6
        self.circle2.clipsToBounds = true
        
        self.circle2.translatesAutoresizingMaskIntoConstraints = false
        self.circle2.leadingAnchor.constraint(equalTo: circle1.leadingAnchor, constant: 5).isActive = true
        self.circle2.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.circle2.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.circle2.widthAnchor.constraint(equalToConstant: 12).isActive = true
        self.circle2.heightAnchor.constraint(equalToConstant: 12).isActive = true
        
        // третья точка
        self.addSubview(circle3)
        self.circle3.backgroundColor = .gray
        self.circle3.layer.cornerRadius = 6
        self.circle3.clipsToBounds = true
        
        self.circle3.translatesAutoresizingMaskIntoConstraints = false
        self.circle3.leadingAnchor.constraint(equalTo: circle2.leadingAnchor, constant: 5).isActive = true
        self.circle3.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.circle3.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.circle3.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.circle3.widthAnchor.constraint(equalToConstant: 12).isActive = true
        self.circle3.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startLoading() {
        UIView.animateKeyframes(withDuration: 1.2, delay: 0, options: .repeat, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.4, animations: {
                self.circle3.transform = .identity
                self.circle1.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.8, animations: {
                self.circle1.transform = .identity
                self.circle2.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 1.2, animations: {
                self.circle2.transform = .identity
                self.circle3.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            })
        })
    }
}
