//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Søren Vestergaard on 22/06/2016.
//  Copyright © 2016 Søren Vestergaard. All rights reserved.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    
   let calculator = Calculations()
    
    func testMinus() {
        let number1 = 3.3
        let number2 = 10.3
        let result = calculator.doMinus(number1, number2: number2)
        XCTAssert(result == 7.0)
    }
    
    func testPlus() {
        let number1 = 5.5
        let number2 = 10.3
        let result = calculator.doPlus(number1, number2: number2)
        XCTAssert(result == 15.8)
    }
    
    func testDivide() {
        let number1 = 7.0
        let number2 = 2.5
        let result = calculator.doDivide(number1, number2: number2)
        XCTAssert(result == 2.8)
    }
    
    func testMultiply() {
        let number1 = 3.0
        let number2 = 33.0
        let result = calculator.doMultiply(number1, number2: number2)
        XCTAssert(result == 99.0)
    }
}