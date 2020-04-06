//
//  RecipeViewController.swift
//  A.I.M.S.
//
//  Created by Guy Carlos Villette on 4/5/20.
//  Copyright © 2020 Guy Carlos Villette. All rights reserved.
//

import UIKit
var websites = ["https://www.simplyrecipes.com/recipes/how_to_make_perfect_hard_boiled_eggs/","https://www.simplyrecipes.com/recipes/french_toast/","https://www.simplyrecipes.com/recipes/tuna_patties/","https://www.simplyrecipes.com/recipes/steamed_broccoli/","https://www.simplyrecipes.com/recipes/roasted_broccoli/","https://www.simplyrecipes.com/recipes/spaghetti_alla_carbonara/","https://www.simplyrecipes.com/recipes/caprese_pasta_salad/","https://www.simplyrecipes.com/recipes/nachos/"]

var webIndex=0

class RecipeViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    var labels = ["Hard Boiled Egg","French Toast","Tuna Patties","Steamed Broccoli","Roasted Parmesan Broccoli","Spagheti Pasta Carbonara","Caprese Pasta Salad","Nachos"]
    var pics = ["1","2","3","4","5","6","7","8"]
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (labels.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath) as! RecipeTableViewCell
        if ( UIImage(named: (pics[indexPath.row] + ".jpg")) ) != nil {
            cell.myRecipeImage.image = UIImage(named: (pics[indexPath.row] + ".jpg"))
        } else {
            cell.myRecipeImage.image = UIImage(named: ("default.jpg"))
        }
        
        cell.myRecipeLabel.text = labels[indexPath.row]
        
        
        return(cell)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        webIndex = indexPath.row
        performSegue(withIdentifier: "webSegue", sender: self)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
