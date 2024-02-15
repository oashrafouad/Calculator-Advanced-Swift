//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Omar Ashraf on 09/02/2024.
//  Copyright © 2024 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    func calcResult(symbol: String) -> Double? { // TODO: Implement a better solution than returning an optional value
        if let safeNumber = number {
            switch symbol {
            case "+/-":
                return safeNumber * -1
            case "AC":
                return 0
            case "%":
                return safeNumber / 100
            default:
                return nil
            }
        }
        return nil
    }
}
