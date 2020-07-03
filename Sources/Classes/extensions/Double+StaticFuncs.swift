// Double+Generics.swift
//
// Created by GigabiteLabs on 7/2/20
// Swift Version: 5.0
// Copyright © 2020 GigabiteLabs. All rights reserved.
//

import Foundation

/// An extension for all`Double` public static functions.
public extension Double {
    /// A random percentage value.
    ///
    /// - Returns: `Double`, representing a random percentage value.
    ///
    /// - Note:
    /// See `Random.swift` documentation for more information.
    static func randomPercentage() -> Double {
        return Random.percentage.value
    }
    /// A random percentage value between `range.min` and `range.max`.
    ///
    /// - Parameters:
    ///     - range: a `PercentageRange` configuration that defines
    ///     the min and max of the range
    ///
    /// - Returns: `Double`, representing a random percentage value within the
    /// min and max `range` limits.
    ///
    /// - Note:
    /// See `Random.swift` documentation for more information.
    static func randomPercentage(within range: PercentageRange) -> Double {
        return Random.percentage.withinRange(range)
    }
    /// A random percentage value between `range.min` and `range.max`, limiting
    /// the number of decimal places to the value provided.
    ///
    /// - Parameters:
    ///     - range: a `PercentageRange` configuration that defines
    ///     the min and max of the range
    ///     - maxDecimalPlaces: an optional configuration that limits the return value to
    ///      the number of max places specified.
    ///
    /// - Returns: `Double`, representing a random percentage value within the
    /// min and max `range` limits.
    ///
    /// - Note:
    /// See `Random.swift` documentation for more information.
    static func randomPercentage(within range: PercentageRange, maxDecimalPlaces: Int) -> Double {
        return Random.percentage.withinRange(range, maxDecimalPlaces: maxDecimalPlaces)
    }
    /// A random percentage value between 0.0 and `range.max`, optionally
    /// rounded to a number of decimal places.
    ///
    /// - Parameters:
    ///     - range: a `PercentageRange` configuration that defines
    ///     the min and max of the range
    ///     - maxDecimalPlaces: an optional configuration that limits the return value to
    ///      the number of max places specified.
    ///
    /// - Returns: `Double`, representing a random percentage value
    /// not exceeding `range.max`.
    ///
    /// - Note:
    /// See `Random.swift` documentation for more information.
    static func randomPercentage(withUpperLimitOf range: PercentageRange, maxDecimalPlaces: Int?) -> Double {
        return Random.percentage.withUpperLimit(of: range, maxDecimalPlaces: maxDecimalPlaces)
    }
}
