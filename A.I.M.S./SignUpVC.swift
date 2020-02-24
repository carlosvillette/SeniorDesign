//
//  SignUpVC.swift
//  A.I.M.S.
//
//  Created by Guy Carlos Villette on 2/23/20.
//  Copyright © 2020 Guy Carlos Villette. All rights reserved.
//

import UIKit
import Firebase
class SignUpVC: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    
    @IBAction func onSignUpTapped(_ sender: Any) {
        guard let username = userNameTF.text,
            username != "",
            let email = emailTF.text,
            email != "",
            let password = passwordTF.text,
            password != ""
            else {
                let alertInfo = UIAlertController(title: "Missing Info", message: "Please fill out all fields", preferredStyle: UIAlertController.Style.alert)
                alertInfo.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
                self.present(alertInfo, animated: true, completion: nil)
                return}
        
        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
            
            guard error == nil else {
                let alertInfo = UIAlertController(title: "Error", message: error!.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                alertInfo.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
                self.present(alertInfo, animated: true, completion: nil)
                return
            }
            guard let user = user else { return }
            print(user.user.email ?? "MISSING EMAIL")
            print(user.user.uid)
            
            let changeRequest = user.user.createProfileChangeRequest()
            changeRequest.displayName = username
            changeRequest.commitChanges(completion: { (error) in
                guard error == nil else {
                    let alertInfo = UIAlertController(title: "Error", message: error!.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    alertInfo.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alertInfo, animated: true, completion: nil)
                    return
                }
                
                self.performSegue(withIdentifier: "signUpSegue", sender: nil)
                
            })
            
            
            
        })
        
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
