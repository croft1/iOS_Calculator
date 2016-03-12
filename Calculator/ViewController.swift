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
    var operandError: String = "Must select the type of operation"

    @IBOutlet weak var inputNumTop: UITextField!
    @IBOutlet weak var inputNumBottom: UITextField!
    @IBOutlet var operationSelector: UISegmentedControl!
    
    
    @IBAction func buttCalculate() {
        
        if( inputNumTop.text != "" || inputNumBottom.text != "" || operationSelector.selected){
            
        }
        else{
        let firstnum = Double(inputNumTop.text!)
        }
        
        
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

