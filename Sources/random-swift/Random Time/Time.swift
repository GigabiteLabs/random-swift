// Time.swift
//
// Created by GigabiteLabs
// Swift Version: 5.0
// Copyright © 2023 GigabiteLabs. All rights reserved.
//

import Foundation

internal class RSTime {
    /// Internal shared instance of ``Time``.
    internal static let shared = RSTime()
    /// Private init to ensure only one instance
    private init() {}
    
    internal var date: RSCalendarDate {
        return RSCalendarDate()
    }
}
