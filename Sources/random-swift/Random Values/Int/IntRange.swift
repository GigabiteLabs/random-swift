// IntRange.swift
//
// Created by GigabiteLabs on 7/2/20
// Swift Version: 5.0
// Copyright © 2020 GigabiteLabs. All rights reserved.
//

import Foundation

/// A configuration object used to define range boundaries
/// for use during random value generation.
public struct IntRange {
    /// The lowest allowable return value,
    /// aka: the lower-bound of the range.
    public var lower: UInt32
    /// The highest allowable return value,
    /// aka: the upper-bound of the range.
    public var upper: UInt32
    /// Initializes an `IntRange` from `Int` values, converting them to `UInt32`
    /// automatically.
    public init(lower: Int, upper: Int) {
        self.lower = UInt32(lower)
        self.upper = UInt32(upper)
    }
}
