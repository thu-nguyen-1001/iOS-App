//
//  ViewController.swift
//  CreateStory2
//
//  Created by anh thu on 2022-02-15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var verbLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var templateTextView: UITextView!
    @IBOutlet weak var storyTextView: UITextView!
    
    @IBAction func exitToHere(_ sender: UIStoryboardSegue) { // No code needed!
    }
    
    @IBAction func getData(_ sender: Any) {
       // (presentingViewController as! ViewController).emailLabel.text = emailField.text
    }
    
    @IBAction func createStory(_ sender: Any) {
        var story = templateTextView.text;
        
        story = story?.replacingOccurrences(of: "<place>", with: placeLabel.text!)
        
        story = story?.replacingOccurrences(of: "<verb>", with: verbLabel.text!)
        
        story = story?.replacingOccurrences(of: "<number>", with: numberLabel.text!)
        
        storyTextView.text = story;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


