//
//  ViewController.swift
//  MyModalEditor
//
//  Created by anh thu on 2022-02-13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailLabel: UILabel!
    
    // This function will be linked programmatically from the “Unwind segue” to be // created later in the EditViewController layout.
    @IBAction func exitToHere(_ sender: UIStoryboardSegue) { // No code needed!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

