//
//  WebsiteViewController.swift
//  A.I.M.S.
//
//  Created by Guy Carlos Villette on 4/5/20.
//  Copyright © 2020 Guy Carlos Villette. All rights reserved.
//

import UIKit
import WebKit

class WebsiteViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let url = NSURL(string: websites[webIndex])
        let request = NSURLRequest(url: url! as URL)
        self.webView.load(request as URLRequest)
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
