//
//  ViewController.swift
//  Calculator
//
//  Created by Alex Bornos on 12/03/2016.
//  Copyright © 2016 mecar6. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var divZeroError: String = "Can't divide by zero, try again"
    var inputError: String = "Must fill in all fields"
    
    @IBOutlet weak var inputNumTop: UITextField!
    @IBOutlet weak var inputNumBottom: UITextField!
    @IBOutlet var operationSelector: UISegmentedControl!
    @IBOutlet var resultLabel: UILabel!
    
    @IBAction func inputNumTopAction() {
        updateResultLabel()
    }
    
    @IBAction func inputNumBottomAction(sender: AnyObject) {
        updateResultLabel()
    }
    
    @IBAction func buttCalculate() {
        
        if inputNumTop.text != "" || inputNumBottom.text != ""{
            
            let firstNum = Double(inputNumTop.text!)
            let secondNum = Double(inputNumBottom.text!)
            print("CHECKING THE NUMBERS", firstNum, " and " ,  secondNum)
            
            if (isDivisible(firstNum!, secondNum: secondNum!)){
                
                let calculator = Calculator(firstNum: firstNum!, secondNum: secondNum!)
                let result = calculator.performOperation(operationSelector.titleForSegmentAtIndex(operationSelector.selectedSegmentIndex)!)
                resultLabel.text = (resultLabel.text)! + String(result)
                createAlert("Calculation:", message: resultLabel.text!)
                
            }else{
                
                createAlert("Divide by zero", message: self.divZeroError)
                
            };else
            
            self.createAlert("Invalid Input", message: self.inputError)
            
            
            
        }
    }
    
    
    func isDivisible( firstNum: Double, secondNum: Double) -> Bool{
        
        return(firstNum == 0 || secondNum == 0)}
    
    func createAlert(title: String, message: String){
        let alertController = UIAlertController(title: "Calculation", message: inputError, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func updateResultLabel(){
        resultLabel.text = (inputNumTop.text)! +
            (operationSelector.titleForSegmentAtIndex(operationSelector.selectedSegmentIndex)!) +
            (inputNumBottom.text)!
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}



