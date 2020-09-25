//
//  ViewController.swift
//  Calculator
//
//  Created by admin on 22/09/20.
//  Copyright © 2020 Sample. All rights reserved.
//

import UIKit

class CalcViewController: UIViewController {
    
    var currentNumber: Double = 0;
    var previousNumber: Double = 0;
    var operating = false;
    var operation = "";
    var calcOperations = CalcOperations();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent;
    }
    
    
    @IBAction func numbers(_ sender: UIButton) {
        guard let btnLabel = sender.titleLabel else {
            return
        }
        if operating == true {
            if btnLabel.text! == "." {
                display.text = "0" + btnLabel.text!
            } else {
                display.text = btnLabel.text!
            }
            operating = false;
        } else {
            if display.text == "0" && btnLabel.text! != "." {
                display.text = btnLabel.text!
            }
            else {
                display.text! += btnLabel.text!
            }
        }
        currentNumber = Double(display.text!)!
    }
    
    
    @IBOutlet weak var display: UILabel!
    
    
    @IBAction func operations(_ sender: UIButton) {
        guard let operatorLabel = sender.titleLabel else {
            return
        }
        
        if operatorLabel.text! == "AC" {
            display.text = "0"
            previousNumber = 0
            currentNumber = 0
            operation = ""
            return
        }
        
        if operatorLabel.text! == "C" {
            display.text = "0"
            currentNumber = 0
            return
        }
        
        if operatorLabel.text! != "=" {
            operation = operatorLabel.text!
            operating = true
            previousNumber = Double(display.text!)!
            display.text = operatorLabel.text!
        } else if operatorLabel.text! == "=" {
            calcOperations.doOperation(operation: operation, firstOperand: previousNumber, secondOperand: currentNumber)
            display.text = calcOperations.resultString
        }
        
    }
}

