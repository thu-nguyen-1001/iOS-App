//
//  SecondViewController.swift
//  MyTabBarController
//
//  Created by anh thu on 2022-02-14.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var view2TextField: UITextField!
    @IBOutlet weak var view2DisplayLabel: UILabel!
    
    override func viewWillDisappear(_ animated: Bool) {
        if let firstTab = self.tabBarController!.viewControllers![0] as?
    FirstViewController {
            firstTab.view1DisplayLabel.text = view2TextField.text! + " from Page2!"
    } }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
