//
//  Calculates.swift
//  CountOnMe
//
//  Created by Maxime DUTOUR on 13/04/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import Foundation

class CalculatesManager {
    
    var result: Float?
    
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
        
        // Iterate over operations while an operand still here
        while operationsToReduce.count > 1 {
            
            // Par defaut, on prend le premier operateur
            var indexOperand = 1
            
            // Sauf s'il y a une multi
            if let multiOperand = operationsToReduce.firstIndex(of: "×") {
                indexOperand = multiOperand
            }
            // Div prioritaire sur multi ex: 1/2*4
            if let divOperand = operationsToReduce.firstIndex(of: "÷") {
                indexOperand = divOperand
            }
            
            // Si 1+2*4 indexOperand = 3
            let left = Float(operationsToReduce[indexOperand - 1])!
            let operand = operationsToReduce[indexOperand]
            let right = Float(operationsToReduce[indexOperand + 1])!
            
            let result: Float
            switch operand {
            case "+": result = left + right
            case "-": result = left - right
            case "×": result = left * right
            case "÷": result = left / right
            case "=": result = left + right
            default: fatalError("Unknown operator !")
            }
            
            // Si 1+2*4, il faut supprimer du tableau 2,* et 4
            operationsToReduce.remove(at: indexOperand + 1)
            operationsToReduce.remove(at: indexOperand)
            operationsToReduce.remove(at: indexOperand - 1)

            // On a dans le tableau "1+", il faut ajouter le resultat "1+8"
            operationsToReduce.insert("\(result)", at: indexOperand - 1)
            
            // et on peut refaire un tour pour faire l'addition
        }
        return operationsToReduce
    }
}
