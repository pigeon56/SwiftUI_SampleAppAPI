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


class SampleAppAPITests: XCTestCase {

    func testDefaultAppearance() {
        sleep(10)
        let courseRowView = CourseRowView(course: Course(name: "A.J. and Paulie's Super Amazing App!", image: "http://localhost:9999/disk-images"))
        assertSnapshot(matching: courseRowView.toVC(), as: .image)
    }
}

extension SwiftUI.View {
    func toVC() -> UIViewController {
        let vc = UIHostingController(rootView: self)
        vc.view.frame = UIScreen.main.bounds
        return vc
    }
}
