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
    private var calculatorLogic = CalculatorLogic()
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
        
        calculatorLogic.setNumber(displayValue)
        
        if let calcSymbol = sender.currentTitle {
            if let result = calculatorLogic.calcResult(symbol: calcSymbol) {
                displayValue = result
            }
        }
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
