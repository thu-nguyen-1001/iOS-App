//
//  FirstViewController.swift
//  TabbedApplication
//
//  Created by anh thu on 2022-02-14.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var name1TextField: UITextField!
    @IBOutlet weak var message1Label: UILabel!
    
    @IBAction func hideKeyboard (_ sender: AnyObject) {
        name1TextField.resignFirstResponder()
    }
    override func viewWillAppear(_ animated: Bool) {
     super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if let secondTab = self.tabBarController!.viewControllers![1]
        as? SecondViewController {
        
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            formatter.timeStyle = .short
            let dateString = formatter.string(from: datePicker.date)
            secondTab.message2Label.text = "Hey, " + name1TextField.text!
                + "! Your next appointment is on " + dateString
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

