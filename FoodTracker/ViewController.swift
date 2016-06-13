//
//  ViewController.swift
//  FoodTracker
//
//  Created by Jacques Fourie on 2016/06/02.
//  Copyright © 2016 Jacques Fourie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTypingANumber = false
    var operatorStack = Array<Double>()
    
    var displayValue:Double{
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false;
        }
    }
    
   
    @IBAction func Operator(sender: UIButton) {
        let operation = sender.currentTitle!
        if(userIsInTheMiddleOfTypingANumber){
            enter();
        }
        switch operation {
        case "×": performOperation(<#T##operation: (Double, Double)##(Double, Double)#>)
            
//        case "÷":
//        
//        case "−":
//        
//        case "+":
//            
        default:
            break;
        }
        
    }
    
    func performOperation(operation:(Double,Double) -> Double){
        if(operatorStack.count>2){
            displayValue = operation(operatorStack.removeLast(),operatorStack.removeLast())
        }
        
        
    }
    
    func multiply(opt1:Double,opt2:Double)-> Double{
        return opt1 * opt2
    }
    
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        print("digit = \(digit)")
        
        if(userIsInTheMiddleOfTypingANumber){
                display.text = display.text! + digit
        }else{
            display.text =  digit
            userIsInTheMiddleOfTypingANumber = true;
        }
        
    }
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        operatorStack.append(displayValue)
        print("Operand stack  \(operatorStack) " )
    }
}

