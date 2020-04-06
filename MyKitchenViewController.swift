//
//  MyKitchenViewController.swift
//  A.I.M.S.
//
//  Created by Guy Carlos Villette on 4/5/20.
//  Copyright © 2020 Guy Carlos Villette. All rights reserved.
//

import UIKit

class MyKitchenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let list = ["Eggs", "Sugar","Milk","Bread","Cheese","Juice","Butter","Syrup","Tuna","Mustard","Lemons","Parsley","Broccoli","Bacon","Parmesan","Spaghetti","Tomatoes","Basil","Mozzarella","Pepper","Garlic","Onion","Cumin","Beef","Guacamole"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (list.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "kitchenCell", for: indexPath) as! MyKitchenTableViewCell
        if ( UIImage(named: (list[indexPath.row] + ".jpg")) ) != nil {
            cell.myKitchenImage.image = UIImage(named: (list[indexPath.row] + ".jpg"))
        } else {
            cell.myKitchenImage.image = UIImage(named: ("default.jpg"))
        }
        
        cell.myKitchenLabel.text = list[indexPath.row]
        
        
        return(cell)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    
    
    
    
    
    
    
    
}
