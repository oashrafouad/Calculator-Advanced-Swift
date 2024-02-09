//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Omar Ashraf on 09/02/2024.
//  Copyright © 2024 London App Brewery. All rights reserved.
//

import Foundation

class CalculatorLogic {
    
    var number: Double
    
    init(number: Double) {
        self.number = number
    }
    
    func calcResult(symbol: String) -> Double? { // TODO: Implement a better solution than returning an optional value
        switch symbol {
        case "+/-":
            return number * -1
        case "AC":
            return 0
        case "%":
            return number / 100
        default:
            return nil
        }
    }
}
