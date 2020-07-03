// IntValue.swift
//
// Created by GigabiteLabs on 7/2/20
// Swift Version: 5.0
// Copyright © 2020 GigabiteLabs. All rights reserved.
//

import Foundation

/// A value generator class for random int values.
public class IntValue: RandomValue {
    internal var range: IntRange?
    /// Returns a random Int using `arc4random`
    public var value: Int {
        return randomInt()
    }
    /// Dynamically returns a random `Int` value below the upper limit in `Range`.
    ///
    /// - Parameters:
    ///     - range: a `IntRange` configuration that defines
    ///     the upper and lower limits of the range (only upper is used in this method)/
    ///
    /// - Returns: `Int` representing a random value between 0 and `Range.upper`
    ///
    /// - Note:
    /// - If a randomly generated value exceeds the upper,` range.upper` is returned.
    ///
    public func withUpperLimit(of range: IntRange) -> Int {
        Random.int.range = range
        return withUpperLimit
    }
    /// A computed variable that returns random Double value between 0 and 1,
    /// respecting upper and lower percentage bound configuration.
    ///
    /// - Precondition: `Random.percentageRange` must be set
    ///
    /// - Returns: `Double` representing a random value within the configured range,
    /// or `nil` if a range is not configured.
    ///
    /// - Note:
    ///
    ///     Rules:
    ///     - If a randomly generated value exceeds the max,` PercentageRange.max` is returned.
    ///     - If a randomly generated value is less than the min, ` PercentageRange.min` is returned.
    ///
    /// - Warning: If a value is not set with`Random.percentageRange`,
    /// 0.0 will be returned.
    ///
    public var withUpperLimit: Int {
        guard let range = range else {
            return 0
        }
        return Int(arc4random_uniform(range.upper))
    }
    /// Dynamically returns a random `Int` value between `Range.upper` and `Range.lower`.
    ///
    /// - Parameters:
    ///     - range: a `IntRange` configuration that defines
    ///     the upper and lower bounds of the range.
    ///
    /// - Returns: `Int` representing a random value between `Range.lower` and `Range.upper`.
    ///
    /// - Note:
    /// - If a randomly generated value exceeds the upper,` IntRange.upper` is returned.
    /// - If a randomly generated value is less than the lower, ` IntRange.lower` is returned.
    /// - The returned value is exclusive of the upper value, meaning if an upper value is 4, for example,
    /// the maximum possible value returned would be 3.
    /// - The returned value is inclusive of the lower value, meaning, if a lower value is 1, for example,
    /// it is possible that the returned value could be 1.
    ///
    /// Example:
    ///
    ///             // usage
    ///             let range = IntRange(lower: 1, upper: 50)
    ///             let randomInt = Random.int.withinRange(range) // an Int > 1 and < 50 (49 max).
    ///
    public func withinRange(_ range: IntRange) -> Int {
        Random.int.range = range
        return withinRange
    }
    /// A computed variable that returns random Double value between 0 and 1,
    /// respecting upper and lower percentage bound configuration.
    ///
    /// - Precondition: `Random.percentageRange` must be set
    ///
    /// - Returns: `Double` representing a random value within the configured range,
    /// or `nil` if a range is not configured.
    ///
    /// - Note:
    ///
    ///     Rules:
    ///     - If a randomly generated value exceeds the max,` PercentageRange.max` is returned.
    ///     - If a randomly generated value is less than the min, ` PercentageRange.min` is returned.
    ///
    /// - Warning: If a value is not set with`Random.percentageRange`,
    /// 0.0 will be returned.
    ///
    /// Example:
    ///
    ///             // usage
    ///             let randomInt = Random.int.withinRange
    ///
    public var withinRange: Int {
        guard let range = range else {
            return 0
        }
        return Int((arc4random()%(range.upper-range.lower))+range.lower)
    }
}
