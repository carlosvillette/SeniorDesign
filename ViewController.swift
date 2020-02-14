//
//  ViewController.swift
//  A.I.M.S.
//
//  Created by Guy Carlos Villette on 2/3/20.
//  Copyright © 2020 Guy Carlos Villette. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var index = 1
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var amountLeftLabel: UILabel!
    @IBOutlet weak var boughtLabel: UILabel!
    @IBOutlet weak var expireLabel: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = list[myIndex]
        amountLeftLabel.text = amountLeft[myIndex]
        boughtLabel.text = itemBought[myIndex]
        expireLabel.text = itemExpire[myIndex]
        myImageView.image = UIImage(named: list[myIndex] + ".jpg")
        
        
        guard let url = URL(string: "https://io.adafruit.com/api/v2/SimonHeimowitz/feeds?x-aio-key=d05f6c8da5fe4c8783c2326c3b8f30b3") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            if let data = data {
                print(data)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    if let dictionary = json as? [String: Any] {
                        
                        if let temp = dictionary["temperature"] as? String {
                            self.tempLabel.text = temp
                            print("IT WORKKS!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                            print(temp)
                        
                        }
                        
                        for (key, value) in dictionary {
                            print("____________________________________________________________________")
                            print("key: " + key)
                            print("value: ")
                            print(value)
                            print("____________________________________________________________________")
                            
                        }
                    }
                    
                    if let array = json as? [Any]{
                        for object in array {
                            print("ARRAY OBJECT ")
                            print(object)
                            self.index = self.index + 1
                        }
                        if let weightArray = array[3] as? [String: Any] {
                            print("THIS IS WEIGHT ARRAY")
                            print(weightArray)
                            if let weight = weightArray["last_value"] as? [String: Any] {
                                print("THIS IS THE WEIGHT")
                                print(weight)
                            }
                        }
                    }
                    //print(json)
                } catch {
                    print(error)
                }
                
            }
            }.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
