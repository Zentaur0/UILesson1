//
//  NewsCollectionViewCell.swift
//  lesson1
//
//  Created by Антон Сивцов on 18.02.2021.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var avatar: AvatarView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var time: UILabel!
    
    @IBOutlet weak var thePicCollection: UIImageView!
    
    @IBOutlet weak var likeButton: HeartButton!
    
    @IBOutlet weak var shareButton: UIImageView!
    
    @IBOutlet weak var commentButton: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
