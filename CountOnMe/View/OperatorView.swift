//
//  OperatorView.swift
//  CountOnMe
//
//  Created by Maxime DUTOUR on 26/04/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import UIKit

// MARK: - Protocol Delegate
protocol OperatorViewDelegate: class {
    func additionButtonDidPressed(addition: UIButton)
    
    func substractionButtonDidPressed(substraction: UIButton)
    
    func multiplicationButtonDidPressed(multiplication: UIButton)
    
    func divisionButtonDidPressed(division: UIButton)
    
    func equalButtonDidPressed(equal: UIButton)
    
}

class OperatorView: UIView {

    weak var delegate: OperatorViewDelegate?
    
     // MARK: - IBAction
    /// IBAction tappedAdditionButton allows the addition of the operator +
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        delegate?.additionButtonDidPressed(addition: sender)
    }
    
    /// IBAction tappedSubstractionButton allows the addition of the operator -
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        delegate?.substractionButtonDidPressed(substraction: sender)
    }
    
    /// IBAction tappedMultiplicationButton allows the addition of the operator X
    @IBAction func tappedMultiplicationButton(_ sender: UIButton) {
        delegate?.multiplicationButtonDidPressed(multiplication: sender)
    }
    
    /// IBAction tappedDivisionButton allows the addition of the operator /
    @IBAction func tappedDivisionButton(_ sender: UIButton) {
        delegate?.divisionButtonDidPressed(division: sender)
    }
    
    /// IBAction tappedEqualButton allows the addition of the operator = and triggers the calculation
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        delegate?.equalButtonDidPressed(equal: sender)
    }
}
