// Double+RoundToPlaces.swift
//
// Created by GigabiteLabs on 7/2/20
// Swift Version: 5.0
// Copyright © 2020 GigabiteLabs. All rights reserved.
//

import Foundation
#if canImport(UIKit)
import UIKit
#endif

/// An extension for `Double` to allow easy conversion to other formats / values
extension Double {
    /// Rounds the double to decimal places value
    internal func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    /// Returns value converted to `CGFloat`.
    public var cgFloatValue: CGFloat {
        return CGFloat(self)
    }
    /// Returns value converted to `Int`.
    public var intValue: Int {
        return Int(self)
    }
}
