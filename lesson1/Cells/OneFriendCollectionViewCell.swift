//
//  OneFriendCollectionViewCell.swift
//  lesson1
//
//  Created by Антон Сивцов on 13.02.2021.
//

import UIKit

class OneFriendCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var friendPic: UIImageView!
    
    @IBOutlet weak var friendName: UILabel!
    
    @IBOutlet weak var friendLastName: UILabel!
    
    @IBOutlet weak var likeOutlet: HeartButton!
    
    override func layoutSubviews() {
        self.layer.cornerRadius = 13
        self.layer.borderWidth = 5
        self.layer.borderColor = UIColor.clear.cgColor
        
        self.contentView.layer.cornerRadius = 13
        self.contentView.layer.borderWidth = 5
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 5
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.masksToBounds = false
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.layer.shadowOffset = CGSize(width: 10, height: 10)
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 1
        self.layer.cornerRadius = 13
    }
    

}
