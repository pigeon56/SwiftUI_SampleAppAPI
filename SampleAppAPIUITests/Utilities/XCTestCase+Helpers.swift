//
//  XCTestCase+Helpers.swift
//  SampleAppAPIUITests
//
//  Created by Cindy Michalowski on 2/7/24.
//

import XCTest

extension XCTestCase {
    
    func waitForElementToAppear(_ element: XCUIElement,
                                file: StaticString,
                                line: UInt,
                                elementName: String,
                                timeout: TimeInterval = 5.0) {
        
        let predicate = NSPredicate(format: "exists == true")
        let existsExpectation = expectation(for: predicate,
                                           evaluatedWith: element,
                                           handler: nil)
        let result = XCTWaiter().wait(for: [existsExpectation], timeout: timeout)
        
        guard result == .completed else {
            let failureMessage = "\(elementName) should be present)"
            XCTFail(failureMessage, file: file, line: line)
            return
        }
        
    }
}
