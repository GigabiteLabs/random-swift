// Words.swift
//
// Created by GigabiteLabs on 7/7/20
// Swift Version: 5.0
// Copyright © 2020 GigabiteLabs. All rights reserved.
//

import Foundation

/// An internal class for handling and formatting random language-related generators.
internal class Language {
    /// An internal var containing all
    internal var words: [String] = ["::error:: words are not enabled in release builds by default"]
    /// An internal static instance of `Language`
    internal static let shared = Language()
    /// An internal flag set through `RandomConfig.shared` to
    /// enable / disable Random.word in release builds.
    internal var enableWordsInRelease = false
    /// Initializes the array of possible words
    internal init(){
        setupWords()
    }
    /// Sets up `Language.shared.words` as a componentized array from words.txt.
    internal func setupWords() {
        // guard against auto setup in release builds
        #if RELEASE
        if !RandomConfig.enableWordsForRelease {
            return
        }
        #endif
        
        guard let fwBundle = Bundle.framework else {
            words = ["::error:: cannot get bundle"]
            return
        }
        // read path
        guard let contentPath = fwBundle.path(forResource: "words", ofType: "txt") else {
            words = ["::error:: content path is invalid."]
            return
        }
        // attempt to extract all words as component array
        do {
            words = try String(contentsOfFile: contentPath).components(separatedBy: .newlines)
        } catch {
            words = ["::error:: \(error)"]
        }
    }
}
