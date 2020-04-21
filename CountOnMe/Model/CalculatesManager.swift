//
//  Calculates.swift
//  CountOnMe
//
//  Created by Maxime DUTOUR on 13/04/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import Foundation

class CalculatesManager {
    
    var result: Double?
    
    // Error check computed variables
    func expressionIsCorrect(elements: [String]) -> Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "×" && elements.last != "÷"
    }
    
    func expressionHaveEnoughElement(elements: [String]) -> Bool {
        return elements.count >= 3
    }
    
    func canAddOperator(elements: [String]) -> Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "×" && elements.last != "÷"
    }
    
    func expressionHaveResult() -> Bool {
        if result != nil {
            return true
        }
        return false
    }
    
    func opertorToReduce(elements: [String]) -> [String] {
        
        
        // Create local copy of operations
        var operationsToReduce = elements
        
        // vérifier a quel numéro correspondent les oprateur pour ensuite faire des if dans la boucles while pour vérifier si on utilise la division et ou la multiplication pour faire les calcules de ces opérateurs avant les autres.
        // pour vérifier les numéro des opérateurs utiliser: idex of (sa nouvelle écriture) pour vérifier operateursToReduce
        
        // Iterate over operations while an operand still here
        while operationsToReduce.count > 1 {
            let left = Float(operationsToReduce[0])!
            let operand = operationsToReduce[1]
            let right = Float(operationsToReduce[2])!
            
            let result: Float
            switch operand {
            case "+": result = left + right
            case "-": result = left - right
            case "×": result = left * right
            case "÷": result = left / right
            case "=": result = left + right
            default: fatalError("Unknown operator !")
            }
            
            operationsToReduce = Array(operationsToReduce.dropFirst(3))
            operationsToReduce.insert("\(result)", at: 0)
        }
        return operationsToReduce
    }
    
    
    
}
