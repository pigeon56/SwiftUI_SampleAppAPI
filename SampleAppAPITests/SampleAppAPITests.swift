//
//  SampleAppAPITests.swift
//  SampleAppAPITests
//
//  Created by Cindy Michalowski on 2/5/24.
//

import XCTest
@testable import SampleAppAPI
import SnapshotTesting
import SwiftUI


final class SampleAppAPITests: XCTestCase {
    var viewController: UIViewController!
    var vc: UIViewController!

    override func setUpWithError() throws {
        try super.setUpWithError()
        let contentView = ContentView()
        let urlImageView = URLImage(urlString: "video")
        viewController = UIHostingController(rootView: contentView)
        vc = UIHostingController(rootView: urlImageView)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        viewController = nil
    }
    
    func testFirstTest() throws {
//        isRecording = true
        sleep(10)
        assertSnapshot(matching: viewController, as: .image(on: .iPhoneX))
    }
    
    func testURLImage() throws {
        sleep(10)
        assertSnapshot(matching: vc, as: .image(on: .iPhoneX))
    }
}
