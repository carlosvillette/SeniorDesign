//
//  ViewController.swift
//  A.I.M.S.
//
//  Created by Guy Carlos Villette on 2/3/20.
//  Copyright © 2020 Guy Carlos Villette. All rights reserved.
//
//NOTE: THE JSON ARRAY MAY CHANGE LENGTH FROM 4 TO 3 SO NEED TO MAKE A MORE ROBUST FUNCTION FOR THIS
import UIKit

class ViewController: UIViewController {
    struct JSONValues: Codable{
        let temp: String
        let humidity: String
        let weight: String
    }
    var jsonValue = "EMPTY"
    var index = 1
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var amountLeftLabel: UILabel!
    @IBOutlet weak var boughtLabel: UILabel!
    @IBOutlet weak var expireLabel: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    let urlString = "https://io.adafruit.com/api/v2/SimonHeimowitz/feeds?x-aio-key=d05f6c8da5fe4c8783c2326c3b8f30b3"
    
    /*func lastValue(URL1: String, num: Int, name: String) -> String {
        var jValue = ""
        let value:[Int:String] = [1:"Temperature",2:"Humidity",3:"Weight"]
        
        guard let url = URL(string: URL1) else { return "" }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            /*if let response = response {
             print(response)
             }*/
            
            if let data = data {
                print(data)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    
                    
                    if let array = json as? [Any]{
                        /*for object in array {
                         print("ARRAY OBJECT ")
                         print(object)
                         //self.index = self.index + 1
                         }*/
                        if let jsonArray = array[num] as? [String: Any]  {
                            //print("THIS IS JSON ARRAY")
                            //print(jsonArray)
                            
                            //let weightDict = weightArray[13] as? [String: Any]
                            self.jsonValue = jsonArray["last_value"] as? String ?? ""
                            jValue = jsonArray["last_value"] as? String ?? ""
                            
                            print(value[num]! + " VALUE:")
                            print(self.jsonValue)
                            //self.tempLabel.text = self.jsonValue
                            //return jsonValue
                            
                            
                        }
                        for json in array  {
                            for (key, value) in (json as? [String: Any])!{
                                if key == "name"{
                                    let theValue: String = value as! String
                                    switch theValue {
                                        case "temperature":
                                        DispatchQueue.main.async {
                                            self.tempLabel.text = "Temperature: \(String(json["last_value"]) )"
                                            
                                        }
                                        case "humidity":
                                        DispatchQueue.main.async {
                                            self.humidityLabel.text = "Humidity: \(json["last_value"] as? String ?? "")"
                                            
                                        }
                                        case "weight":
                                        DispatchQueue.main.async {
                                            self.tempLabel.text = "Weight: \(json["last_value"] as? String ?? "")"
                                            
                                        }
                                        
                                    default:
                                        print ("MISTAKES WERE MADE")
                                    }
                                }
                            }
                        }
                    }
                    
                } catch {
                    print(error)
                }
                
            }
            }.resume()
        return ""
        
    }*/

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = list[myIndex]
        amountLeftLabel.text = amountLeft[myIndex]
        boughtLabel.text = itemBought[myIndex]
        expireLabel.text = itemExpire[myIndex]
        if ( UIImage(named: (list[myIndex] + ".jpg")) ) != nil {
            myImageView.image = UIImage(named: (list[myIndex] + ".jpg"))
        } else {
            myImageView.image = UIImage(named: ("default.jpg"))
        }
        //tempLabel.text = lastValue(URL1: url, num: 1) // DON'T SEE VALUE FOR SOME REASON???
        //print(self.jsonValue)
        //print(lastValue(URL1: urlString, num: 1) )
        //lastValue(URL1: url, num: 2)
        //lastValue(URL1: url, num: 3)
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            /*if let response = response {
             print(response)
             }*/
            
            if let data = data {
                print(data)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    
                    
                    if let array = json as? [Any]{
                        /*for object in array {
                         print("ARRAY OBJECT ")
                         print(object)
                         //self.index = self.index + 1
                         }*/
                        if let jsonArray = array[0] as? [String: Any]  {
                            //print("THIS IS JSON ARRAY")
                            //print(jsonArray)
                            
                            //let weightDict = weightArray[13] as? [String: Any]
                            self.jsonValue = jsonArray["last_value"] as? String ?? ""
                            
                            print( "Temperature VALUE:")
                            print(self.jsonValue)
                            DispatchQueue.main.async {
                                self.tempLabel.text = "Temperature: \(jsonArray["last_value"] as? String ?? "")"
                                
                            }
                            
                            
                        }
                        
                        if let jsonArray = array[1] as? [String: Any]  {
                            //print("THIS IS JSON ARRAY")
                            //print(jsonArray)
                            
                            //let weightDict = weightArray[13] as? [String: Any]
                            self.jsonValue = jsonArray["last_value"] as? String ?? ""
                            
                            print( "Temperature VALUE:")
                            print(self.jsonValue)
                            DispatchQueue.main.async {
                                self.humidityLabel.text = "Humidity: \(jsonArray["last_value"] as? String ?? "")"
                                
                            }
                            
                            
                        }
                        
                        if let jsonArray = array[2] as? [String: Any]  {
                            //print("THIS IS JSON ARRAY")
                            //print(jsonArray)
                            
                            //let weightDict = weightArray[13] as? [String: Any]
                            self.jsonValue = jsonArray["last_value"] as? String ?? ""
                            
                            print( "Temperature VALUE:")
                            print(self.jsonValue)
                            DispatchQueue.main.async {
                                self.weightLabel.text = "Weight: \(jsonArray["last_value"] as? String ?? "")"
                                
                            }
                            
                            
                        }
                    }
                    
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
