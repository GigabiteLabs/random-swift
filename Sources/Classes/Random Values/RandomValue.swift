// RandomValue.swift
//
// Created by GigabiteLabs on 7/2/20
// Swift Version: 5.0
// Copyright © 2020 GigabiteLabs. All rights reserved.
//

import Foundation

/// A subclass for sharing utility functions between random value generator classes.
public class RandomValue {
    /// Util for `arc4random` generation and conversion to `Int`.
    internal func randomInt() -> Int {
        return Int(arc4random())
    }
}
