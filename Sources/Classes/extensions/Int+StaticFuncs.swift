// Int+StaticFuncs.swift
//
// Created by GigabiteLabs on 7/2/20
// Swift Version: 5.0
// Copyright © 2020 GigabiteLabs. All rights reserved.
//

import Foundation

/// An extension for all`Double` public static functions.
public extension Int {
    /// A random `Int` with no limitiations.
    ///
    /// - Returns: `Int`, representing a random `Int`.
    ///
    /// - Note:
    /// See `Random.swift` documentation for more information.
    static func randomInt() -> Int {
        return Random.int.value
    }
    /// A random `Int` value between `range.min` and `range.max`.
    ///
    /// - Returns: `Int`, representing a random `Int` value within the
    /// lower and upper `range` limits.
    ///
    /// - Note:
    /// See `Random.swift` documentation for more information.
    static func randomInt(withinRange range: IntRange) -> Int {
        return Random.int.withinRange(range)
    }
    /// A random `Int` value between 0 and `range.upper`.
    ///
    /// - Returns: `Int`, representing a random Int value between
    /// 0 and `range.upper`.
    ///
    /// - Note:
    /// See `Random.swift` documentation for more information.
    static func randomInt(withUpperLimitOf range: IntRange) -> Int {
        return Random.int.withUpperLimit(of: range)
    }
}
