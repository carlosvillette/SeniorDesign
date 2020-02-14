//
//  DataViewControllerTableViewCell.swift
//  A.I.M.S.
//
//  Created by Guy Carlos Villette on 2/2/20.
//  Copyright © 2020 Guy Carlos Villette. All rights reserved.
//

import UIKit

class DataViewControllerTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var myImage: UIImageView!
    
    @IBOutlet weak var myLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
