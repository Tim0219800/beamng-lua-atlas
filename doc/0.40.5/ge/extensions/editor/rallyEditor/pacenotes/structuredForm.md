# `editor_rallyEditor_pacenotes_structuredForm`

*File: `lua/ge/extensions/editor/rallyEditor/pacenotes/structuredForm.lua` · VM: Game Engine (GE) · 1037 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_rallyEditor_pacenotes_structuredForm`: `extensions.load("editor_rallyEditor_pacenotes_structuredForm")`, then the global `editor_rallyEditor_pacenotes_structuredForm`

"Structured" editing form of a pacenote in the rally editor. It displays a preview of the text and audio files, then the sections Caution, Modifiers Before (preMod1/preMod2), Corner (intensity descriptor, direction, shape, signed steps, length mode, slow corner release type), Modifiers After (postMod1/postMod2) and Distance. Modifiers are chosen by menu or by text search, with a list of the most recently used (10 max). The options come from the notebook's text composer configuration. Used by pacenoteForm.

## Notes

- The configuration (types, modifiers, shapes, descriptors) is loaded at the first draw after a clear().
- Call clear() when the displayed pacenote changes, otherwise the form keeps the old one's data.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_rallyEditor_pacenotes_structuredForm.clear()` | Resets the form's internal state (configuration, options, search states, active window). | 1022 |
| `editor_rallyEditor_pacenotes_structuredForm.draw(pacenote, pacenoteToolsWindow)` | Draws the whole structured form for the given pacenote (loads the configuration if needed). | 989 |

### Parameter details

#### `editor_rallyEditor_pacenotes_structuredForm.draw(pacenote, pacenoteToolsWindow)`

Draws the whole structured form for the given pacenote (loads the configuration if needed).

- `pacenote` (*table*) : Pacenote being edited.
- `pacenoteToolsWindow` (*table*) : Pacenote tools window, stored for refreshes.

## Calls into the engine (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/rallyEditor/pacenotes/structuredForm.lua`.*
