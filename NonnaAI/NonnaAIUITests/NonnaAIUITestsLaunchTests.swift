//
//  NonnaAIUITestsLaunchTests.swift
//  NonnaAIUITests
//
//  Created by Carson Mulligan on 12/14/24.
//

import XCTest

final class NonnaAIUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert launch performance test here
        let titleText = app.staticTexts["Impara l'italiano con la Nonna"]
        XCTAssertTrue(titleText.waitForExistence(timeout: 2.0))
        
        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
