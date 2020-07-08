// Random.swift
//
// Created by GigabiteLabs on 7/2/20
// Swift Version: 5.0
// Copyright © 2020 GigabiteLabs. All rights reserved.
//
import Foundation
/// A random value generation utility.
///
/// ** Configuration **
///
/// The utility does not require any configuration to generate random values. For those,
/// you can simply call `Random.(type).value` to retrieve the random value.
///
/// However, there are many cases where a configuration for upper / lower bound, or min / max values.
///
/// **Reusable Configurations by Default**
///
/// Configuring a range sets up the shared instance to re-use that range configuration
///     on all subsequent calls until modified.
///
/// Example:
///
///          // configure reusable IntRange
///          let intRange = IntRange(lower: 4, upper: 100)
///          Random.intRange = intRange
///          // see below for Random.int usage examples.
///
///          // configure reusable PercentageRange
///          let pctRange = PercentageRange(min: 0.10, max: 0.98)
///          Random.percentageRange = pctRange
///          // see below for Random.percentage usage examples
///
/// **Overriding Current Configuration**
///
/// You can override the configuration at any time by setting up a new range just as above,
/// however, you can also call any of the computed variables through an interface method
/// and provide a new configuration dynamically.
///
///
/// Examples:
///
/// ** Random Int **
///
///         // get random int with no limitations
///         let randomInt = Random.int.value
///
///         // get random int value below an upper limit
///
///         // get random int value within a given range
///
/// ** Random Percentage (Double) **
///
///         // get random percentage with no limitations
///         let randomPercent = Random.percentage.value
///
///         // get random percentage value below an upper limit
///
///         // get random percentage value within a given range
///
///
public class Random {
    /// The shared instance of `IntValue`.
    public static let int = IntValue()
    /// The shared instance of `PercentageValue`.
    public static let percentage = PercentageValue()
    /// An Int range configuration with upper and lower bounds.
    public static var intRange: IntRange? {
        get {
            return Random.int.range
        }
        set {
            Random.int.range = newValue
        }
    }
    /// A percentage range configuration with min & max lower bounds.
    public static var percentageRange: PercentageRange? {
        get {
            return Random.percentage.range
        }
        set {
            Random.percentage.range = newValue
        }
    }
    /// A configuration object for `random-swift`.
    public static var config: RandomConfig {
        get {
            return RandomConfig.shared
        }
        set {
            RandomConfig.shared = newValue
        }
    }
    /// A random word from the built-in dictionary of words in macOS.
    ///
    /// - Note: This is disabled in release builds by default. To enable, use
    /// `Random.config.enableWordsForRelease`.
    ///
    public static var word: String {
        get {
            return Language.shared.words[Random.int.withinRange(IntRange(lower: 0, upper: Language.shared.words.count))]
        }
    }
}
