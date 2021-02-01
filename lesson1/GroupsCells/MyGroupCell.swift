//
//  MyGroupCell.swift
//  lesson1
//
//  Created by Антон Сивцов on 01.02.2021.
//

import UIKit

class MyGroupCell: UITableViewCell {

    @IBOutlet weak var myGroupName: UILabel!
    
    @IBOutlet weak var myGroupPic: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
