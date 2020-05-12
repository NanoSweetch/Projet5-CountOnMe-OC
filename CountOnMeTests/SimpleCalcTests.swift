//
//  SimpleCalcTests.swift
//  SimpleCalcTests
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class SimpleCalcTests: XCTestCase {

    var calculation = CalculatesManager()
 
    
    func testGivenArray1Element_WhenAddingAnOperator_ThenExpressionShouldBeIncorrect() {
        calculation.opertorToReduce(elements: ["3"])
        calculation.canAddOperator(elements: ["+"])
        calculation.opertorToReduce(elements: ["4"])
   
        XCTAssertFalse(calculation.expressionHaveResult())
    }

}
