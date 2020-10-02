// ConfigurationTests.swift
//
// Created by GigabiteLabs on 7/3/20
// Swift Version: 5.0
// Copyright © 2020 GigabiteLabs. All rights reserved.
//

#if canImport(XCTest)
import XCTest
#endif
import random_swift

class ConfigurationTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        Random.percentageRange = nil
        Random.intRange = nil
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInvalidConfigWithIntValue() throws {
        // test upper limit without config
        let randomWithUpperLimit = Random.int.withUpperLimit
        // the expected value is 0
        XCTAssert(randomWithUpperLimit == 0, "Return value without proper config should equal 0.")
        
        // test within range without valid config
        let randomWithinRange = Random.int.withinRange
        XCTAssert(randomWithinRange == 0, "Return value without proper config should equal 0.")
    }
    
    func testInvalidConfigWithPercentageValue() throws {
        // test upper limit without config
        let randomWithUpperLimit = Random.percentage.withUpperLimit
        // the expected value is 0
        XCTAssert(randomWithUpperLimit == 0.0, "Return value without proper config should equal 0.0")
        
        // test within range without valid config
        let randomWithinRange = Random.percentage.withinRange
        XCTAssert(randomWithinRange == 0, "Return value without proper config should equal 0.0")
    }
    
    func testValidConfigWithPercentageValue() throws {
        let percentageRange = PercentageRange(min: 0.1, max: 0.9)
        Random.percentageRange = percentageRange
        XCTAssertNotNil(Random.percentageRange)
    }
    
    func testValidConfigWithIntValue() throws {
        let intRange = IntRange(lower: 1, upper: 100)
        Random.intRange = intRange
        XCTAssertNotNil(Random.intRange)
    }
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // reset config vars for invalid tests
            Random.percentageRange = nil
            Random.intRange = nil
            do {
                try testInvalidConfigWithIntValue()
                try testInvalidConfigWithPercentageValue()
                // valid tests set the config vars when running
                try testValidConfigWithIntValue()
                try testValidConfigWithPercentageValue()
            } catch {
                XCTFail("Error: \(error)\n\nNo errors should be thrown during performance tests.")
            }
        }
    }

}
