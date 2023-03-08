// CalendarDate.swift
//
// Created by GigabiteLabs
// Swift Version: 5.0
// Copyright © 2023 GigabiteLabs. All rights reserved.
//

import Foundation

public class RSCalendarDate {
    /// A convenience wrapper acessor for ``Date.distantFuture``.
    public var inFuture: Date {
        return Date.distantFuture
    }
    /// A convenience wrapper for ``Date.distantPast``.
    public var inPast: Date {
        return Date.distantPast
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
}
