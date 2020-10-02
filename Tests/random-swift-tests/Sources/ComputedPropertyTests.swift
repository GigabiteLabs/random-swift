// ComputedPropertyTests.swift
//
// Created by GigabiteLabs on 7/3/20
// Swift Version: 5.0
// Copyright © 2020 GigabiteLabs. All rights reserved.
//

import XCTest
import  random_swift

class ComputedPropertyTests: XCTestCase {
     
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // *** Testing *** //
    func testComputedInts() throws {
        print("\n\n*** IntValue Computed Property Test: Starting Tests\n")
        for _ in 0 ... 200 {
            // Config with strict ranges
            let intRange = IntRange(lower: 1, upper: 100)
            Random.intRange = intRange

            // get random int
            let randomInt = Random.int.value
            XCTAssertGreaterThan(randomInt, 0, "random int should always be greater than 0")

            // get ramdom int by limit
            let randomLimited = Random.int.withUpperLimit
            XCTAssertLessThanOrEqual(randomLimited, Int(intRange.upper), "randomLimited int cannot be greater than the limit")
            
            // get random within range
            let randomWithinRange = Random.int.withinRange
            XCTAssertLessThanOrEqual(randomWithinRange, Int(intRange.upper), "randomWithinRange should be less than or equal to the upper-bound value")
            XCTAssertGreaterThanOrEqual(randomWithinRange, Int(intRange.lower), "randomWithinRange should be greater than or equal to the lower-bound value")
        }
        print("\n\n*** Int Computed Property Test: All Tests Finished\n")
    }
    
    func testComputedPercentages() throws {
        print("\n\n*** PercentageValue Computed Property Test: Starting Tests\n")
        for _ in 0 ... 200 {
            let percentageRange = PercentageRange(min: 0.1, max: 0.9)
            Random.percentageRange = percentageRange
            
            // Random Percentage computed property tests
            // get random percentage
            let randomPct = Random.percentage.value
            XCTAssertGreaterThan(randomPct, 0.0, "randomPct should be greater than 0.0")
            
            // get random pct by limit
            let randomPctLimited = Random.percentage.withUpperLimit
            XCTAssertLessThan(randomPctLimited, percentageRange.max, "randomPctLimited should be less than or equal to percentageRange.max")
                
            // get random pct within range
            let randomPctWithinRange = Random.percentage.withinRange
            XCTAssertLessThanOrEqual(randomPctWithinRange, percentageRange.max, "randomPctWithinRange should be less than or equal to percentageRange.max")
            XCTAssertGreaterThanOrEqual(randomPctWithinRange, percentageRange.min, "randomPctWithinRange should be greater than or equal percentageRange.min")
        }
        print("\n\n*** PercentageValue Computed Property Test: All Tests Finished\n")
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure() {
            do {
                try self.testComputedInts()
                try self.testComputedPercentages()
            } catch {
                XCTFail("Error: \(error)\n\nNo errors should be thrown during performance tests.")
            }
        }
    }
    
}

