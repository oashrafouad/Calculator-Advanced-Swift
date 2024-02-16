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
    
    private var intermediateCalculation: (n1: Double, calcSymbol: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calcResult(symbol: String) -> Double? { // TODO: Implement a better solution than returning an optional value
        if let safeNumber = number {
            switch symbol {
            case "+/-":
                return safeNumber * -1
            case "AC":
                return 0
            case "%":
                return safeNumber / 100
            case "=":
                return performTwoNumCalculation(n2: safeNumber)
            default: // +, -, ×, ÷
                intermediateCalculation = (n1: safeNumber, calcSymbol: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1, let calcSymbol = intermediateCalculation?.calcSymbol {
            switch calcSymbol {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("Unexpected calcSymbol")
            }
        }
        return nil
    }
}
