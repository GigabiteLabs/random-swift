import XCTest

import RandomTests

var tests = [XCTestCaseEntry]()
tests += RandomTests.allTests()
XCTMain(tests)
