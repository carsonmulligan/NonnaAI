//
//  NonnaAIUITests.swift
//  NonnaAIUITests
//
//  Created by Carson Mulligan on 12/14/24.
//

import XCTest

final class NonnaAIUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testAppLaunch() throws {
        // Test that the app launches and shows the main title
        XCTAssertTrue(app.staticTexts["Impara l'italiano con la Nonna"].exists)
    }
    
    func testMainNavigation() throws {
        // Test main navigation buttons exist
        XCTAssertTrue(app.buttons["Inizia a imparare"].exists)
        XCTAssertTrue(app.buttons["Ricette di Famiglia"].exists)
        XCTAssertTrue(app.buttons["Storia e Cultura"].exists)
        XCTAssertTrue(app.buttons["Lingua Viva"].exists)
    }
    
    func testConversationFlow() throws {
        // Test basic conversation flow
        app.buttons["Ricette di Famiglia"].tap()
        
        // Check if the first conversation question appears
        let firstQuestion = app.staticTexts["Nonna, ogni famiglia ha la sua ricetta del ragù?"]
        XCTAssertTrue(firstQuestion.waitForExistence(timeout: 2))
        
        // Test the "Avanti" button exists and is tappable
        let avantiButton = app.buttons["Avanti"]
        XCTAssertTrue(avantiButton.exists)
        avantiButton.tap()
        
        // Check if Nonna's response appears
        let nonnaResponse = app.staticTexts["Ogni famiglia, ogni nonna, ogni città! Il nostro è alla fiorentina 🍖"]
        XCTAssertTrue(nonnaResponse.waitForExistence(timeout: 2))
    }
}
