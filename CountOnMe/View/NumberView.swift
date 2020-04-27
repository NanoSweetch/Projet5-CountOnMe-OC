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
    
    let display = DisplayView()
    
     // MARK: - IBOutlets numberButtons
    /// IBOutlet numberButtons make a button collection. Used to perform calculations
    @IBOutlet var numberButtons: [UIButton]!

     // MARK: - IBAction tappedNumberButton
    /// IBAction tappedNumberButton sends the information when it is pressed
    @IBAction func tappedNumberButton(_ sender: UIButton) {
           guard let numberText = sender.title(for: .normal) else {
               return
           }
           // Vérifier si ca ajoute pas simplement un espace entre les élements du calcul
           if calculateManager.expressionHaveResult() {
            display.textView.text = ""
           }
           
        display.textView.text.append(numberText)
       }
}

extension DisplayView {
    
     // MARK: - IBAction tappedResetButton
    /// IBAction tappedResetButton resets the display to zero
    @IBAction func tappedResetButton(_ sender: UIButton) {
           textView.text = nil
       }
}
