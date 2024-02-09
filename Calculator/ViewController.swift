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
    
    private var isFinishedTyping = true
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTyping = true
        
        guard let number = Double(displayLabel.text!) else {
            fatalError("Failed to convert display label text to Double, possibly because it contains non-numerical characters")
        }

        
        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
                displayLabel.text = String(number * -1)
            } else if calcMethod == "AC" {
                displayLabel.text = "0"
            } else if calcMethod == "%" {
                displayLabel.text = String(number / 100)
            }
        }
        
        
//        var number: Float {
//            get   {
//                var tempNumber: Float = 0.0
//                if let pressedButton = sender.currentTitle {
//                    switch pressedButton {
//                    case "AC":
//                        tempNumber = 0
//                    case "+/-":
////                        let x = 5.2
////                        let y = Int(x)
////                        print(y)
//                        print(displayLabel.text!)
//                        let displayLabelFloat = Float(displayLabel.text!)!
//                        let displayLabelFloatInt = Int(displayLabelFloat)
//                        let displayLabelFloatIntFloat = Float(displayLabelFloat)
//                        tempNumber = -displayLabelFloat
//                    case "%":
//                        tempNumber = Float(displayLabel.text!)! / 100
//                    default:
//                        tempNumber = 0
//                    }
//                }
//                return tempNumber
//            }
//
//        }
//        displayLabel.text = "\(number)"
        
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        // Note: numValue includes the "." symbol
        if let numValue = sender.currentTitle {
            
            if isFinishedTyping {
                displayLabel.text = numValue
                isFinishedTyping = false
            } else {
                if numValue == "." {
                    
                    guard let currentDisplayValue = Double(displayLabel.text!) else {
                        fatalError("Failed to convert display label text to Double, possibly because it contains non-numerical characters")
                    }
                    // Quick way to initialize boolean
                    let isInt = (floor(currentDisplayValue) == currentDisplayValue)
                    
                    if !isInt {
                        return
                    }
                }
                
                displayLabel.text! += numValue
            }
        }
    }
}
