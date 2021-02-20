//
//  FriendTableViewCell.swift
//  lesson1
//
//  Created by Антон Сивцов on 02.02.2021.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    
    @IBOutlet weak var friendPic: AvatarView!
    
    @IBOutlet weak var friendName: UILabel!
    
    @IBOutlet weak var friendAge: UILabel!
    
    @IBOutlet weak var friendLastName: UILabel!
    
    var like: HeartButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
