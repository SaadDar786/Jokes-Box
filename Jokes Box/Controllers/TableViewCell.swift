//
//  TableViewCell.swift
//  Jokes Box
//
//  Created by saad dar on 2/12/17.
//  Copyright © 2017 Magic Minds. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
