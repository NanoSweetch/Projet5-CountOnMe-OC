//
//  NumberView.swift
//  CountOnMe
//
//  Created by Maxime DUTOUR on 26/04/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import UIKit

class NumberView: UIView {

    let calculateManager = CalculatesManager()
    
    @IBOutlet var numberButtons: [UIButton]!

    @IBAction func tappedNumberButton(_ sender: UIButton) {
           guard let numberText = sender.title(for: .normal) else {
               return
           }
           
           if calculateManager.expressionHaveResult() {
               textView.text = ""
           }
           
           textView.text.append(numberText)
       }
}

extension DisplayView {
    
    @IBAction func tappedResetButton(_ sender: UIButton) {
           textView.text = nil
       }
}
