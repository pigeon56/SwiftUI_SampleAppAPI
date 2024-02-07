//
//  SampleAppAPIUITests.swift
//  SampleAppAPIUITests
//
//  Created by Cindy Michalowski on 2/5/24.
//

import XCTest

final class SampleAppAPIUITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
//        app.launchArguments = LaunchArguments
        app.launch()
    }

    override func tearDownWithError() throws {
        app.terminate()
    }

    func testVerifyListContents() throws {
        let app = XCUIApplication()
        app.launchArguments = LaunchArguments.launchLocalArguments
        app.launch()
    
        let identifiers = generateCourseList()
        identifiers.forEach { identifier in
            let courseTitle = app.staticTexts[identifier]
            XCTAssertTrue(courseTitle.exists, "\(identifier) text should be present")
        }
    }
    
    func testDisplayWithImageMissing() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
    
        print("Wait here")

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func generateCourseList() -> [String] {
        let courses = [
            "World History",
            "Earth Science",
            "Algebra II"
        ]
        
        let indentifiers = courses.map { course in
            return course
        }
        
        return indentifiers
    }
}
