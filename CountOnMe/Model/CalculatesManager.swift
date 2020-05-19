//
//  Calculates.swift
//  CountOnMe
//
//  Created by Maxime DUTOUR on 13/04/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import Foundation

class CalculatesManager {
    
    // MARK: - Verification Functions
    /// Verification of the expression
    /// - Parameter elements: Checks in the element array "String"
    /// - Returns: A boolean: true or false
    func expressionIsCorrect(elements: [String]) -> Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "×" && elements.last != "÷"
    }
    
    /// Checks if there are enough elements to make a calculation
    /// - Parameter elements: Checks in the element array "String"
    /// - Returns: A boolean: true or false
    func expressionHaveEnoughElement(elements: [String]) -> Bool {
        return elements.count >= 3
    }
    
    /// Verification for adding a new operator
    /// - Parameter elements: Checks in the element array "String"
    /// - Returns: A boolean: true or false
    func canAddOperator(elements: [String]) -> Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "×" && elements.last != "÷" && elements.count != 0
    }
     
    // MARK: - Calculation algorithm
    func opertorToReduce(elements: [String]) -> [String]? {
        // Create local copy of operations
        var operationsToReduce = elements
        
        // Iterate over operations while an operand still here
        while operationsToReduce.count > 1 {
            
            // By default, we take the first operator
            var indexOperand = 1
            
            // Unless there's a multiplication
            if let multiOperand = operationsToReduce.firstIndex(of: "×") {
                indexOperand = multiOperand
            }
            // Priority division on multiplication ex: 1/2*4
            if let divOperand = operationsToReduce.firstIndex(of: "÷") {
                indexOperand = divOperand
            }
            
            // if 1+2*4 indexOperand = 3
            guard let left = Float(operationsToReduce[indexOperand - 1]) else { return nil}
            let operand = operationsToReduce[indexOperand]
            guard let right = Float(operationsToReduce[indexOperand + 1]) else { return nil }
            
            let result: Float
            switch operand {
            case "+": result = left + right
            case "-": result = left - right
            case "×": result = left * right
            case "÷": result = left / right
            default: fatalError("Unknown operator !")
            }
            
            // If 1+2*4, the following must be deleted from array 2* and 4
            operationsToReduce.remove(at: indexOperand + 1)
            operationsToReduce.remove(at: indexOperand)
            operationsToReduce.remove(at: indexOperand - 1)

            // We have in the table "1+", we have to add the result "1+8"...
            operationsToReduce.insert("\(result)", at: indexOperand - 1)
            
            // and we can go around the block again and do the check.
        }
        return operationsToReduce
    }
}
