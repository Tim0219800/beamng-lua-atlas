# `editor_toolShortcuts`

*File: `lua/ge/extensions/editor/toolShortcuts.lua` · VM: Game Engine (GE) · 182 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolShortcuts`: `extensions.load("editor_toolShortcuts")`, then the global `editor_toolShortcuts`

Editor 'Edit Mode Shortcuts' window: lets you assign an edit mode (editor.editModes) to each of the keys F2 to F10 (9 slots). The assignments are read/written in settings/editor/editModeShortcuts.json. Without a file, the defaults are objectSelect, createObject then the modes with an icon sorted by key name. The extension also creates editor.openTool1 ... editor.openTool9 which activate the assigned mode.

## Notes

- The JSON file stores the keys "F2" to "F10"; an empty string means 'None'.
- Only modes that have an icon (mode.icon) can be assigned.
- The first modification creates the custom assignments from the defaults.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolShortcuts.onEditorGui()` | Editor render hook: draws, for each key F2-F10, the mode icon, a search combo to choose the mode, and the 'Reset to Defaults' button. *(internal)* *(hook)* | 112 |
| `editor_toolShortcuts.onEditorInitialized()` | Editor initialization hook: loads the assignments, registers the window (380x380) and defines editor.openTool1...openTool9. *(internal)* *(hook)* | 167 |
| `editor_toolShortcuts.openWindow()` | Shows the 'Edit Mode Shortcuts' window (editor.showWindow). | 108 |

## Calls into the engine (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolShortcuts.lua`.*
