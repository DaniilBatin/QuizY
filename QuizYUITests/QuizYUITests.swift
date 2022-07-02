//
//  QuizYUITests.swift
//  QuizYUITests
//
//  Created by Daniil Batin on 23.05.2022.
//

import XCTest

class QuizYUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCorrectlySearchFieldWorking() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        app.searchFields["Search"].tap()
        app.searchFields["Search"].typeText("Stock")
      
        XCTAssert(app.cells.staticTexts["Stock symbols"].exists)
    }
    
    func testScrollUICollectionView() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        app.swipeDown()
        app.swipeUp()
                
        XCTAssert(app.cells.staticTexts["Pop music"].exists)

      
    }
    
    func testAlertButton() throws {
        let app = XCUIApplication()
        app.launch()

        app.swipeUp()
        app.cells.staticTexts["Pop music"].tap()
        app.wait(for: .notRunning, timeout: 2.0)
        app.buttons.staticTexts["Answer"].tap()
                        
        XCTAssert(app.alerts["Answer"].exists)
    }
    
    
    func testAlertAfterTimer() throws {
        let app = XCUIApplication()
        app.launch()

        app.cells.staticTexts["Museums"].tap()
        app.wait(for: .notRunning, timeout: 21.0)
                        
        XCTAssert(app.alerts["Answer"].exists)
    }
    
    

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
