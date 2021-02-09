//
//  GroupTableViewCell.swift
//  lesson1
//
//  Created by Антон Сивцов on 02.02.2021.
//

import UIKit

class GroupTableViewCell: UITableViewCell {
    
    @IBOutlet weak var groupName: UILabel!
    
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
