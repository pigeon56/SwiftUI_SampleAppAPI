// This file contains the fastlane.tools configuration
// You can find the documentation at https://docs.fastlane.tools
//
// For a list of all available actions, check out
//
// https://docs.fastlane.tools/actions
//
// For a list of all available plugins, check out
//
// https://docs.fastlane.tools/plugins/available-plugins
//

// Uncomment the line if you want fastlane to automatically update itself
// update_fastlane

import Foundation

class Fastfile: LaneFile {
  func allTestsLane() {
    desc("Run all tests in project")
    scan(
      scheme: "SampleAppAPI",
      device: "iPhone 15",
      clean: true,
      outputTypes: "junit"
    )
    echo(message: "Running all tests")
  }
}