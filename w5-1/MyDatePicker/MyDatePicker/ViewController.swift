//
//  ViewController.swift
//  MyDatePicker
//
//  Created by anh thu on 2022-02-12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateDisplayView: UITextView!
    
    @IBAction func getDateTime(_ sender: Any) {
        let date = datePicker.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "en_US")
        dateDisplayView.text = "Date & Time selected:\n" + dateFormatter.string(from: date)
        
        let components = datePicker.calendar.dateComponents([.day, .month, .year, .hour, .minute], from: datePicker.date)
        let day = components.day!
        let month = components.month!
        let year = components.year!
        let hour = components.hour!
        let minute = components.minute!
        dateDisplayView.text += "\nDate created from Components: \(year)/\(month)/\(day) - \(hour):\(minute)"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let date = Date()
        datePicker.setDate(date, animated: false)
        dateDisplayView.text = "Current Date and Time: \(date)"
    }


}

