//
//  Calculations.swift
//  Calculator
//
//  Created by Søren Vestergaard on 22/06/2016.
//  Copyright © 2016 Søren Vestergaard. All rights reserved.
//

import Foundation

class Calculations {
    
    var result = 0.0
    
    func doPlus(number1: Double, number2: Double) -> Double {
        result = number1 + number2
        return result
    }
    
    func doMinus(number1: Double, number2: Double) -> Double {
        result = number1 - number2
        return result
    }
    
    func doDivide(number1: Double, number2: Double) -> Double {
        result = number1 / number2
        return result
    }
    
    func doMultiply(number1: Double, number2: Double) -> Double {
        result = number1 * number2
        return result
    }
}