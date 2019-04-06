import XCTest

import swarkdownTests

var tests = [XCTestCaseEntry]()
tests += swarkdownTests.allTests()
XCTMain(tests)
