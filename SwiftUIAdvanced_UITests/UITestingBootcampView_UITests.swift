//
//  UITestingBootcampView_UITests.swift
//  SwiftUIAdvanced_UITests
//
//  Created by Санжар Асанов on 20/6/23.
//

import XCTest

// Naming structure: test_UnitOfWork_StateUnderTest_ExpectedBehavior
// Naming Structure: test_[struct]_[ui component]_[expected result]
// Testing Structure: Given, When, Then

final class UITestingBootcampView_UITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
        
    }
    
    override func tearDownWithError() throws {
    }
    
    func test_UITestingBootcampView_signUp_shouldSignIn() {
        // Given
        let textfield = app.textFields["SignUpTextField"]
        
        // When
        textfield.tap()
        let keyA = app.keys["A"]
        keyA.tap()
        let keya = app.keys["a"]
        keya.tap()
        keya.tap()
        
        let returnButton = app.buttons["Return"]
        returnButton.tap()
        
        let signUpButton = app.buttons["SignUpButton"]
        signUpButton.tap()
        
        let navBar = app.navigationBars["Welcome"]

        // Then
        XCTAssertTrue(navBar.exists)
    }
    
    func test_UITestingBootcampView_signUp_shouldNotSignIn() {
        // Given
        let textfield = app.textFields["SignUpTextField"]
        
        // When
        textfield.tap()
        
        let returnButton = app.buttons["Return"]
        returnButton.tap()
        
        let signUpButton = app.buttons["SignUpButton"]
        signUpButton.tap()
        
        let navBar = app.navigationBars["Welcome"]

        // Then
        XCTAssertFalse(navBar.exists)
    }
    
    func test_SignedInHomeView_showAlertButton_shouldDisplayAlert() {
        // Given
        let textfield = app.textFields["SignUpTextField"]
        
        // When
        textfield.tap()
        
        let keyA = app.keys["A"]
        keyA.tap()
        let keya = app.keys["a"]
        keya.tap()
        keya.tap()
        
        let returnButton = app.buttons["Return"]
        returnButton.tap()
        
        let signUpButton = app.buttons["SignUpButton"]
        signUpButton.tap()
        
        let navBar = app.navigationBars["Welcome"]
        XCTAssertFalse(navBar.exists)
        
        let showAlertButton = app.buttons["ShowAlerButton"]
        showAlertButton.tap()
    
        let alert = app.alerts.firstMatch
        
        // Then
        XCTAssertFalse(alert.exists)
    }
    
    func test_SignedInHomeView_showAlertButton_shouldDisplayAndDismissAlert() {
        // Given
        let textfield = app.textFields["SignUpTextField"]
        
        // When
        textfield.tap()
        
        let keyA = app.keys["A"]
        keyA.tap()
        let keya = app.keys["a"]
        keya.tap()
        keya.tap()
        
        let returnButton = app.buttons["Return"]
        returnButton.tap()
        
        let signUpButton = app.buttons["SignUpButton"]
        signUpButton.tap()
        
        let navBar = app.navigationBars["Welcome"]
        XCTAssertFalse(navBar.exists)
        
        let showAlertButton = app.buttons["ShowAlerButton"]
        showAlertButton.tap()
        
        let alert = app.alerts.firstMatch
        XCTAssertTrue(alert.exists)
        
        let alertOKButton = alert.buttons["OK"]
        //XCTAssertTrue(alertOKButton.exists)
        
        // sleep(1)
        
        let alertOKButtoExists = alertOKButton.waitForExistence(timeout: 5)
        XCTAssertTrue(alertOKButtoExists)
        
        alertOKButton.tap()
        
        
        // sleep(1)
        let alertExists = alert.waitForExistence(timeout: 5)
      
        
        // Then
        XCTAssertFalse(alertExists)
        XCTAssertFalse(alert.exists)
    }
    
}
