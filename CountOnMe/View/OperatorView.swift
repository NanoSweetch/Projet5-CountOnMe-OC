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
    
    // Ajoute un espace entre les élements sur l'affichage ?
    var elements: [String] {
        return display.textView.text.split(separator: " ").map { "\($0)" }
    }
    
     // MARK: - IBAction tappedAdditionButton
    /// IBAction tappedAdditionButton allows the addition of the operator +
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        if calculateManager.canAddOperator(elements: elements) {
            display.textView.text.append(Constants.addition.rawValue)
        } else {
            controller.alertOperatorUsed()
        }
    }
    
     // MARK: - IBAction tappedSubstractionButton
    /// IBAction tappedSubstractionButton allows the addition of the operator -
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        if calculateManager.canAddOperator(elements: elements) {
            display.textView.text.append(" - ")
        } else {
            controller.alertOperatorUsed()
        }
    }
    
     // MARK: - IBAction tappedMultiplicationButton
    /// IBAction tappedMultiplicationButton allows the addition of the operator X
    @IBAction func tappedMultiplicationButton(_ sender: UIButton) {
        if calculateManager.canAddOperator(elements: elements) {
            display.textView.text.append(" × ")
        } else {
            controller.alertOperatorUsed()
        }
    }
    
     // MARK: - IBAction tappedDivisionButton
    /// IBAction tappedDivisionButton allows the addition of the operator /
    @IBAction func tappedDivisionButton(_ sender: UIButton) {
        if calculateManager.canAddOperator(elements: elements) {
            display.textView.text.append(" ÷ ")
        } else {
            controller.alertOperatorUsed()
        }
    }
    
     // MARK: - IBAction tappedEqualButton
    /// IBAction tappedEqualButton allows the addition of the operator = and triggers the calculation
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
