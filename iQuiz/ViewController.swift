//
//  ViewController.swift
//  iQuiz
//
//  Created by Caio Mori on 21/11/24.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        layoutConfig()
    }
    @IBOutlet weak var startButton: UIButton!
    
    @IBAction func startButton(_ sender: UIButton) {
        print("Start Button Pressed")
    }
    
    func layoutConfig() {
        startButton.layer.cornerRadius = 1.0
    }
}

