//
//  WordSwapperViewModel.swift
//  Word Swapper
//
//  Created by Jacó Alves on 25/04/26.
//

import Foundation
import Observation

@Observable
class WordSwapperViewModel {
    // All the data your app needs
    var lyrics: String = ""
    var songName: String = ""
    var originalSnippet: String = ""
    var modifiedSnippet: String = ""
    var changes: [(original: String, modified: String)] = []
    
    // Add a new change to the list
    func addChange() {
        guard !originalSnippet.isEmpty && !modifiedSnippet.isEmpty else {
            return
        }
        
        changes.append((original: originalSnippet, modified: modifiedSnippet))
        
        // Clear the fields after adding
        originalSnippet = ""
        modifiedSnippet = ""
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
