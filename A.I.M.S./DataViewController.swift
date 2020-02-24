//
//  DataViewController.swift
//  A.I.M.S.
//
//  Created by Guy Carlos Villette on 2/2/20.
//  Copyright © 2020 Guy Carlos Villette. All rights reserved.
//

import UIKit
import Firebase

let list = ["Milk","Bread","Cheese","Juice"]
var itemExpire = ["Expires: 2/27/20", "Expires: 2/23/20", "Expires: 2/22/20", "Expires: 2/24/20" ]
var itemBought = ["Bought on: 2/10/20", "Bought on: 2/10/20", "Bought on: 2/10/20", "Bought on: 2/10/20"]
var amountLeft = ["Amount Left: .5 gallons", "Amount Left: 10 bread slices", "Amount Left: 12 slices", "Amount Left: .2 gallons"]
var myIndex=0

class DataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBAction func onSignOutTapped(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "signOutSegue", sender: nil)
        } catch {
            print(error)
        }
    }
    

    @IBOutlet weak var dataLabel: UILabel!
    var dataObject: String = ""
   // let list = ["Milk","Bread","Cheese","Juice"]
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
    return(list.count)
    }
    
    
    
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DataViewControllerTableViewCell
        //cell.textLabel?.text = list[indexPath.row]
        cell.myImage.image = UIImage(named: (list[indexPath.row] + ".jpg"))
        cell.myLabel.text = list[indexPath.row]
        
        
        return(cell)
    }
    
    


/*
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.dataLabel!.text = dataObject
    }
    */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }


}

