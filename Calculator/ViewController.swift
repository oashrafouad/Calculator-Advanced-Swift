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
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Failed to convert display label text to Double, possibly because it contains non-numerical characters")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTyping = true
        
        if let calcSymbol = sender.currentTitle {
            let calculatorLogic = CalculatorLogic(number: displayValue)
            
            guard let result = calculatorLogic.calcResult(symbol: calcSymbol) else {
                fatalError("The result of the calculation is nil")
            }
            
            displayValue = result
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
                    // Quick way to initialize boolean
                    let isInt = (floor(displayValue) == displayValue)
                    
                    if !isInt {
                        return
                    }
                }
                
                displayLabel.text! += numValue
            }
        }
    }
}
