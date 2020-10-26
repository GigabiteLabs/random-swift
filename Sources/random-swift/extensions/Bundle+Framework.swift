// File.swift
//
// Created by GigabiteLabs on 10/2/20
// Swift Version: 5.0
// Copyright © 2020 GigabiteLabs. All rights reserved.
//

import Foundation

/// An extension for `Bundle` to enable easy &
/// correct referencing of the `Bundle` for a framework, when a
/// resource is needed from within the framework vs main (or other framework) bundle.
public extension Bundle {
    /// A computed property representing the bundle for the framework.
    /// Accessing this property automatically determines the type
    /// of dependency manager used, either SwiftPM or Cocoapods.
    ///
    ///
    /// - Precondition: Your project incorporates the framework
    /// using either SwiftPM or Cocoapods.
    ///
    /// - Warning: If your project does not use SwiftPM or Cocoapods to import
    /// the framework, this property will return `nil` and some bundles resources
    /// may fail to load.
    ///
    static var framework: Bundle? = {
        #if COCOAPODS
        return Bundle.pod!
        #elseif SPM
        return Bundle.spm!
        #endif
    }()
    /// A computed property representing the correct`Bundle` when the
    /// framework is imported using **Swift Package Manager**.
    ///
    /// - Precondition: Your project incorporates the framework
    /// using Cocoapods.
    ///
    /// - Warning: If your project does not use **SwiftPM** for the
    /// framework, this will return `nil` and some bundles resources
    /// may fail to load.
    ///
    static let spm: Bundle? = {
        #if SPM
        return Bundle.module
        #else
        return nil
        #endif
    }()
    /// A computed property representing the correct `Bundle` when the
    /// framework is imported using **Cocoapods**.
    ///
    /// - Precondition: Your project incorporates the framework
    /// using Cocoapods.
    ///
    /// - Warning: If your project does not use **Cocoapods** for the
    /// framework, this will return `nil` and some bundle resources
    /// may fail to load.
    ///
    static let pod: Bundle? = {
        #if !COCOAPODS
        return nil
        #else
        let baseBundle = Bundle(for: Language.self)
        print("base bundlePath: \(baseBundle.bundlePath)")
        return baseBundle
        #endif
    }()
    /// An accessor function for acessing `resourceBundles` within a
    /// Cococapod framework.
    ///
    /// - Precondition: Your project incorporates the framework
    /// using Cocoapods, and the framework uses resourceBundles within
    /// the framework podspec.
    ///
    /// - Warning: If your project does not use **Cocoapods** for the
    /// framework or resourceBundles, this will return `nil` and some
    /// bundle resources may fail to load.
    ///
    static func podResourceBundle(_ name: String) -> Bundle? {
        #if !COCOAPODS
        return nil
        #else
        let baseBundle = Bundle(for: Language.self)
        return Bundle(path: baseBundle.bundlePath + "/\(name).bundle")!
        #endif
    }
}
