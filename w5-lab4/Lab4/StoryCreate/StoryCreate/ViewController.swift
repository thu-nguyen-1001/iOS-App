//
//  ViewController.swift
//  StoryCreate
//
//  Created by anh thu on 2022-02-07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputPlaceTextField: UITextField!
    @IBOutlet weak var inputVerbTextField: UITextField!
    @IBOutlet weak var inputNumberTextField: UITextField!
    @IBOutlet weak var inputTemplateTextView: UITextView!
    @IBOutlet weak var outputStoryTextView: UITextView!
    
    @IBAction func createStory(_ sender: Any) {
        var story = inputTemplateTextView.text!
        var place = inputPlaceTextField.text!
        story = story.replacingOccurrences(of:"<place>", with: place)
        var verb = inputVerbTextField.text!
        story = story.replacingOccurrences(of:"<verb>", with: verb)
        var number = inputNumberTextField.text!
        story = story.replacingOccurrences(of:"<number>", with: number)

        outputStoryTextView.text = story
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

