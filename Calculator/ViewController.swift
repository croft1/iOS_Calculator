//
//  ViewController.swift
//  Calculator
//
//  Created by Alex Bornos on 12/03/2016.
//  Copyright © 2016 mecar6. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var inputNumTop: UITextField!
    @IBOutlet weak var inputNumBottom: UITextField!
    @IBOutlet var operationSelector: UISegmentedControl!
    @IBOutlet var resultLabel: UILabel!
    
    @IBAction func operationSelectorAction(sender: AnyObject, forEvent event: UIEvent) {
        updateResultLabel()
    }
    @IBAction func inputNumTopAction() {
        updateResultLabel()
    }
    
    @IBAction func inputNumBottomAction(sender: AnyObject) {
        updateResultLabel()
    }
    
    @IBAction func butCalculate() {
        
        let divZeroError: String = "Can't divide by zero, try again"
        let inputError: String = "Must fill in all fields"
        
        if inputNumTop.text != "" && inputNumBottom.text != ""{
            
            let firstNum = Double(inputNumTop.text!)
            let secondNum = Double(inputNumBottom.text!)
            print("CHECKING THE NUMBERS", firstNum, " and " ,  secondNum, " AND ", selectedOperand(), "AND", !(isDivisible(firstNum!, secondNum: secondNum!)) )
            let calculator = Calculator(firstNum: firstNum!, secondNum: secondNum!)
            
            if ((selectedOperand() == "/" &&  (isDivisible(firstNum!, secondNum: secondNum!)))){
                createAlert("Divide by zero", message: divZeroError)
                
            }else{
                let result = calculator.performOperation(selectedOperand())
                createAlert(resultLabel.text!, message: String(result))
                
            }
        }
        else{
            
            self.createAlert("Invalid Input", message: inputError)
        }
        
            
        
    }
    
    
    func isDivisible( firstNum: Double, secondNum: Double) -> Bool{
        
        return(firstNum == 0.0 || secondNum == 0.0)}
    
    func selectedOperand() -> String{
        return operationSelector.titleForSegmentAtIndex(operationSelector.selectedSegmentIndex)!
    }
    
    func createAlert(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
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
    
    override func viewDidAppear(animated: Bool) {
        
    
    }
    
    
}



