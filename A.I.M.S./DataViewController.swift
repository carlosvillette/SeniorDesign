//
//  DataViewController.swift
//  A.I.M.S.
//
//  Created by Guy Carlos Villette on 2/2/20.
//  Copyright © 2020 Guy Carlos Villette. All rights reserved.
//

import UIKit
import Firebase

var list = ["Milk","Bread","Cheese","Juice"]
var itemExpire = ["Expires: 2/27/20", "Expires: 2/23/20", "Expires: 2/22/20", "Expires: 2/24/20" ]
var itemBought = ["Bought on: 2/10/20", "Bought on: 2/10/20", "Bought on: 2/10/20", "Bought on: 2/10/20"]
var amountLeft = ["Amount Left: .5 gallons", "Amount Left: 10 bread slices", "Amount Left: 12 slices", "Amount Left: .2 gallons"]
var myIndex=0

class DataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var Item: UITextField!
    @IBOutlet weak var AmountLeft: UITextField!
    @IBOutlet weak var ExpiresOn: UITextField!
    
    @IBAction func onAddItem(_ sender: Any) {
        insertNewItem()
    }
    
    func getDate() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy"
        let yearString = dateFormatter.string(from: date)
        
        let calendar = Calendar.current
        let month = calendar.component(.month, from: date)
        let dayOfMonth = calendar.component(.day, from: date)
        
        return ("\(month)/\(dayOfMonth)/\(yearString)")
    }
    
    func insertNewItem(){
        
        list.append(Item.text!)
        itemExpire.append("Expires: \(ExpiresOn.text!)")
        amountLeft.append("Amount Left: \(AmountLeft.text!)")
        itemBought.append("Bought on: \(getDate())")
        let indexPath = IndexPath(row: list.count-1, section: 0)
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
        
        Item.text = ""
        ExpiresOn.text = ""
        AmountLeft.text = ""
        view.endEditing(true)
        
    }
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
        if ( UIImage(named: (list[indexPath.row] + ".jpg")) ) != nil {
            cell.myImage.image = UIImage(named: (list[indexPath.row] + ".jpg"))
        } else {
            cell.myImage.image = UIImage(named: ("default.jpg"))
        }
        
        cell.myLabel.text = list[indexPath.row]
        
        
        return(cell)
    }
    
    


/*
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     // Table view setup
     tableView = UITableView(frame: view.bounds, style: .plain)
     tableView.delegate = self
     tableView.dataSource = self
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
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            list.remove(at: indexPath.row)
            itemExpire.remove(at: indexPath.row)
            amountLeft.remove(at: indexPath.row)
            itemBought.remove(at: indexPath.row)
            
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }

}

