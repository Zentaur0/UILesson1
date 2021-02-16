//
//  FriendTableViewCell.swift
//  lesson1
//
//  Created by Антон Сивцов on 02.02.2021.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    var friendsList: Set = ["Anastasia Gulert", "Victor Miheev", "Tom Vekerfield", "Alisha Tompson", "Federico Bruno"]
    
    @IBOutlet weak var friendName: UILabel! {
        didSet {
            self.friendName.text = friendsList.randomElement()
        }
    }
    
    @IBOutlet weak var friendPic: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
