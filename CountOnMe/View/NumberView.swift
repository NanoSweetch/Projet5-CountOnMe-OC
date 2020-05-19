//
//  NumberView.swift
//  CountOnMe
//
//  Created by Maxime DUTOUR on 26/04/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import UIKit

// MARK: - Protocol Delegate
protocol NumberViewDelegate: class {
    func numberButtonDidPressed(number: UIButton)
    
    func resetButtonDidPressed(reset: UIButton)
}

class NumberView: UIView {
    
    weak var delegate: NumberViewDelegate?
    
     // MARK: - IBAction
    /// IBAction tappedNumberButton sends the information when it is pressed
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        delegate?.numberButtonDidPressed(number: sender)
       }
    
    /// IBAction tappedResetButton resets the display to zero
    @IBAction func tappedResetButton(_ sender: UIButton) {
        delegate?.resetButtonDidPressed(reset: sender)
       }
}
