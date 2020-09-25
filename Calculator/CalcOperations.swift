//
//  CalcOperations.swift
//  Calculator
//
//  Created by admin on 23/09/20.
//  Copyright © 2020 Sample. All rights reserved.
//

import Foundation

class CalcOperations {
    
    var result: Double = 0;
    
    var resultString : String {
        get {
            if floor(result) == result {
                if let value = toInt(intValue: result) {
                    return String(value)
                } else {
                    return String(result)
                }
            }
            return String(result)
        }
    }
    
    func doOperation(operation: String, firstOperand: Double, secondOperand: Double) {
        
        switch operation {
            case "+":
                result = firstOperand + secondOperand
            case "-":
                result = firstOperand - secondOperand
            case "x":
                result = firstOperand * secondOperand
            case "÷":
                result = firstOperand / secondOperand
            case "%":
                result = (firstOperand * secondOperand) / 100
            default:
                result = 0
        }
    }
    
    func toInt(intValue: Double) -> Int? {
        if intValue >= Double(Int32.min) && intValue <= Double(Int32.max) {
            return Int(intValue)
        } else {
            return nil
        }
    }
}
