# `editor_undoHistory`

*File: `lua/ge/extensions/editor/undoHistory.lua` · VM: Game Engine (GE) · 97 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_undoHistory`: `extensions.load("editor_undoHistory")`, then the global `editor_undoHistory`

Editor window "Undo History": shows side by side the undo stack (editor.history.undoStack) and the redo stack (redoStack). Each action is listed with its name; a tooltip shows a truncated dump of the action (20 lines of 100 characters max). Buttons "Undo Selected", "Redo Selected" (call editor.undo / editor.redo with the number of steps) and "Delete All History" (editor.clearUndoHistory, without undoing the changes).

## Notes

- The window is called "undoHistory" and is opened via the menu Window > Undo History.
- The selected indices (selectedIndex, selectedIndex2) are local variables of the module, not exported.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_undoHistory.onEditorGui()` | Hook called every editor frame: draws the Undo History window with the two stacks. *(internal)* *(hook)* | 34 |
| `editor_undoHistory.onEditorInitialized()` | Hook called at editor initialization: adds the "Undo History" menu entry and registers the window (initial size 300x500). *(internal)* *(hook)* | 88 |
| `editor_undoHistory.onExtensionLoaded()` | Hook called when the extension loads; does nothing. *(internal)* *(hook)* | 85 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/undoHistory.lua`.*
