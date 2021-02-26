//
//  AllGroupsTableViewCell.swift
//  lesson1
//
//  Created by Антон Сивцов on 07.02.2021.
//

import UIKit

class AllGroupsTableViewCell: UITableViewCell {

    @IBOutlet weak var allGroupName: UILabel!
    
    @IBOutlet weak var allGroupPic: AvatarView! 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
