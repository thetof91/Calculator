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
        print("Trykkede på 0")
            break
        case 1: inputLabelValue += "1"
        print("Trykkede på 1")
            break
        case 2: inputLabelValue += "2"
        print("Trykkede på 2")
            break
        case 3: inputLabelValue += "3"
        print("Trykkede på 3")
            break
        case 4: inputLabelValue += "4"
        print("Trykkede på 4")
            break
        case 5: inputLabelValue += "5"
        print("Trykkede på 5")
            break
        case 6: inputLabelValue += "6"
        print("Trykkede på 6")
            break
        case 7: inputLabelValue += "7"
        print("Trykkede på 7")
            break
        case 8: inputLabelValue += "8"
        print("Trykkede på 8")
            break
        case 9: inputLabelValue += "9"
        print("Trykkede på 9")
            break
        case 10:
            if inputLabelValue.rangeOfString(".") == nil {
                inputLabelValue += "."
                print("Trykkede på ,")
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
                print("Trykkede på +")
                inputLabelValue = ""
                inputLabel.text = inputLabelValue
            }
            break
        case 12:
            if(inputOpreation == ""){
                input1 = (inputLabelValue as NSString).doubleValue
                inputOpreation = "-"
                print("Trykkede på -")
                inputLabelValue = ""
                inputLabel.text = inputLabelValue
            }
            break
        case 13:
            if(inputOpreation == ""){
                input1 = (inputLabelValue as NSString).doubleValue
                inputOpreation = "*"
                print("Trykkede på *")
                inputLabelValue = ""
                inputLabel.text = inputLabelValue
            }
            break
        case 14:
            if(inputOpreation == ""){
                input1 = (inputLabelValue as NSString).doubleValue
                inputOpreation = "/"
                print("Trykkede på /")
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
        print("Trykkede på =")
        input2 = (inputLabelValue as NSString).doubleValue
        if(inputOpreation == "+"){
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
        if inputLabelValue.hasSuffix(".0"){
            inputLabelValue = String(inputLabelValue.characters.dropLast(2))
            inputLabel.text = inputLabelValue
        }
    }
}