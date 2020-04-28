//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class CountOnMeViewController: UIViewController {

   // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
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
