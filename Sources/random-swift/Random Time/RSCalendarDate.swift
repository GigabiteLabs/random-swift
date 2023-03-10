// RSCalendarDate.swift
//
// Created by GigabiteLabs
// Swift Version: 5.0
// Copyright © 2023 GigabiteLabs. All rights reserved.
//

import Foundation

public class RSCalendarDate {
    public func fromNow(by offset: RSCalendarDateOffset) -> Date {
        let now = Date()
        let offsetInterval = offset.toInterval
        let offsetDate = Date(timeInterval: offsetInterval, since: now)
        return offsetDate
    }
    
    public func inTheNearFuture(_ offset: RSCalendarDateOffset? = nil) -> Date {
        if let offset = offset {
            // create future date
            let now = Date()
            let futureDate = Date(timeInterval: offset.toInterval, since: now)
            return futureDate
        } else {
            let timeOffset = randomNeartimeWeeksOffset.doubleValue
            let offset = RSCalendarDateOffset(by: timeOffset, .weeks, .inTheFuture)
            // create future date
            let now = Date()
            let futureDate = Date(timeInterval: offset.toInterval, since: now)
            return futureDate
        }
    }
    
    public func inTheRecentPast(_ offset: RSCalendarDateOffset? = nil) -> Date {
        if let offset = offset {
            // create future date
            let now = Date()
            let futureDate = Date(timeInterval: offset.toInterval, since: now)
            return futureDate
        } else {
            let timeOffset = randomNeartimeWeeksOffset.doubleValue
            let offset = RSCalendarDateOffset(by: timeOffset, .weeks, .inthePast)
            // create future date
            let now = Date()
            let futureDate = Date(timeInterval: offset.toInterval, since: now)
            return futureDate
        }
    }
    
    /// Returns a random date between now and the Epoch.
    public var sinceEpoch: Date {
        // get current ms from epoch as Int
        let currentEpoch = Int(Date().timeIntervalSince1970)
        
        // setup a range
        let pastDateRange = IntRange(lower: 0, upper: currentEpoch)
        let pastDateRandom = Random.int.withinRange(pastDateRange)
        
        // get random date from past
        let randomDateSinceEpoch = Date(timeIntervalSince1970: TimeInterval.init(pastDateRandom))
        
        // return
        return randomDateSinceEpoch
    }
    
    fileprivate var randomNeartimeDaysOffset: Int {
        let offsetRange = IntRange(lower: 0, upper: 7)
        let randomOffset = Random.int.withinRange(offsetRange)
        return randomOffset
    }
    
    fileprivate var randomNeartimeWeeksOffset: Int {
        let offsetRange = IntRange(lower: 1, upper: 7)
        let randomOffset = Random.int.withinRange(offsetRange)
        return randomOffset
    }
    
    fileprivate var randomMediumTermMonthsOffset: Int {
        let offsetRange = IntRange(lower: 1, upper: 4)
        let randomOffset = Random.int.withinRange(offsetRange)
        return randomOffset
    }
    
    fileprivate var randomLongTermYearsOffset: Int {
        let offsetRange = IntRange(lower: 1, upper: 5)
        let randomOffset = Random.int.withinRange(offsetRange)
        return randomOffset
    }
}
