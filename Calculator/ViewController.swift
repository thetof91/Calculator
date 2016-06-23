//
//  ViewController.swift
//  Calculator
//
//  Created by Søren Vestergaard on 22/06/2016.
//  Copyright © 2016 Søren Vestergaard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonZero: UIButton!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var buttonFive: UIButton!
    @IBOutlet weak var buttonSix: UIButton!
    @IBOutlet weak var buttonSeven: UIButton!
    @IBOutlet weak var buttonEight: UIButton!
    @IBOutlet weak var buttonNine: UIButton!
    @IBOutlet weak var buttonComma: UIButton!
    @IBOutlet weak var inputLabel: UILabel!
    @IBOutlet weak var operationDivide: UIButton!
    @IBOutlet weak var operationMultiply: UIButton!
    @IBOutlet weak var operationMinus: UIButton!
    @IBOutlet weak var operationPlus: UIButton!
    @IBOutlet weak var operationEqual: UIButton!
    
    var input1 = 0.0
    var input2 = 0.0
    var inputOpreation = ""
    var inputLabelValue = ""
    let calculator = Calculations()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Tags til buttons for at håndtere switch.
        buttonZero.tag = 0
        buttonOne.tag = 1
        buttonTwo.tag = 2
        buttonThree.tag = 3
        buttonFour.tag = 4
        buttonFive.tag = 5
        buttonSix.tag = 6
        buttonSeven.tag = 7
        buttonEight.tag = 8
        buttonNine.tag = 9
        buttonComma.tag = 10
        operationPlus.tag = 11
        operationMinus.tag = 12
        operationMultiply.tag = 13
        operationDivide.tag = 14
    }
    
    //Håndtere tal bliver trykket og opdatere label.
    @IBAction func numberPressed(sender: AnyObject) {
        switch sender.tag {
        case 0: inputLabelValue += "0"
        print("nul blev trykket")
            break
        case 1: inputLabelValue += "1"
        print("1 blev trykket")
            break
        case 2: inputLabelValue += "2"
        print("2 blev trykekt")
            break
        case 3: inputLabelValue += "3"
        print("3 blev trykket")
            break
        case 4: inputLabelValue += "4"
        print("4 blev trykket")
            break
        case 5: inputLabelValue += "5"
        print("5 blev trykket")
            break
        case 6: inputLabelValue += "6"
        print("6 blev trykket")
            break
        case 7: inputLabelValue += "7"
        print("7 blev trykket")
            break
        case 8: inputLabelValue += "8"
        print("8 blev trykket")
            break
        case 9: inputLabelValue += "9"
        print("9 blev trykket")
            break
        case 10:
            if inputLabelValue.rangeOfString(".") == nil {
                inputLabelValue += "."
                print(". blev trykket")
            }
            break
        default: ()
            break
        }
        inputLabel.text = inputLabelValue
    }
    
    //Clear label, input og operation.
    @IBAction func clearPressed(sender: AnyObject) {
        inputLabelValue = ""
        inputLabel.text = inputLabelValue
        input1 = 0.0
        input2 = 0.0
        inputOpreation = ""
    }
    
    //Gemmer input1 og operation.
    @IBAction func operationPressed(sender: AnyObject) {
        switch sender.tag {
        case 11:
            if(inputOpreation == ""){
                input1 = (inputLabelValue as NSString).doubleValue
                inputOpreation = "+"
                print("trykkede på +")
                inputLabelValue = ""
                inputLabel.text = inputLabelValue
            }
            break
        case 12:
            if(inputOpreation == ""){
                input1 = (inputLabelValue as NSString).doubleValue
                inputOpreation = "-"
                print("trykkede på -")
                inputLabelValue = ""
                inputLabel.text = inputLabelValue
            }
            break
        case 13:
            if(inputOpreation == ""){
                input1 = (inputLabelValue as NSString).doubleValue
                inputOpreation = "*"
                print("trykkede på *")
                inputLabelValue = ""
                inputLabel.text = inputLabelValue
            }
            break
        case 14:
            if(inputOpreation == ""){
                input1 = (inputLabelValue as NSString).doubleValue
                inputOpreation = "/"
                print("trykkede på /")
                inputLabelValue = ""
                inputLabel.text = inputLabelValue
            }
            break
        default: ()
            break
        }
    }
    
    //Tager input1, input2 og operation og finder resultat og opdatere label med det.
    @IBAction func equalPressed(sender: AnyObject) {
        print("= blev trykket")
        print(inputOpreation)
        input2 = (inputLabelValue as NSString).doubleValue
        if(inputOpreation == "+"){
            print("test")
            let result = calculator.doPlus(input1, number2: input2)
            print(result)
            inputLabelValue = String(result)
            inputLabel.text = inputLabelValue
        }
        else if(inputOpreation == "-"){
            let result = calculator.doMinus(input1, number2: input2)
            inputLabelValue = String(result)
            inputLabel.text = inputLabelValue
        }
        else if(inputOpreation == "*"){
            let result = calculator.doMultiply(input1, number2: input2)
            inputLabelValue = String(result)
            inputLabel.text = inputLabelValue
        }
        else if(inputOpreation == "/"){
            let result = calculator.doDivide(input1, number2: input2)
            inputLabelValue = String(result)
            inputLabel.text = inputLabelValue
        }
        input1 = 0.0
        input2 = 0.0
        inputOpreation = ""
    }
}