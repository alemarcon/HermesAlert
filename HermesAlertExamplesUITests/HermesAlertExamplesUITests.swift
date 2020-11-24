//
//  HermesAlertExamplesUITests.swift
//  HermesAlertExamplesUITests
//
//  Created by Alessandro Marcon on 24/11/2020.
//

import XCTest

class HermesAlertExamplesUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        // Since UI tests are more expensive to run, it's usually a good idea
        // to exit if a failure was encountered
        continueAfterFailure = false
        
        app = XCUIApplication()
        
        // We send a command line argument to our app,
        // to enable it to reset its state
        app.launchArguments.append("--uitesting")
    }
    
    //MARK: - Tests
    
    func testSimpleAlert() throws {
        app.launch()
        
        // Make sure we're displaying main view controller
        XCTAssertTrue(app.isDisplayingMainViewController)
        
        // Tap the "Simple Alert" button
        app.buttons["Simple Alert"].tap()
        
        // Make sure we're displaying Simple Alert View
        XCTAssertTrue(app.isDisplayingSimpleAlertView)
        
        // Close the alert
        app.buttons["OK"].tap()
        
        XCTAssertTrue(app.isDisplayingMainViewController)
    }
    
    func testTwoButtonsAlert() throws {
        app.launch()
        
        // Make sure we're displaying main view controller
        XCTAssertTrue(app.isDisplayingMainViewController)
        
        // Tap the "Simple Alert" button
        app.buttons["2 Buttons Alert"].tap()
        
        // Make sure we're displaying Simple Alert View
        XCTAssertTrue(app.isDisplayingTwoButtonsAlertView)
        
        // Close the alert
        app.buttons["OK"].tap()
        
        XCTAssertTrue(app.isDisplayingMainViewController)
        
        app.buttons["2 Buttons Alert"].tap()
        
        XCTAssertTrue(app.isDisplayingTwoButtonsAlertView)
        
        // Close the alert
        app.buttons["CANCEL"].tap()
        
        XCTAssertTrue(app.isDisplayingMainViewController)
    }
    
    func testInstagramAlert() throws {
        app.launch()
        
        // Make sure we're displaying main view controller
        XCTAssertTrue(app.isDisplayingMainViewController)
        
        // Tap the "Simple Alert" button
        app.buttons["Instagram Style Alert"].tap()
        
        // Make sure we're displaying Simple Alert View
        XCTAssertTrue(app.isDisplayingInstagramAlertView)
        
        // Close the alert
        app.buttons["Ok"].tap()
        
        XCTAssertTrue(app.isDisplayingMainViewController)
        
        app.buttons["Instagram Style Alert"].tap()
        
        // Make sure we're displaying Simple Alert View
        XCTAssertTrue(app.isDisplayingInstagramAlertView)
        
        // Close the alert
        app.buttons["Cancel"].tap()
        
        XCTAssertTrue(app.isDisplayingMainViewController)
        
    }
    
    func testTextfieldAlert() throws {
        app.launch()
        
        // Make sure we're displaying main view controller
        XCTAssertTrue(app.isDisplayingMainViewController)
        
        // Tap the "Simple Alert" button
        app.buttons["Textfield Alert"].tap()
        
        // Make sure we're displaying Simple Alert View
        XCTAssertTrue(app.isDisplayingTextfieldAlertView)
        
        // Close the alert
        app.buttons["SEND"].tap()
        
        XCTAssertTrue(app.isDisplayingMainViewController)
        
        // Tap the "Simple Alert" button
        app.buttons["Textfield Alert"].tap()
        
        // Make sure we're displaying Simple Alert View
        XCTAssertTrue(app.isDisplayingTextfieldAlertView)
        
        // Close the alert
        app.buttons["textfield_close_button"].tap()
        
        XCTAssertTrue(app.isDisplayingMainViewController)
    }
    
    func testCheckboxAlert() throws {
        app.launch()
        
        // Make sure we're displaying main view controller
        XCTAssertTrue(app.isDisplayingMainViewController)
        
        // Tap the "Simple Alert" button
        app.buttons["Checkbox Alert"].tap()
        
        // Make sure we're displaying Simple Alert View
        XCTAssertTrue(app.isDisplayingCheckboxAlertView)
        
        app.buttons["checkbox_button"].tap()
        
        XCTAssertTrue(app.buttons["checkbox_button"].isSelected)
        
        // Close the alert
        app.buttons["OK"].tap()
        
        XCTAssertTrue(app.isDisplayingMainViewController)
    }
}

extension XCUIApplication {
    
    var isDisplayingMainViewController: Bool {
        return otherElements["mainViewController"].exists
    }
    
    var isDisplayingSimpleAlertView: Bool {
        return otherElements["simpleAlertView"].exists
    }
    
    var isDisplayingTwoButtonsAlertView: Bool {
        return otherElements["twoButtonsAlertView"].exists
    }
    
    var isDisplayingInstagramAlertView: Bool {
        return otherElements["instagramAlertView"].exists
    }
    
    var isDisplayingTextfieldAlertView: Bool {
        return otherElements["textfieldAlertView"].exists
    }
    
    var isDisplayingCheckboxAlertView: Bool {
        return otherElements["checkboxAlertView"].exists
    }
}
