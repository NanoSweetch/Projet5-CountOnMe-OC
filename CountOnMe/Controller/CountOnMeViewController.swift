//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    let calculateManager = CalculatesManager()
    
    var elements: [String] {
        return textView.text.split(separator: " ").map { "\($0)" }
    }
    
    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // ***********------------***********
    // MARK: - @IBActions
    // ***********------------***********
    // View actions
    @IBAction func tappedResetButton(_ sender: UIButton) {
        textView.text = nil
    }
    
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        
        if calculateManager.expressionIsCorrect(elements: elements) {
            textView.text = ""
        }
        
        textView.text.append(numberText)
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

    // ***********:::::::::::::::::***********
    // MARK: - Alerts
    // ***********------------***********
    private func alertOperatorUsed() {
        createAlert(message: Constants.oneOperatorIsAlreadyInUse.rawValue)
    }
    
    func createAlert(message: String) {
        let alertVC = UIAlertController(title: "Attention:", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        return self.present(alertVC, animated: true, completion: nil)

    }
}
