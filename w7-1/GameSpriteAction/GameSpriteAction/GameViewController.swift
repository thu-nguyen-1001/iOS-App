//
//  GameViewController.swift
//  GameSpriteAction
//
//  Created by anh thu on 2022-03-04.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        let scene = GameScene(size: view.frame.size)
        let skView = view as! SKView
        skView.presentScene(scene)
    }

   
}
