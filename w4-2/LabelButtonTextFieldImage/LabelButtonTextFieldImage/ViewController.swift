//
//  ViewController.swift
//  LabelButtonTextFieldImage
//
//  Created by cs316 on 2020-01-25.
//  Copyright © 2020 cs316. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate  {

    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var inputTextfield: UITextField!
    @IBOutlet weak var imageSlider: UISlider!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageChoice: UISegmentedControl!
    
    @IBAction func getInput(_ sender: Any) {
       outputLabel.text = "Hello, " + inputTextfield.text!
    }
    
    @IBAction func setValue(_ sender: Any) {
        if (imageSlider.value < 0.34) {
            imageView.image = UIImage(named: "norway")
        }
        else if (imageSlider.value > 0.67){
            imageView.image = UIImage(named: "forest_park")
        } else {
            imageView.image = UIImage(named: "italy")
        }
    }
    
    @IBAction func gettingImage(_ sender: Any) {
        let imageNum = imageChoice.selectedSegmentIndex
        switch imageNum {
        case 0:
            imageView.image = UIImage(named: "norway")
            break
        case 1:
            imageView.image = UIImage(named: "italy")
            break
        case 2:
            imageView.image = UIImage(named: "forest_park")
            break
        default: break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
   
        self.inputTextfield.delegate = self    //***
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        inputTextfield.resignFirstResponder()
        return true
    }


}
