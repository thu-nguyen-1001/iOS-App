//
//  FirstViewController.swift
//  MyTabBarController
//
//  Created by anh thu on 2022-02-14.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var view1TextField: UITextField!
    @IBOutlet weak var view1DisplayLabel: UILabel!
    
    override func viewWillDisappear(_ animated: Bool) {
        if let secondTab = self.tabBarController!.viewControllers![1] as? SecondViewController {
            secondTab.view2DisplayLabel.text = view1TextField.text!
    + " from Page1!" }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
