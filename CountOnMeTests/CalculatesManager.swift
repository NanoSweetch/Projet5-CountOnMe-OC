//
//  CalculatesManagerTests.swift
//  CalculatesManagerTests
//
//  Created by Maxime DUTOUR on 12/05/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CalculatesManagerTests: XCTestCase {

 
    
//    func testGivenArray1Element_WhenAddingAnOperator_ThenExpressionShouldBeIncorrect() {
//        calculation.opertorToReduce(elements: ["3", "+", "4"])
//        calculation.canAddOperator(elements: ["+"])
//        calculation.opertorToReduce(elements: ["4"])
//
//        XCTAssertFalse(calculation.expressionHaveResult())
//    }

    //Renommer la méthode
    // Décliné le code pour toutes les méthode et faire des test avec false
    // commenter les tests
    
    func testexpressioniscorrect() {
        // Given
        let calculation = CalculatesManager()
        let elements = ["4"]
        
        // When
        let isCorrect = calculation.expressionIsCorrect(elements: elements)
        
        // Then
        XCTAssertTrue(isCorrect)
    }
}
