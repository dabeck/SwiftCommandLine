import XCTest

import SwiftCommandLineTests

var tests = [XCTestCaseEntry]()
tests += SwiftCommandLineTests.__allTests()

XCTMain(tests)
