//
//  SimpleTableViewCell.swift
//  20240523TableView
//
//  Created by 이찬호 on 5/23/24.
//

import UIKit

class SimpleTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.automaticallyUpdatesContentConfiguration = false
        // Configure the view for the selected state
    }

}
