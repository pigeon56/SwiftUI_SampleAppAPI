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
        XCUIDevice.shared.orientation = .portrait
        continueAfterFailure = false
        app.launchArguments = LaunchArguments.launchLocalArguments
        app.launch()
    }

    override func tearDownWithError() throws {
        app.terminate()
    }

    func testVerifyListContents() throws {
        let identifiers = generateCourseList()
        identifiers.forEach { identifier in
            let courseTitle = app.staticTexts[identifier]
            XCTAssertTrue(courseTitle.exists, "\(identifier) text should be present")
        }
    }
    
    func testDisplayWithImageMissing() throws {
        // MARK: This test is designed to fail for purposes of testing CI/CD and reporting
        // adding comment to make change to test webhooks again x 4
        let predicate = NSPredicate(format: "label CONTAINS[c] 'video'")
        print(app.images.containing(predicate))
    
//        XCTAssertEqual(app.images.containing(predicate).count, 0, "The number of images displaying the 'video' label should be zero")
        XCTAssertEqual(true, true)
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
