// PercentageValue.swift
//
// Created by GigabiteLabs on 7/2/20
// Swift Version: 5.0
// Copyright © 2020 GigabiteLabs. All rights reserved.
//

import Foundation

/// A value generator class for random percentage values.
public class PercentageValue: RandomValue {
    // A range configuration set through `Range.percentageRange` = newValue.
    internal var range: PercentageRange?
    /// A private variable for configuration of decimal place limitations
    private var maxDecimalPlacesForRange: Int?
    /// Returns a random `Double` between 0.0 and 1.0
    /// with no limitations on decimal places on the output.
    ///
    /// - Returns: `Double` between 0.0 and 1.0
    ///
    /// Example:
    ///
    ///         // Usage
    ///         let randomPercent = Random.percentage.value
    ///
    ///         // internally, if the initial random value was
    ///         0.59483093929
    ///         // the output would be the same
    ///
    ///         print(randomPercent) // 0.59483093929
    ///
    public var value: Double {
        return Double.random(in: 0 ... 1)
    }
    /// Returns a random `Double` between 0.0 and 1.0
    /// rounded to the number of maximum decimal places.
    ///
    /// - Parameters:
    ///     - maxDecimalPlaces: an `Int` specifying how many decimal places to limit
    ///     the returned value by.
    ///
    /// - Returns: `Double` between 0.0 and 1.0
    ///
    /// Example:
    ///
    ///         // Usage
    ///         let randomPercent = Random.percentage.value(maxDecimalPlaces: 4)
    ///
    ///         // internally, if the initial random value was
    ///         0.59483093929
    ///         // the output would be:
    ///         0.5948
    ///
    ///         print(randomPercent) // 0.5948
    ///
    /// - Note: If no value is specified for `maxDecimalPlaces` the default value of `10` will be used
    ///
    public func value(roundedTo maxDecimalPlaces: Int) -> Double {
        return Double.random(in: 0 ... 1).rounded(toPlaces: maxDecimalPlaces)
    }
    /// Dynamically returns a random `Double` value below the upper limit in `Range`.
    ///
    /// - Parameters:
    ///     - range: a `PercentageRange` configuration that defines the min and max range of
    ///     the return value.
    ///     - maxDecimalPlaces: an optional configuration that limits the return value to
    ///      the number of max places specified.
    ///
    /// - Returns: `Double` representing a random value between 0.0 and `range.max`
    ///
    /// - Note:
    /// - If a randomly generated value exceeds the upper,` range.max` is returned.
    ///
    public func withUpperLimit(of range: PercentageRange, maxDecimalPlaces: Int?) -> Double {
        // setup range for re-use
        Random.percentageRange = range
        // if max places is provided, use to round return value
        if let maxDecimal = maxDecimalPlaces {
            return withUpperLimit.rounded(toPlaces: maxDecimal)
        }
        return withUpperLimit
    }
    /// A computed variable that returns random `Double` value between 0.0 and 1.0,
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
    ///     - If a randomly generated value exceeds the max,`PercentageRange.max` is returned.
    ///     - If a randomly generated value is less than the min, `PercentageRange.min` is returned.
    ///
    /// - Warning: If a value is not set with`Random.percentageRange = newValue`,
    /// before using this computed property, then 0.0 will be returned.
    ///
    public var withUpperLimit: Double {
        guard let range = range else {
            return 0.0
        }
        return Double.random(in: range.min ... range.max)
    }
    /// Dynamically returns a random Double value between 0 and 1 by `PercentageRange` provided.
    ///
    /// - Parameters:
    ///     - range: a `PercentageRange` configuration that defines
    ///     the min and max of the range
    ///
    /// - Returns: `Double` representing a random value between min and max of `Range`
    ///
    /// - Note:
    /// - If a randomly generated value exceeds the max,` PercentageRange.max` is returned.
    /// - If a randomly generated value is less than the min, ` PercentageRange.min` is returned.
    ///
    public func withinRange(_ range: PercentageRange) -> Double {
        // setup range for re-use
        Random.percentageRange = range
        // return value within range
        return withinRange
    }
    /// Dynamically returns a random Double value between 0.0 and 1.0 by `PercentageRange` provided,
    /// and if configured, limited to the specified number of decminal places.
    ///
    /// - Parameters:
    ///     - range: a `PercentageRange` configuration that defines
    ///     the min and max of the range
    ///     - maxDecimalPlaces: an optional configuration that limits the return value to
    ///      the number of max places specified.
    ///
    /// - Returns: `Double` representing a random value between min and max of `Range`
    ///
    /// - Note:
    /// - If a randomly generated value exceeds the max,` PercentageRange.max` is returned.
    /// - If a randomly generated value is less than the min, ` PercentageRange.min` is returned.
    /// - If no maxDecimalPlaces are provided, no limitation will be applied to the return value.
    ///
    public func withinRange(_ range: PercentageRange, maxDecimalPlaces: Int?) -> Double {
        // setup range for re-use
        Random.percentageRange = range
        // if max places is provided, use to round return value
        if let maxDecimal = maxDecimalPlaces {
            self.maxDecimalPlacesForRange = maxDecimal
            let pctWithinRange = withinRange
            return pctWithinRange.rounded(toPlaces: maxDecimal)
        }
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
    public var withinRange: Double {
        // return 0.0 if no range configured
        guard let range = range else {
            return 0.0
        }
        // setup starting value
        let initial = Double.random(in: 0 ... 1)
        // setup var for modification
        var processed: Double = initial
        // check for user-configured maxDecimalPlaces
        if let maxDecimal = self.maxDecimalPlacesForRange {
            processed = initial.rounded(toPlaces: maxDecimal)
        }
        // determine if the processed var is above or
        // below the allowable range
        if processed < range.min || processed > range.max {
            switch processed < range.min {
            case true:
                return range.min
            case false:
                return range.max
            }
        } else {
            return processed
        }
    }
}
