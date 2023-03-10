// File.swift
//
// Created by GigabiteLabs
// Swift Version: 5.0
// Copyright © 2023 GigabiteLabs. All rights reserved.
//

import Foundation
#if canImport(XCTest)
import XCTest
#endif
import random_swift

class RS5RandomDateTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRandomPastDateSinceEpoch() throws {
        // limit to 5x the roughly 20,000 possible dates since jan 1 1970
        for _ in 0 ... 100000 {
            // get current interval since epoch
            let now = Date()
            let currentEpoch = now.timeIntervalSince1970.rounded()

            // get random since epoch
            let randomDateSinceEpoch = Random.date.sinceEpoch
            let randomDateInterval = randomDateSinceEpoch.timeIntervalSince1970
            
            // uncomment for debugging
//            print("current epoch: \(currentEpoch)")
//            print("random past epoch: \(randomDateSinceEpoch)")
//            print("current date: \(now.description)")
//            print("then: \(randomDateSinceEpoch.description)")
            
            XCTAssertLessThan(randomDateInterval, currentEpoch, "a random epoch time stamp in the past shall be lesser than the current epoch")
        }
    }
    
    func testCalendarDateOffsetIntervalToSeconds() throws {
        // setup known values
        let millisecondsInSecond: Double = 0.001
        let secondsInSecond: Double = 1
        let secondsInMinute: Double = 60
        let secondsInHour: Double = 3600
        let secondsInDay: Double = 86400
        let secondsInWeek: Double = 604800
        let secondsInMonth: Double = 2419200
        let secondsInYear: Double = 29030400
        
        for offsetOption in RSCalendarDateOffsetOption.allCases {
            switch offsetOption {
            case .milliseconds:
                XCTAssertEqual(offsetOption.toSeconds, millisecondsInSecond)
            case .seconds:
                XCTAssertEqual(offsetOption.toSeconds, secondsInSecond)
            case .minutes:
                XCTAssertEqual(offsetOption.toSeconds, secondsInMinute)
            case .hours:
                XCTAssertEqual(offsetOption.toSeconds, secondsInHour)
            case .days:
                XCTAssertEqual(offsetOption.toSeconds, secondsInDay)
            case .weeks:
                XCTAssertEqual(offsetOption.toSeconds, secondsInWeek)
            case .months:
                XCTAssertEqual(offsetOption.toSeconds, secondsInMonth)
            case .years:
                XCTAssertEqual(offsetOption.toSeconds, secondsInYear)
            }
        }
    }
    
    // TODO: expand this to use a random value for offset, and test each type of offset (not just days)
    func testCalendarDateOffset() throws {
        // vars to test against
        let offsetDays = 7.0
        let secondsInDay: Double = 86400
        let dayInterval = TimeInterval(secondsInDay * offsetDays)
        
        // create new interval offset by days
        let offset = RSCalendarDateOffset(by: offsetDays, .days, .inTheFuture)
        let offsetInterval = offset.toInterval
        
        // seconds as interval value should be equal
        XCTAssertEqual(offsetInterval, dayInterval)
        
        // get today and a future date offset by
        // the interval created above
        let now = Date()
        let futureDate = Date(timeInterval: offsetInterval, since: now)
        
        // get the day components for each
        let nowComponents = Calendar.current.dateComponents([.day], from: now)
        let futureComponents = Calendar.current.dateComponents([.day], from: futureDate)
        
        // setup results for comparison as Doubles
        let expectedResult = Double(nowComponents.day!) + offsetDays
        let futureDayResult = Double(futureComponents.day!)
        
        // test comparison
        XCTAssertEqual(expectedResult, futureDayResult)
    }
    
    func testCalendarDateOffsetByNearTermWeeks() throws {
        let now = Date()
        let nearTermFuture = Random.date.inTheNearFuture()
        let recentPast = Random.date.inTheRecentPast()
        // assert now GT past and LT future
        XCTAssertTrue(now > recentPast)
        XCTAssertTrue(now < nearTermFuture)

//        let nowComponents = Calendar.current.dateComponents([.day, .weekday, .month], from: now)
//        let futureComponents = Calendar.current.dateComponents([.day, .weekday, .month], from: nearTermFuture)
//        let pastComponents = Calendar.current.dateComponents([.day, .weekday, .month], from: recentPast)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            do {
                try testRandomPastDateSinceEpoch()
            } catch {
                XCTFail("performance measurement failure, error: \(error)")
            }
        }
    }

}
