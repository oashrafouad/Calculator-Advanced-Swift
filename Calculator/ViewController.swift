//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    var number = ""
    var isFinishedTyping = true
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        // Note: numValue includes the "." symbol
        if let numValue = sender.currentTitle {
            
            if isFinishedTyping {
                displayLabel.text = numValue
                isFinishedTyping = false
            } else {
                displayLabel.text! += numValue
            }
        }
        
    }
    
}

