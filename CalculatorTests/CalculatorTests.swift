//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by admin on 22/09/20.
//  Copyright © 2020 Sample. All rights reserved.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    
    private var calcOperations: CalcOperations!
    
    var viewController: CalcViewController!
    let button: UIButton = UIButton()
    
    private func setUpVC() {
        let bundle = Bundle(for: CalcViewController.self)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as? CalcViewController
        viewController.loadView()
        viewController.viewDidLoad()
    }
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        calcOperations = CalcOperations()
        setUpVC()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAdd() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        calcOperations.doOperation(operation: "+", firstOperand: 25.0, secondOperand: 5.0)
        XCTAssert(calcOperations.resultString == "30")
        
        calcOperations.doOperation(operation: "+", firstOperand: 123456789987654321.0, secondOperand: 987654321.0)
        XCTAssert(calcOperations.resultString == "1.2345679097530864e+17")
    }
    
    func testSubtract() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        calcOperations.doOperation(operation: "-", firstOperand: 25.0, secondOperand: 5.0)
        XCTAssert(calcOperations.resultString == "20")
    }
    
    func testMultiply() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        calcOperations.doOperation(operation: "x", firstOperand: 25.0, secondOperand: 5.0)
        XCTAssert(calcOperations.resultString == "125")
    }
    
    func testDivide() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        calcOperations.doOperation(operation: "÷", firstOperand: 0, secondOperand: 0)
        XCTAssert(calcOperations.resultString == "nan")
    }
    
    func testPercentage() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        calcOperations.doOperation(operation: "%", firstOperand: 25.0, secondOperand: 5.0)
        XCTAssert(calcOperations.resultString == "1.25")
    }
    
    func testViewController() {
        XCTAssertNotNil(viewController, "viewcontroller not shown")
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
