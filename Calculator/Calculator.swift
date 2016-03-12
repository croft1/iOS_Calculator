//
//  Calculator.swift
//  Calculator
//
//  Created by Alex Bornos on 12/03/2016!.
//  Copyright © 2016 mecar6. All rights reserved.
//

import UIKit




class Calculator: NSObject {
    
    var firstNum: Double?
    var secondNum: Double?
    
    init(firstNum: Double, secondNum: Double){
        self.firstNum = firstNum
        self.secondNum = secondNum
        
    }
    
    
    func performOperation(operation: String) -> Double{
        var result: Double
        switch(operation){
        case "+":
            result = add();
            break;
        case "-":
            result = sub();
            break;
        case "/":
            result = div();
            break;
        case "*":
            result = mul();
            break;
        default:
            result = 9999;
        }
        
        return rounding(result);
    }
    
    
    func add() -> Double{
        return firstNum! + secondNum!;
    }
    
    func sub() -> Double{
        return firstNum! - secondNum!;
    }
    
    func mul() -> Double{
        return firstNum! * secondNum!;
    }
    
    func div() -> Double{
        return firstNum! / secondNum!;
    }
    
    func rounding(n: Double) -> Double{
        return round(n * 100) / 100
        
    }
    
    
}

