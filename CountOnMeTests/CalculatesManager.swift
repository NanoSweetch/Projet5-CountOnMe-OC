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
    
    // MARK: - Test func expressionIsCorrect
    // We verify that the last element is not an operator
    func testGivenArrayNumber_WhenCheckExpressionIsCorrect_ThenExpressionIsCorrect() {
        // Given
        let calculation = CalculatesManager()
        let elements = ["4"]
        
        // When
        let isCorrect = calculation.expressionIsCorrect(elements: elements)
        
        // Then
        XCTAssertTrue(isCorrect)
    }
    
    func testGivenArrayAddition_WhenCheckExpressionIsCorrect_ThenExpressionIsWrong() {
        // Given
        let calculation = CalculatesManager()
        let elements = ["+"]
        
        // When
        let isCorrect = calculation.expressionIsCorrect(elements: elements)
        
        // Then
        XCTAssertFalse(isCorrect)
    }
    
    func testGivenArraySubstraction_WhenCheckExpressionIsCorrect_ThenExpressionIsWrong() {
        // Given
        let calculation = CalculatesManager()
        let elements = ["-"]
        
        // When
        let isCorrect = calculation.expressionIsCorrect(elements: elements)
        
        // Then
        XCTAssertFalse(isCorrect)
    }
    
    func testGivenArrayMultiplication_WhenCheckExpressionIsCorrect_ThenExpressionIsWrong() {
        // Given
        let calculation = CalculatesManager()
        let elements = ["×"]
        
        // When
        let isCorrect = calculation.expressionIsCorrect(elements: elements)
        
        // Then
        XCTAssertFalse(isCorrect)
    }
    
    func testGivenArrayDivision_WhenCheckExpressionIsCorrect_ThenExpressionIsWrong() {
        // Given
        let calculation = CalculatesManager()
        let elements = ["÷"]
        
        // When
        let isCorrect = calculation.expressionIsCorrect(elements: elements)
        
        // Then
        XCTAssertFalse(isCorrect)
    }
    
    // MARK: - Test func expressionHaveEnoughElement
    // Verifies array has at least three elements
    func testGivenArrayOneElement_WhenCheckExpressionHaveEnoughElement_ThenExpressionIsWrong() {
        // Given
        let calculation = CalculatesManager()
        let elements = ["1"]
        
        // When
        let isCorrect = calculation.expressionHaveEnoughElement(elements: elements)
        
        // Then
        XCTAssertFalse(isCorrect)
    }
    
    func testGivenArrayTwoElement_WhenCheckExpressionHaveEnoughElement_ThenExpressionIsWrong() {
        // Given
        let calculation = CalculatesManager()
        let elements = ["1", "+"]
        
        // When
        let isCorrect = calculation.expressionHaveEnoughElement(elements: elements)
        
        // Then
        XCTAssertFalse(isCorrect)
    }
    
    func testGivenArrayThreeElement_WhenCheckExpressionHaveEnoughElement_ThenExpressionIsCorrect() {
        // Given
        let calculation = CalculatesManager()
        let elements = ["1", "+", "6"]
        
        // When
        let isCorrect = calculation.expressionHaveEnoughElement(elements: elements)
        
        // Then
        XCTAssertTrue(isCorrect)
    }
    
    // MARK: - Test func canAddOperator
    // Verifies that the last element is not a number
    func testGivenArrayLastElementNumber_WhenCheckcanAddOperator_ThenExpressionIsCorrect() {
        // Given
        let calculation = CalculatesManager()
        let elements = ["1"]
        
        // When
        let isCorrect = calculation.canAddOperator(elements: elements)
        
        // Then
        XCTAssertTrue(isCorrect)
    }
    func testGivenArrayLastElementTwoNumberAndOperator_WhenCheckcanAddOperator_ThenExpressionIsCorrect() {
        // Given
        let calculation = CalculatesManager()
        let elements = ["1", "+", "5"]
        
        // When
        let isCorrect = calculation.canAddOperator(elements: elements)
        
        // Then
        XCTAssertTrue(isCorrect)
    }
    
    func testGivenArrayLastElementAdditionOperator_WhenCheckcanAddOperator_ThenExpressionIsWrong() {
        // Given
        let calculation = CalculatesManager()
        let elements = ["+"]
        
        // When
        let isCorrect = calculation.canAddOperator(elements: elements)
        
        // Then
        XCTAssertFalse(isCorrect)
    }
    
    func testGivenArrayLastElementSubstractionOperator_WhenCheckcanAddOperator_ThenExpressionIsWrong() {
        // Given
        let calculation = CalculatesManager()
        let elements = ["-"]
        
        // When
        let isCorrect = calculation.canAddOperator(elements: elements)
        
        // Then
        XCTAssertFalse(isCorrect)
    }
    
    func testGivenArrayLastElementMultiplicationOperator_WhenCheckcanAddOperator_ThenExpressionIsWrong() {
        // Given
        let calculation = CalculatesManager()
        let elements = ["×"]
        
        // When
        let isCorrect = calculation.canAddOperator(elements: elements)
        
        // Then
        XCTAssertFalse(isCorrect)
    }
    
    func testGivenArrayLastElementDivisionOperator_WhenCheckcanAddOperator_ThenExpressionIsWrong() {
        // Given
        let calculation = CalculatesManager()
        let elements = ["÷"]
        
        // When
        let isCorrect = calculation.canAddOperator(elements: elements)
        
        // Then
        XCTAssertFalse(isCorrect)
    }
    
    // MARK: - Test func opertorToReduce
    // Verifies calculations and expected results
    func testGivenCalculAddition_WhenCheckCalculWork_ThenExpressionIsCorrect() {
        // Given
        let calculation = CalculatesManager()
        let elements = ["4", "+", "6"]
        
        // When
        let isCorrect = calculation.opertorToReduce(elements: elements)
        // Then
        XCTAssertTrue(isCorrect == ["10.0"])
    }
    
    func testGivenCalculAddition_WhenCheckCalculWork_ThenExpressionIsWrong() {
        // Given
        let calculation = CalculatesManager()
        let elements = ["4", "+", "6"]
        
        // When
        let isCorrect = calculation.opertorToReduce(elements: elements)
        // Then
        XCTAssertFalse(isCorrect == ["12.0"])
    }
    
    func testGivenCalculSubstraction_WhenCheckCalculWork_ThenExpressionIsCorrect() {
        // Given
        let calculation = CalculatesManager()
        let elements = ["12", "-", "6"]
        
        // When
        let isCorrect = calculation.opertorToReduce(elements: elements)
        // Then
        XCTAssertTrue(isCorrect == ["6.0"])
    }
    
    func testGivenCalculSubstraction_WhenCheckCalculWork_ThenExpressionIsWrong() {
        // Given
        let calculation = CalculatesManager()
        let elements = ["12", "-", "6"]
        
        // When
        let isCorrect = calculation.opertorToReduce(elements: elements)
        // Then
        XCTAssertFalse(isCorrect == ["20.0"])
    }
    
    func testGivenCalculMultiplication_WhenCheckCalculWork_ThenExpressionIsCorrect() {
        // Given
        let calculation = CalculatesManager()
        let elements = ["12", "×", "6"]
        
        // When
        let isCorrect = calculation.opertorToReduce(elements: elements)
        // Then
        XCTAssertTrue(isCorrect == ["72.0"])
    }
    
    func testGivenCalculMultiplication_WhenCheckCalculWork_ThenExpressionIsWrong() {
        // Given
        let calculation = CalculatesManager()
        let elements = ["12", "×", "6"]
        
        // When
        let isCorrect = calculation.opertorToReduce(elements: elements)
        // Then
        XCTAssertFalse(isCorrect == ["7.0"])
    }
    
    func testGivenCalculDivision_WhenCheckCalculWork_ThenExpressionIsCorrect() {
        // Given
        let calculation = CalculatesManager()
        let elements = ["12", "÷", "3"]
        
        // When
        let isCorrect = calculation.opertorToReduce(elements: elements)
        // Then
        XCTAssertTrue(isCorrect == ["4.0"])
    }
    
    func testGivenCalculDivision_WhenCheckCalculWork_ThenExpressionIsWrong() {
        // Given
        let calculation = CalculatesManager()
        let elements = ["12", "÷", "3"]
        
        // When
        let isCorrect = calculation.opertorToReduce(elements: elements)
        // Then
        XCTAssertFalse(isCorrect == ["13.0"])
    }
    
    func testGivenCalculAdditionAndMultiplication_WhenCheckCalculWork_ThenExpressionIsCorrect() {
        // Given
        let calculation = CalculatesManager()
        let elements = ["12", "+", "3", "×", "7"]
        
        // When
        let isCorrect = calculation.opertorToReduce(elements: elements)
        // Then
        XCTAssertTrue(isCorrect == ["33.0"])
    }
    
    func testGivenCalculAdditionAndMultiplication_WhenCheckCalculWork_ThenExpressionIsWrong() {
        // Given
        let calculation = CalculatesManager()
        let elements = ["12", "+", "3", "×", "7"]
        
        // When
        let isCorrect = calculation.opertorToReduce(elements: elements)
        // Then
        XCTAssertFalse(isCorrect == ["12.0"])
    }
    
    func testGivenCalculAdditionAndDivision_WhenCheckCalculWork_ThenExpressionIsCorrect() {
        // Given
        let calculation = CalculatesManager()
        let elements = ["12", "+", "3", "÷", "3"]
        
        // When
        let isCorrect = calculation.opertorToReduce(elements: elements)
        // Then
        XCTAssertTrue(isCorrect == ["13.0"])
    }
    
    func testGivenCalculAdditionAndDivision_WhenCheckCalculWork_ThenExpressionIsWrong() {
        // Given
        let calculation = CalculatesManager()
        let elements = ["12", "+", "3", "÷", "3"]
        
        // When
        let isCorrect = calculation.opertorToReduce(elements: elements)
        // Then
        XCTAssertFalse(isCorrect == ["3.0"])
    }
    
    func testGivenCalculDivisionZero_WhenCheckCalculWork_ThenExpressionIsWrong() {
        // Given
        let calculation = CalculatesManager()
        let elements = ["0", "÷", "3"]
        
        // When
        let isCorrect = calculation.opertorToReduce(elements: elements)
        // Then
        XCTAssertFalse(isCorrect == ["3.0"])
    }
    
    func testGivenCalculDivisionZero_WhenCheckCalculWork_ThenExpressionIsCorrect() {
        // Given
        let calculation = CalculatesManager()
        let elements = ["0", "÷", "7"]
        
        // When
        let isCorrect = calculation.opertorToReduce(elements: elements)
        // Then
        XCTAssertTrue(isCorrect == ["0.0"])
    }
}


