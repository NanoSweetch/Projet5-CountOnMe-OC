//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class CountOnMeViewController: UIViewController {
    
    @IBOutlet weak var displayView: DisplayView!
    @IBOutlet weak var numberView: NumberView!
    @IBOutlet weak var operatorView: OperatorView!
    let calculatesManager = CalculatesManager()
    
    // Adds a space between elements on the display
          var elements: [String] {
              return displayView.textView.text.split(separator: " ").map { "\($0)" }
          }
    
   // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberView.delegate = self
        operatorView.delegate = self
        
    }

    // MARK: - Alerts functions
    /// Launches the creation of an alert
    func alertOperatorUsed() {
        createAlert(message: Constants.oneOperatorIsAlreadyInUse.rawValue)
    }
    
    /// Creating an Alert
    /// - Parameter message: Retrieve the message parameter thanks to the enumeration Constants
    func createAlert(message: String) {
        let alertVC = UIAlertController(title: "Attention:", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        return self.present(alertVC, animated: true, completion: nil)

    }
}

// MARK: - Extension controller
extension CountOnMeViewController: NumberViewDelegate {
    
    func resetButtonDidPressed(reset: UIButton) {
            displayView.textView.text = nil
        }
    
    func numberButtonDidPressed(number: UIButton) {
        guard let numberText = number.title(for: .normal) else {
               return
           }
        displayView.textView.text.append(numberText)
    }
    
}

extension CountOnMeViewController: OperatorViewDelegate {
    func equalButtonDidPressed(equal: UIButton) {
        guard calculatesManager.expressionIsCorrect(elements: elements) else {
            return self.createAlert(message: Constants.enterCorrectExpression.rawValue)
        }
        
        guard calculatesManager.expressionHaveEnoughElement(elements: elements) else {
            return self.createAlert(message: Constants.startNewCalcul.rawValue)
        }
        
        if let operationsToReduce = calculatesManager.opertorToReduce(elements: elements), let result = operationsToReduce.first {
            displayView.textView.text = result.replacingOccurrences(of: ".0", with: "")
        }
    }
    
    func divisionButtonDidPressed(division: UIButton) {
        if calculatesManager.canAddOperator(elements: elements) {
            displayView.textView.text.append(" ÷ ")
        } else {
            self.alertOperatorUsed()
        }
    }
    
    func multiplicationButtonDidPressed(multiplication: UIButton) {
        if calculatesManager.canAddOperator(elements: elements) {
            displayView.textView.text.append(" × ")
        } else {
            self.alertOperatorUsed()
        }
    }
    
    func substractionButtonDidPressed(substraction: UIButton) {
        if calculatesManager.canAddOperator(elements: elements) {
            displayView.textView.text.append(" - ")
        } else {
            self.alertOperatorUsed()
        }
    }
    
    func additionButtonDidPressed(addition: UIButton) {
        if calculatesManager.canAddOperator(elements: elements) {
            displayView.textView.text.append(Constants.addition.rawValue)
        } else {
            self.alertOperatorUsed()
        }
    }
    
    
}
