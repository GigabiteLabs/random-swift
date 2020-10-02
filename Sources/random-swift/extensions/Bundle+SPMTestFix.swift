// File.swift
//
// Created by GigabiteLabs on 10/2/20
// Swift Version: 5.0
// Copyright © 2020 GigabiteLabs. All rights reserved.
//

import Foundation

extension Bundle {
    static let test: Bundle = {
        let baseBundle = Bundle(for: Language.self)
        return Bundle(path: baseBundle.bundlePath + "/../random-swift_tests_random-swift_tests.bundle")!
    }()
}
