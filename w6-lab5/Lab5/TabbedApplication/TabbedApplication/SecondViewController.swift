//
//  SecondViewController.swift
//  TabbedApplication
//
//  Created by anh thu on 2022-02-14.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var name2TextField: UITextField!
    @IBOutlet weak var message2Label: UILabel!
    
    @IBAction func hideKeyboard (_ sender: AnyObject) {
        name2TextField.resignFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if let firstTab = self.tabBarController!.viewControllers![0]
            as? FirstViewController {
            firstTab.message1Label.text = "Okay, " + name2TextField.text! + "!"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

