//
//  RecomendedGroupCell.swift
//  lesson1
//
//  Created by Антон Сивцов on 01.02.2021.
//

import UIKit

class RecomendedGroupCell: UITableViewCell {

    @IBOutlet weak var recomendedGroupName: UILabel!
    
    @IBOutlet weak var recomendedGroupPic: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
