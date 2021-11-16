//
//  ViewController.swift
//  Track
//
//  Created by Daniel Williams on 11/7/21.
//  Copyright © 2021 Daniel Williams. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBAction func shortAction(_ sender: Any) {
        timerLabel.text = "5:00"
        textLabel.text = "Relax...for now"
        
    }
    
    @IBAction func pomoAction(_ sender: Any) {
        timerLabel.text = "25:00"
        textLabel.text = "Focus!"
    }
    
    
    @IBAction func longAction(_ sender: Any) {
        timerLabel.text = "10:00"
        textLabel.text = "Relax...for now"
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

