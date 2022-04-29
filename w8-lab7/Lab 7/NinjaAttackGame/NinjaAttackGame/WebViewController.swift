//
//  WebViewController.swift
//  NinjaAttackGame
//
//  Created by anh thu on 2022-03-13.
//


import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var siteView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       // loadSpinner.isHidden = true
        loadAddress()
                
        siteView = WKWebView()
    }
    func loadAddress() {
        let myURL = URL(string:"https://thunguyen.site/login/userlogin.php")
        let request = URLRequest(url: myURL!)
        siteView.load(request)
    }
   
}

