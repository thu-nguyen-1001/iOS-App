//
//  ViewController.swift
//  BunniesHop
//
//  Created by anh thu on 2022-02-07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bunnyView1: UIImageView!
    @IBOutlet weak var bunnyView2: UIImageView!
    @IBOutlet weak var speedSlider: UISlider!
    @IBOutlet weak var speedSegmentedCtrl: UISegmentedControl!
    @IBOutlet weak var toggleButton: UIButton!
    
    @IBAction func setSpeed(_ sender: Any) {
        bunnyView1.animationDuration=TimeInterval(1.25-speedSlider.value)
        bunnyView2.animationDuration=TimeInterval(1.25-speedSlider.value)
        bunnyView1.startAnimating()
        bunnyView2.startAnimating()
        toggleButton.setTitle("Sit Still!", for: UIControl.State())
    }
    @IBAction func controlSpeed(_ sender: Any) {
        let choice = speedSegmentedCtrl.selectedSegmentIndex
        // choice range: 0 - 4
        speedSlider.value = (Float(choice) + 1.0) / 5.0
        setSpeed(speedSlider ?? 1)
    }
    @IBAction func toggleAnimation(_ sender: Any) {
        if(bunnyView1.isAnimating) {
            bunnyView1.stopAnimating()
            bunnyView2.stopAnimating()
            toggleButton.setTitle("Hop!", for: UIControl.State())
        } else {
            bunnyView1.startAnimating()
            bunnyView2.startAnimating()
        
            toggleButton.setTitle("Sit Still!", for: UIControl.State())
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let hopAnimation: [UIImage] = [
            UIImage(named: "frame-1")!,
            UIImage(named: "frame-2")!,
            UIImage(named: "frame-3")!,
            UIImage(named: "frame-4")!,
            UIImage(named: "frame-5")!,
            UIImage(named: "frame-6")!,
            UIImage(named: "frame-7")!,
            UIImage(named: "frame-8")!,
            UIImage(named: "frame-9")!,
            UIImage(named: "frame-10")!,
            UIImage(named: "frame-11")!,
            UIImage(named: "frame-12")!,
            UIImage(named: "frame-13")!,
            UIImage(named: "frame-14")!,
            UIImage(named: "frame-15")!,
            UIImage(named: "frame-16")!,
            UIImage(named: "frame-17")!,
            UIImage(named: "frame-18")!,
            UIImage(named: "frame-19")!,
            UIImage(named: "frame-20")!
        ]
        
        let hopDownAnimation: [UIImage] = [
            UIImage(named: "frame-11")!,
            UIImage(named: "frame-12")!,
            UIImage(named: "frame-13")!,
            UIImage(named: "frame-14")!,
            UIImage(named: "frame-15")!,
            UIImage(named: "frame-16")!,
            UIImage(named: "frame-17")!,
            UIImage(named: "frame-18")!,
            UIImage(named: "frame-19")!,
            UIImage(named: "frame-20")!,
            UIImage(named: "frame-1")!,
            UIImage(named: "frame-2")!,
            UIImage(named: "frame-3")!,
            UIImage(named: "frame-4")!,
            UIImage(named: "frame-5")!,
            UIImage(named: "frame-6")!,
            UIImage(named: "frame-7")!,
            UIImage(named: "frame-8")!,
            UIImage(named: "frame-9")!,
            UIImage(named: "frame-10")!
        ]
        
        bunnyView1.animationImages = hopAnimation
        bunnyView2.animationImages = hopDownAnimation
        bunnyView1.animationDuration = 1.0
        bunnyView2.animationDuration = 1.0
    }


}

