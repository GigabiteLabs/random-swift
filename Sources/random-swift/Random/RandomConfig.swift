// RandomConfig.swift
//
// Created by GigabiteLabs on 7/7/20
// Swift Version: 5.0
// Copyright © 2020 GigabiteLabs. All rights reserved.
//

import Foundation

/// A configuration object for `random-swift`.
public class RandomConfig {
    /// An internally shared instance. Overridable by setting
    /// `Random.config = newRandomConfig`
    internal static var shared = RandomConfig()
    /// Enables public init of new config object.
    public init() { }
    /// Enables `Random.word` in release builds.
    /// Default is false.
    ///
    /// - Note: The total memory footprint of the word dictionary
    /// is ~3mb, so be sure you want to enable the extra overhead
    /// for release builds.
    public var enableWordsForRelease: Bool {
        get {
            return Language.shared.enableWordsInRelease
        }
        set {
            Language.shared.enableWordsInRelease = newValue
        }
    }
}
