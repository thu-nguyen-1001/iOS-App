//
//  ViewController.swift
//  CustomizedPicker
//
//  Created by anh thu on 2022-02-14.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var doublePicker: UIPickerView!
    private let fillingComponent = 0
    private let breadComponent = 1
    private let fillingTypes = ["Ham", "Turkey", "Peanut Butter", "Tuna Salad", "Chicken Salad",
    "Roast Beef", "Vegemite"]
    private let breadTypes = [ "White", "Whole Wheat", "Rye", "Sourdough","Seven Grain"]

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == breadComponent { return breadTypes.count
        } else {
        return fillingTypes.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == breadComponent { return breadTypes[row]
        } else {
            return fillingTypes[row]
        }
    }

    @IBAction func selectPicker(_ sender: Any) {
        let fillingRow = doublePicker.selectedRow(inComponent: fillingComponent)
        let breadRow = doublePicker.selectedRow(inComponent: breadComponent)
        let filling = fillingTypes[fillingRow]
        let bread = breadTypes[breadRow]
        let message = "Your \(filling) on \(bread) bread will be right up."
        // create an Alert message to display the selected items
        let alert = UIAlertController(
        title: "Thank you for your order", message: message, preferredStyle: .alert)
        let action = UIAlertAction( title: "Great",
        style: .default,
        handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doublePicker.delegate = self
        doublePicker.dataSource = self
    }


}

