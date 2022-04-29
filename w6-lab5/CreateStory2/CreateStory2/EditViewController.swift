//
//  EditViewController.swift
//  CreateStory2
//
//  Created by anh thu on 2022-02-15.
//


import UIKit

class EditViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var triplePicker: UIPickerView!
    private let placeComponent = 0
    private let verbComponent = 1
    private let numberComponent = 2
    
    private let places = ["Kamloops", "Kelowna", "Penticton", "Vernon"]
    private let verbs = ["eat", "play", "drink", "party", "laugh"]
    private let numbers = Array(2...20)
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == placeComponent {
            return places.count
        } else if component == verbComponent {
            return verbs.count
        } else {
            return numbers.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent
    component: Int) -> String? {
        if component == placeComponent {
            return places[row]
        } else if component == verbComponent {
            return verbs[row]
        } else {
            return String(numbers[row])
        }
    }

    
    @IBAction func getSelection(_ sender: Any) {
        let placeIndex = triplePicker.selectedRow(inComponent: placeComponent)
        let verbIndex = triplePicker.selectedRow(inComponent: verbComponent)
        let numberIndex = triplePicker.selectedRow(inComponent: numberComponent)
        (presentingViewController as! ViewController).placeLabel.text = places[placeIndex];
        (presentingViewController as! ViewController).verbLabel.text = verbs[verbIndex]
        (presentingViewController as! ViewController).numberLabel.text = String(numbers[numberIndex])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        triplePicker.dataSource = self
        triplePicker.delegate = self
    }


}
