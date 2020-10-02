// ExtensionTests.swift
//
// Created by GigabiteLabs on 7/2/20
// Swift Version: 5.0
// Copyright © 2020 GigabiteLabs. All rights reserved.
//

#if canImport(XCTest)
import XCTest
#endif
import random_swift

class ExtensionTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIntExtensions() throws {
        print("\n\n*** Int Extension Tests: Starting Tests *** \n")
        for _ in 0 ... 1000 {
            // configure range
            let intRange = IntRange(lower: 1, upper: 100)
            
            // test random value
            let value: Int = .randomInt()
            XCTAssertGreaterThan(value, 0)
            
            // test value with upper limit
            let valueWithinLimit: Int = .randomInt(withUpperLimitOf: intRange)
            XCTAssertLessThanOrEqual(valueWithinLimit, Int(intRange.upper))
            
            // test value within range
            let valueWithinRange: Int = .randomInt(withinRange: intRange)
            XCTAssertLessThanOrEqual(valueWithinRange, Int(intRange.upper))
            XCTAssertGreaterThanOrEqual(valueWithinRange, Int(intRange.lower))
        }
        print("\n\n*** Int Extension Tests: Testing Finished ***\n")
    }
    
    func testPercentageExtensions() throws {
        print("\n\n*** PercentageValue Extension Tests: Starting Tests ***\n")
        for _ in 0 ... 5000 {
            // configure range
            let range = PercentageRange(min: 0.001, max: 1.0)
            
            // test random value
            let value: Double = .randomPercentage()
            XCTAssertGreaterThan(value, 0.000)
            
            // test value with upper limit with no decimal max
            let valueWithinLimit: Double = .randomPercentage(withUpperLimitOf: range, maxDecimalPlaces: nil)
            XCTAssertLessThanOrEqual(valueWithinLimit, range.max)
            
            // test value with upper limit with no decimal max
            let intRange = IntRange(lower: 2, upper: 10)
            // ~~ use our very own random int generator  to create a value ~~
            // ~~ within range to get random value for decimal places ~~
            let maxDecimal: Int = .randomInt(withinRange: intRange)
            let valueWithinLimitWithMaxDecimal: Double = .randomPercentage(within: range, maxDecimalPlaces: maxDecimal)
            XCTAssertLessThanOrEqual(valueWithinLimitWithMaxDecimal, range.max)
            // in some edge cases the value will be truncated to
            // one decimal place, so we need to guard for 0.0 which
            // is less than range.min
            XCTAssertTrue((valueWithinLimitWithMaxDecimal >= range.min) || (valueWithinLimitWithMaxDecimal == 0.0))
            // convert to string and split components
            let valueStringComponents = String(valueWithinLimitWithMaxDecimal).components(separatedBy: ".")
            let decimalString = valueStringComponents[1]
            // test that limitation was respected
            XCTAssertLessThanOrEqual(decimalString.count, maxDecimal)
            
            // test value within range
            let valueWithinRange: Double = .randomPercentage(within: range)
            XCTAssertLessThanOrEqual(valueWithinRange, range.max)
            XCTAssertGreaterThanOrEqual(valueWithinRange, range.min)
        }
        print("\n\n*** Int Extension Tests: Testing Finished ***\n")
    }
    
    func testPercentageTypeConversions() throws {
        print("\n\n*** PercentageValue Extension Value Conversion Tests: Starting Tests ***\n")
        for _ in 0 ... 5000 {
            // configure range
            let range = PercentageRange(min: 0.001, max: 0.999)
            
            // test random value
            let value: Double = .randomPercentage()
            // get & test CGFloat conversion
            let valueCGFloat: CGFloat = value.cgFloatValue
            XCTAssertEqual(CGFloat(value), valueCGFloat)
            // get & test Int conversion
            let valueInt: Int = value.intValue
            XCTAssertEqual(Int(value), valueInt)
            
            // test value with upper limit with no decimal max
            let valueWithinLimit: Double = .randomPercentage(withUpperLimitOf: range, maxDecimalPlaces: nil)
            // get & test CGFloat conversion
            let valueWithinLimitCGFloat: CGFloat = valueWithinLimit.cgFloatValue
            XCTAssertEqual(CGFloat(valueWithinLimit), valueWithinLimitCGFloat)
            // get & test Int conversion
            let valueWithinLimitInt: Int = valueWithinLimit.intValue
            XCTAssertEqual(Int(valueWithinLimit), valueWithinLimitInt)
            
            
            // test value with upper limit with no decimal max
            let intRange = IntRange(lower: 2, upper: 10)
            // ~~ use our very own random int within range to get random value for decimal places ~~
            let maxDecimal: Int = .randomInt(withinRange: intRange)
            let valueWithinLimitWithMaxDecimal: Double = .randomPercentage(within: range, maxDecimalPlaces: maxDecimal)
            // get & test CGFloat conversion
            let valueWithinLimitWithMaxDecimalCGFloat: CGFloat = valueWithinLimitWithMaxDecimal.cgFloatValue
            XCTAssertEqual(CGFloat(valueWithinLimitWithMaxDecimal), valueWithinLimitWithMaxDecimalCGFloat)
            // get & test Int conversion
            let valueWithinLimitWithMaxDecimalInt: Int = valueWithinLimitWithMaxDecimal.intValue
            XCTAssertEqual(Int(valueWithinLimitWithMaxDecimal), valueWithinLimitWithMaxDecimalInt)
        }
        print("\n\n*** PercentageValue Extension Value Conversion Tests ***\n")
    }
    
    func testIntTypeConversions() throws {
        print("\n\n*** Int Extension Value Conversion Tests: Starting Tests ***\n")
        for _ in 0 ... 1000 {
            // configure range
            let intRange = IntRange(lower: 1, upper: 100)
            
            // test random value
            let value: Int = .randomInt()
            // get & test CGFloat conversion
            let valueCGFloat: CGFloat = value.cgFloatValue
            XCTAssertEqual(CGFloat(value), valueCGFloat)
            // get & test Double conversion
            let valueDouble: Double = value.doubleValue
            XCTAssertEqual(Double(value), valueDouble)
            
            // test value with upper limit with no decimal max
            let valueWithinLimit: Int = .randomInt(withUpperLimitOf: intRange)
            // get & test CGFloat conversion
            let valueWithinLimitCGFloat: CGFloat = valueWithinLimit.cgFloatValue
            XCTAssertEqual(CGFloat(valueWithinLimit), valueWithinLimitCGFloat)
            // get & test Double conversion
            let valueWithinLimitDouble: Double = valueWithinLimit.doubleValue
            XCTAssertEqual(Double(valueWithinLimit), valueWithinLimitDouble)
            
            
            // test get random value within range
            let valueWithinRange: Int = .randomInt(withinRange: intRange)
            // get & test CGFloat conversion
            let valueWithinRangeCGFloat: CGFloat = valueWithinRange.cgFloatValue
            XCTAssertEqual(CGFloat(valueWithinRange), valueWithinRangeCGFloat)
            // get & test Double conversion
            let valueWithinRangeDouble: Double = valueWithinRange.doubleValue
            XCTAssertEqual(Double(valueWithinRange), valueWithinRangeDouble)
        }
        print("\n\n*** Int Extension Value Conversion Tests: Testing Finished ***\n")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            do {
                try testIntExtensions()
                try testPercentageExtensions()
                try testIntTypeConversions()
                try testPercentageTypeConversions()
            } catch {
                XCTFail("Error: \(error)\n\nNo errors should be thrown during performance tests.")
            }
        }
    }

}
