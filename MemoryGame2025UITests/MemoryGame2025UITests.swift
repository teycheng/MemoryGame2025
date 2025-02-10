//
//  MemoryGame2025UITests.swift
//  MemoryGame2025UITests
//
//  Created by ICS 224 on 2025-01-10.
//

import XCTest

final class MemoryGame2025UITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

//    @MainActor
//    func testExample() throws {
//        // UI tests must launch the application that they test.
//        let app = XCUIApplication()
//        app.launch()
//
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    @MainActor
//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
    @MainActor
    func testRowColumnStepper() throws {
        let app = XCUIApplication()
        app.launch()
        let settingsButton = app.buttons["SettingsButton"]
        settingsButton.tap()
        let stepper1 = app.steppers["RowColumnStepper"]
        let increment = stepper1.buttons["RowColumnStepper-Increment"]
        let decrement = stepper1.buttons["RowColumnStepper-Decrement"]
        //for i in 3...10 {
            increment.tap()
            XCTAssertEqual(stepper1.label, "3 Rows/Columns", "Stepper did not increment properly")
            decrement.tap()
            XCTAssertEqual(stepper1.label, "2 Rows/Columns", "Stepper did not decrement properly")
            
            
        //}
    }
    
    func testRowColumnStepperRange() throws {
        let app = XCUIApplication()
        app.launch()
        let settingsButton = app.buttons["SettingsButton"]
        settingsButton.tap()
        let stepper1 = app.steppers["RowColumnStepper"]
        let increment = stepper1.buttons["RowColumnStepper-Increment"]
        let decrement = stepper1.buttons["RowColumnStepper-Decrement"]
        for i in 1...9 {
            increment.tap()
        }
            XCTAssertEqual(stepper1.label, "10 Rows/Columns", "Stepper did not increment properly")
        for i in 1...9 {
            decrement.tap()
        }
            XCTAssertEqual(stepper1.label, "2 Rows/Columns", "Stepper did not decrement properly")
    }
    
    func testTreasureStepper() throws {
        let app = XCUIApplication()
        app.launch()
        let settingsButton = app.buttons["SettingsButton"]
        settingsButton.tap()
        let stepper2 = app.steppers["TreasureButton"]
        let increment = stepper2.buttons["TreasureButton-Increment"]
        let decrement = stepper2.buttons["TreasureButton-Decrement"]
            increment.tap()
            XCTAssertEqual(stepper2.label, "3 Treasure", "Stepper did not increment properly")
            decrement.tap()
            XCTAssertEqual(stepper2.label, "2 Treasure", "Stepper did not decrement properly")
    }
    
    func testTreasureStepperRange() throws {
        let app = XCUIApplication()
        app.launch()
        let settingsButton = app.buttons["SettingsButton"]
        settingsButton.tap()
        let stepper2 = app.steppers["TreasureButton"]
        let increment = stepper2.buttons["TreasureButton-Increment"]
        let decrement = stepper2.buttons["TreasureButton-Decrement"]
        for i in 1...9 {
            increment.tap()
        }
            XCTAssertEqual(stepper2.label, "10 Treasure", "Stepper did not increment properly")
        for i in 1...9 {
            decrement.tap()
        }
            XCTAssertEqual(stepper2.label, "2 Treasure", "Stepper did not decrement properly")
        
    }
    
    func testImageButton() throws{
        let app = XCUIApplication()
        app.launch()
        
        
        let settingsButton = app.buttons["SettingsButton"]
        settingsButton.tap()
        let prevButton = app.images["PreviousButton"]
        let nextButton = app.images["NextButton"]
        let image = app.images["SelectedImage"]
        
        prevButton.tap()
        
        XCTAssertEqual(image.label, "cloud.sun.rain", "Previous button did not work")
        nextButton.tap()
        XCTAssertEqual(image.label, "bird", "Next button did not work")
        
        for i in 1...3 {
            prevButton.tap()
        }
        XCTAssertEqual(image.label, "bird", "Previous button did not work")
        for i in 1...3 {
            nextButton.tap()
        }
        XCTAssertEqual(image.label, "bird", "Next button did not work")

    }
    
    func testImageChange() throws{
        let app = XCUIApplication()
        app.launch()
        let settingsButton = app.buttons["SettingsButton"]
        settingsButton.tap()
        let prevButton = app.images["PreviousButton"]
        let nextButton = app.images["NextButton"]
        let image = app.images["CurrentImage"]
        prevButton.tap()
        let gameButton = app.buttons["GameButton"]
        gameButton.tap()
        XCTAssertEqual(image.label, "cloud.sun.rain", "Image did not update properly")
        //Reset
        settingsButton.tap()
        nextButton.tap()
    }
    
    func testSavingLoading() throws{
        let app = XCUIApplication()
        app.launch()
        let settingsButton = app.buttons["SettingsButton"]
        settingsButton.tap()
        
        let prevButton = app.images["PreviousButton"]
        let nextButton = app.images["NextButton"]
        
        let stepper1 = app.steppers["RowColumnStepper"]
        let incrementRowColumn = app.buttons["RowColumnStepper-Increment"]
        let decrementRowColumn = app.buttons["RowColumnStepper-Decrement"]

        let stepper2 = app.steppers["TreasureButton"]
        let incrementTreasure = app.buttons["TreasureButton-Increment"]
        let decrementTreasure = app.buttons["TreasureButton-Decrement"]

        let image = app.images["SelectedImage"]
        
        prevButton.tap()
        incrementRowColumn.tap()
        incrementTreasure.tap()
        
        app.terminate()
        app.launch()
        settingsButton.tap()
        XCTAssertEqual(image.label,"cloud.sun.rain", "Image did not save properly")
        XCTAssertEqual(stepper1.label,"3 Rows/Columns", "Row/Columns did not save properly")
        XCTAssertEqual(stepper2.label,"3 Treasure", "Treasure did not save properly")
        
        //Reset
        nextButton.tap()
        decrementRowColumn.tap()
        decrementTreasure.tap()
        
    }
}
