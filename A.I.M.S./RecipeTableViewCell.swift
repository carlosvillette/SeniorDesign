//
//  RecipeTableViewCell.swift
//  A.I.M.S.
//
//  Created by Guy Carlos Villette on 4/5/20.
//  Copyright © 2020 Guy Carlos Villette. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var myRecipeImage: UIImageView!
    
    @IBOutlet weak var myRecipeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
