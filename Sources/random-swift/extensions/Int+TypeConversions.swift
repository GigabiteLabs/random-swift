// Int+TypeConversions.swift
//
// Created by GigabiteLabs on 7/2/20
// Swift Version: 5.0
// Copyright © 2020 GigabiteLabs. All rights reserved.
//

import Foundation
#if canImport(UIKit)
import UIKit
#endif

/// An extension for `Int` to allow easy conversion to other formats / values
extension Int {
    /// Returns value converted to `CGFloat`.
    public var cgFloatValue: CGFloat {
        return CGFloat(self)
    }
    /// Returns value converted to `Double`.
    public var doubleValue: Double {
        return Double(self)
    }
}
