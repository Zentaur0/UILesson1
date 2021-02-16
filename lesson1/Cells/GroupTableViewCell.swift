//
//  GroupTableViewCell.swift
//  lesson1
//
//  Created by Антон Сивцов on 02.02.2021.
//

import UIKit

class GroupTableViewCell: UITableViewCell {

    var groupsList: Set = ["Group 1", "Group 2", "Group 3", "Group 4", "Group 5"]
    
    @IBOutlet weak var groupName: UILabel! {
        didSet {
            self.groupName.text = groupsList.randomElement()
        }
    }
    
    @IBOutlet weak var groupPic: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
