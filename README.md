# Word Swapper

A macOS app built with SwiftUI that lets you replace words or phrases in song lyrics in bulk.

## How it works

1. Paste your song lyrics into the text area
2. Add one or more find/replace pairs (snippets)
3. Enter the song name and hit **Apply** — all replacements are applied at once and the result replaces the lyrics in the text area

## Views

| View | Description |
|------|-------------|
| `InputView` | Text area where the user pastes the original lyrics |
| `ChangeView` | Lists all the snippet pairs added so far |
| `ActionView` | Song name field and the Add / Apply action buttons |
| `SnippetComponent` | A single row showing an original and modified snippet pair |

## ViewModel

`WordSwapperViewModel` holds all the app state using the `@Observable` macro.

### Properties

| Property | Type | Description |
|----------|------|-------------|
| `lyrics` | `String` | The current lyrics text |
| `songName` | `String` | Name of the song, prepended to the output |
| `originalSnippet` | `String` | The text to find (staging field) |
| `modifiedSnippet` | `String` | The replacement text (staging field) |
| `changes` | `[(original, modified)]` | List of all pending find/replace pairs |

### Methods

| Method | Description |
|--------|-------------|
| `addChange()` | Appends the current `originalSnippet`/`modifiedSnippet` pair to `changes` and clears the staging fields |
| `apply()` | Runs all replacements against `lyrics`, prepends the song name, then clears `changes` |
| `clearChanges()` | Removes all pending changes without applying them |

## Requirements

- macOS 14+ (uses `@Observable` from the Observation framework)
- Xcode 15+
