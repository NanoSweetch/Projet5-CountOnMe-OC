//
//  OperatorView.swift
//  CountOnMe
//
//  Created by Maxime DUTOUR on 26/04/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import UIKit

class OperatorView: UIView {

    let calculateManager = CalculatesManager()
    
    let textDisplay = DisplayView()
    
    
    var elements: [String] {
        return textView.text.split(separator: " ").map { "\($0)" }
    }
    
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        if calculateManager.canAddOperator(elements: elements) {
            textView.text.append(Constants.addition.rawValue)
        } else {
           alertOperatorUsed()
        }
    }
    
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        if calculateManager.canAddOperator(elements: elements) {
            textView.text.append(" - ")
        } else {
           alertOperatorUsed()
        }
    }
    
    @IBAction func tappedMultiplicationButton(_ sender: UIButton) {
        if calculateManager.canAddOperator(elements: elements) {
            textView.text.append(" × ")
        } else {
            alertOperatorUsed()
        }
    }
    
    @IBAction func tappedDivisionButton(_ sender: UIButton) {
        if calculateManager.canAddOperator(elements: elements) {
            textView.text.append(" ÷ ")
        } else {
            alertOperatorUsed()
        }
    }
    
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        guard calculateManager.expressionIsCorrect(elements: elements) else {
            return createAlert(message: Constants.enterCorrectExpression.rawValue)
        }
        
        guard calculateManager.expressionHaveEnoughElement(elements: elements) else {
            return createAlert(message: Constants.startNewCalcul.rawValue)
        }
        
        let operationsToReduce = calculateManager.opertorToReduce(elements: elements)
        
        textView.text.append(" = \(operationsToReduce.first!)")
    }
}
