//
//  WordSwapperViewModel.swift
//  Word Swapper
//
//  Created by Jacó Alves on 25/04/26.
//

import Foundation
import Observation

// Change struct to make it mutable and identifiable
struct Change: Identifiable {
    let id = UUID()
    var original: String
    var modified: String
}

@Observable
class WordSwapperViewModel {
    // All the data your app needs
    var lyrics: String = ""
    var songName: String = ""
    var originalSnippet: String = ""
    var modifiedSnippet: String = ""
    var changes: [Change] = []
    
    // Add a new change to the list
    func addChange() {
        guard !originalSnippet.isEmpty && !modifiedSnippet.isEmpty else {
            return
        }
        
        changes.append(Change(original: originalSnippet, modified: modifiedSnippet))
        
        // Clear the fields after adding
        originalSnippet = ""
        modifiedSnippet = ""
    }
    
    // Remove a change at specific index
    func removeChange(at index: Int) {
        guard index >= 0 && index < changes.count else { return }
        changes.remove(at: index)
    }
    
    // Apply all changes to the lyrics
    func apply() {
        var result = lyrics

        for change in changes {
            result = result.replacingOccurrences(
                of: change.original,
                with: change.modified
            )
        }
        
        lyrics = "\(songName)\n\n\(result)"
        
        // Optionally clear changes after applying
        changes.removeAll()
    }
    
    func clearChanges() {
        changes.removeAll()
    }
}
