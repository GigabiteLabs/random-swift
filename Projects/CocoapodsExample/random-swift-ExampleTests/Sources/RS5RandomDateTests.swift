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
    
    func testRandomPastDate() throws {
        
        for _ in 0 ... 100000 {
            // get current interval since epoch
            let now = Date()
            let currentEpoch = now.timeIntervalSince1970.rounded()

            // get random since epoch
            let randomPastDate = Random.date.inPast
            let randomPastDateInterval = randomPastDate.timeIntervalSince1970
            
            // uncomment for debugging
            XCTFail("resume here-- past date is always: 0001-01-01 00:00:00 +0000")
            print("current epoch: \(currentEpoch)")
            print("random past epoch: \(randomPastDate)")
            print("current date: \(now.description)")
            print("then: \(randomPastDate.description)")
            
            XCTAssertLessThan(randomPastDateInterval, currentEpoch, "a random epoch time stamp in the past shall be lesser than the current epoch")
        }
    }
    
//    func testRandomFutureDate() throws {
//        // limit to 5x the roughly 20,000 possible dates since jan 1 1970
//        for _ in 0 ... 100000 {
//            // get current interval since epoch
//            let now = Date()
//            let currentEpoch = now.timeIntervalSince1970.rounded()
//
//            // get random since epoch
//            let randomDateSinceEpoch = Random.date.sinceEpoch
//            let randomDateInterval = randomDateSinceEpoch.timeIntervalSince1970
//
//            // uncomment for debugging
////            print("current epoch: \(currentEpoch)")
////            print("random past epoch: \(randomDateSinceEpoch)")
////            print("current date: \(now.description)")
////            print("then: \(randomDateSinceEpoch.description)")
//
//            XCTAssertLessThan(randomDateInterval, currentEpoch, "a random epoch time stamp in the past shall be lesser than the current epoch")
//        }
//    }

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

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            do {
                try testRandomPastDateSinceEpoch()
                try testRandomPastDate()
            } catch {
                XCTFail("performance measurement failure, error: \(error)")
            }
        }
    }

}
