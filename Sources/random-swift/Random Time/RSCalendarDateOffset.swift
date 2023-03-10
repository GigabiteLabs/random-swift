// File.swift
//
// Created by GigabiteLabs
// Swift Version: 5.0
// Copyright © 2023 GigabiteLabs. All rights reserved.
//

import Foundation

internal typealias OffsetOpt = RSCalendarDateOffsetOption

public enum RSCalendarDateOffsetOption: Int, CaseIterable {
    public typealias RawValue = Int
    case milliseconds = 1000
    /// DO NOT USE as .RawValue directly!
    case seconds = 120
    case minutes = 60
    case hours = 24
    case days = 7
    case weeks = 4
    case months = 12
    case years = 1
    
    public var toSeconds: Double {
        // basic maths setup
        let secondsInMinute = Double(OffsetOpt.seconds.rawValue) / 2
        let minutesInHour = Double(OffsetOpt.minutes.rawValue)
        let secondsInHour = secondsInMinute * minutesInHour
        
        let hoursInDay = Double(OffsetOpt.hours.rawValue)
        let secondsInDay = secondsInHour * hoursInDay
        
        let daysInWeek = Double(OffsetOpt.days.rawValue)
        let secondsInWeek = secondsInDay * daysInWeek
        
        let weeksInMonth = Double(OffsetOpt.weeks.rawValue)
        let secondsInMonth = secondsInWeek * weeksInMonth
        
        let monthsInYear = Double(OffsetOpt.months.rawValue)
        let secondsInYear = secondsInMonth * monthsInYear
        
        switch self {
        case .milliseconds:
            return 0.001
        case .seconds:
            return 1
        case .minutes:
            return secondsInMinute
        case .hours:
            return secondsInHour
        case .days:
            return secondsInDay
        case .weeks:
            return secondsInWeek
        case .months:
            return secondsInMonth
        case .years:
            return secondsInYear
        }
    }
}

public enum RSCalendarDateOffsetDirection {
    case inTheFuture
    case inthePast
}

public struct RSCalendarDateOffset {
    internal var offsetValue: Double
    internal var offsetDirection: RSCalendarDateOffsetDirection
    
    public init(by value: Double,
         _ unit: RSCalendarDateOffsetOption,
         _ direction: RSCalendarDateOffsetDirection) {
        self.offsetValue = unit.toSeconds * value
        self.offsetDirection = direction
    }
    
    public init(_ milliseconds: Double = 0,
         _ seconds: Double = 0,
         _ minutes: Double = 0,
         _ hours: Double = 0,
         _ days: Double = 0,
         _ weeks: Double = 0,
         _ months: Double = 0,
         _ years: Double = 0,
         _ direction: RSCalendarDateOffsetDirection) {
        
        // init tracking var
        var totalValue: Double = 0
        
        // iterate all cases and add to tracking
        // var if the value passed to init was
        // anything other than 0
        for unit in RSCalendarDateOffsetOption.allCases {
            switch unit {
            case .milliseconds:
                if milliseconds != 0 {
                    totalValue += unit.toSeconds
                }
            case .seconds:
                if seconds != 0 {
                    totalValue += unit.toSeconds
                }
            case .minutes:
                if minutes != 0 {
                    totalValue += unit.toSeconds
                }
            case .hours:
                if hours != 0 {
                    totalValue += unit.toSeconds
                }
            case .days:
                if days != 0 {
                    totalValue += unit.toSeconds
                }
            case .weeks:
                if weeks != 0 {
                    totalValue += unit.toSeconds
                }
            case .months:
                if months != 0 {
                    totalValue += unit.toSeconds
                }
            case .years:
                if years != 0 {
                    totalValue += unit.toSeconds
                }
            }
        }
        
        // assign & set
        self.offsetValue = totalValue
        self.offsetDirection = direction
    }
    
    public var toInterval: TimeInterval {
        // determine which direction
        switch offsetDirection {
        case .inTheFuture:
            return TimeInterval(offsetValue)
        case .inthePast:
            return TimeInterval(-offsetValue)
        }
    }
}
