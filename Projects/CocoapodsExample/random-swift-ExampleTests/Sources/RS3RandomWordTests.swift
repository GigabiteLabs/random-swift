// RandomWordTests.swift
//
// Created by GigabiteLabs on 7/7/20
// Swift Version: 5.0
// Copyright © 2020 GigabiteLabs. All rights reserved.
//

#if canImport(XCTest)
import XCTest
#endif
import random_swift

class RS3RandomWordTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        #if SPMTEST
        print("SPMTEST set in the env")
        print("test resource bundle: \(Bundle(for: RS3RandomWordTests.self).bundlePath)")
        #endif
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRandomWord() throws {
        
        for _ in 0 ... 235886 {
            let randomWord = Random.word
            XCTAssertFalse(randomWord.contains("::error::"))
        }
    }
    
    func testRandomWordConfig() {
        // test overriding default config
        Random.config.enableWordsForRelease = true
        XCTAssertTrue(Random.config.enableWordsForRelease)
        
        // test setting a new config
        let newConfig = RandomConfig()
        newConfig.enableWordsForRelease = false
        Random.config = newConfig
        
        XCTAssertFalse(Random.config.enableWordsForRelease)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
