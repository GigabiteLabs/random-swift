// ObjectMethodTests.swift
//
// Created by GigabiteLabs on 7/2/20
// Swift Version: 5.0
// Copyright © 2020 GigabiteLabs. All rights reserved.
//

import XCTest
import random_swift

class ObjectMethodTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIntMethods() throws {
        print("\n\n*** IntValue Computed Property Test: Starting Tests\n")
        for _ in 0 ... 1000 {
            // Config small ranges
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
    
    func testPercentageMethods() throws {
        print("\n\n*** IntValue Computed Property Test: Starting Tests\n")
        for _ in 0 ... 1000 {
            // setup range config
            let percentageRange = PercentageRange(min: 0.1, max: 0.9)
            Random.percentageRange = percentageRange
            
            // generate random # of decimal places
            let randomValueMaxDecimal = randomMaxDecimal
            // get a random percentage rounded to max decimal places
            let randomValue = Random.percentage.value(roundedTo: randomValueMaxDecimal)
            // get string components to count the decimal half of the return value
            let valueStringComponents = String(randomValue).components(separatedBy: ".")
            // test that decimal place length was respected
            if valueStringComponents.count > 0 && valueStringComponents[1].count > 0 {
                XCTAssertTrue((valueStringComponents[1].count <= randomValueMaxDecimal) || (randomValue == 0.0))
            } else {
                print("could not test component count, count: \(valueStringComponents.count), component at index 1: \(valueStringComponents[1])")
            }
            
            // ** UPPER LIMIT TESTS ** //
            // get random not above limit, and NOT limited by decimal
            let randomValueWithinLimit = Random.percentage.withUpperLimit(of: percentageRange, maxDecimalPlaces: nil)
            XCTAssertLessThanOrEqual(randomValueWithinLimit, percentageRange.max)
            
            // get random not above limit, AND limited by decimal
            let randomValueWithinLimitAndMaxDecimal = Random.percentage.withUpperLimit(of: percentageRange, maxDecimalPlaces: randomValueMaxDecimal)
            XCTAssertLessThanOrEqual(randomValueWithinLimit, percentageRange.max)
            // get string components to count the decimal half of the return value
            let valueWithinLimitStringComponents = String(randomValueWithinLimitAndMaxDecimal).components(separatedBy: ".")
            // test that decimal place length was respected
            XCTAssertTrue((valueWithinLimitStringComponents[1].count <= randomValueMaxDecimal) || (randomValueWithinLimitAndMaxDecimal == 0.0))
            
            // ** RANGE TESTS ** //
            // get random within range
            let randomValueWithinRange = Random.percentage.withinRange(percentageRange)
            XCTAssertLessThanOrEqual(randomValueWithinRange, percentageRange.max)
            XCTAssertGreaterThanOrEqual(randomValueWithinRange, percentageRange.min)
            
            // get random within range and NOT decimal limited
            let randomValueWithinRangeNilDecimal = Random.percentage.withinRange(percentageRange, maxDecimalPlaces: nil)
            XCTAssertLessThanOrEqual(randomValueWithinRangeNilDecimal, percentageRange.max)
            XCTAssertGreaterThanOrEqual(randomValueWithinRangeNilDecimal, percentageRange.min)
            
            // get random within range AND decimal limited
            let randomValueWithinRangeAndMaxDecimal = Random.percentage.withinRange(percentageRange, maxDecimalPlaces: randomValueMaxDecimal)
            XCTAssertLessThanOrEqual(randomValueWithinRangeAndMaxDecimal, percentageRange.max)
            XCTAssertGreaterThanOrEqual(randomValueWithinRangeAndMaxDecimal, percentageRange.min)
            // test that maxdecimal length was respected
            let randomValueWithinRangeMaxDecimalStringComponents = String(randomValueWithinLimitAndMaxDecimal).components(separatedBy: ".")
            XCTAssertLessThanOrEqual(randomValueWithinRangeMaxDecimalStringComponents[1].count, randomValueMaxDecimal)
        }
        print("\n\n*** Int Computed Property Test: All Tests Finished\n")
    }
    
    /// A random max decimal generator
    var randomMaxDecimal: Int {
        let intRange = IntRange(lower: 1, upper: 20)
        let maxDecimal: Int = .randomInt(withinRange: intRange)
        return maxDecimal
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            do {
                try testIntMethods()
                try testPercentageMethods()
            } catch {
                XCTFail("Error: \(error)\n\nNo errors should be thrown during performance tests.")
            }
        }
    }

}
