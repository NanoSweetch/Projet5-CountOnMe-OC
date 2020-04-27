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
    
    let display = DisplayView()
    
    let controller = ViewController()
    
    var elements: [String] {
        return display.textView.text.split(separator: " ").map { "\($0)" }
    }
    
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        if calculateManager.canAddOperator(elements: elements) {
            display.textView.text.append(Constants.addition.rawValue)
        } else {
            controller.alertOperatorUsed()
        }
    }
    
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        if calculateManager.canAddOperator(elements: elements) {
            display.textView.text.append(" - ")
        } else {
            controller.alertOperatorUsed()
        }
    }
    
    @IBAction func tappedMultiplicationButton(_ sender: UIButton) {
        if calculateManager.canAddOperator(elements: elements) {
            display.textView.text.append(" × ")
        } else {
            controller.alertOperatorUsed()
        }
    }
    
    @IBAction func tappedDivisionButton(_ sender: UIButton) {
        if calculateManager.canAddOperator(elements: elements) {
            display.textView.text.append(" ÷ ")
        } else {
            controller.alertOperatorUsed()
        }
    }
    
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        guard calculateManager.expressionIsCorrect(elements: elements) else {
            return controller.createAlert(message: Constants.enterCorrectExpression.rawValue)
        }
        
        guard calculateManager.expressionHaveEnoughElement(elements: elements) else {
            return controller.createAlert(message: Constants.startNewCalcul.rawValue)
        }
        
        let operationsToReduce = calculateManager.opertorToReduce(elements: elements)
        
        display.textView.text.append(" = \(operationsToReduce.first!)")
    }
}
