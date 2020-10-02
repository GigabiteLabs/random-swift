// PercentageRange.swift
//
// Created by GigabiteLabs on 7/2/20
// Swift Version: 5.0
// Copyright © 2020 GigabiteLabs. All rights reserved.
//

import Foundation

/// A configuration object used to define range boundaries
/// for use during random value generation.
public struct PercentageRange {
    /// The minimum allowable return value.
    public var min: Double
    /// The maximum allowable return value.
    public var max: Double
    /// Initializes a `PercentageRange` object with min and max values.
    public init(min: Double, max: Double){
        self.min = min
        self.max = max
    }
}
