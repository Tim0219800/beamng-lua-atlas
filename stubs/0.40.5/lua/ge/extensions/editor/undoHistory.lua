---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/undoHistory.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor window "Undo History": shows side by side the undo stack (editor.history.undoStack) and the redo stack (redoStack). Each action is listed with its name; a tooltip shows a truncated dump of the action (20 lines of 100 characters max). Buttons "Undo Selected", "Redo Selected" (call editor.undo / editor.redo with the number of steps) and "Delete All History" (editor.clearUndoHistory, without undoing the changes).
--- Access: extension `editor_undoHistory`: `extensions.load("editor_undoHistory")`, then the global `editor_undoHistory`
---@class editor_undoHistory
editor_undoHistory = {}

--- Hook called every editor frame: draws the Undo History window with the two stacks.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/undoHistory.lua:34
function editor_undoHistory.onEditorGui() end

--- Hook called at editor initialization: adds the "Undo History" menu entry and registers the window (initial size 300x500).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/undoHistory.lua:88
function editor_undoHistory.onEditorInitialized() end

--- Hook called when the extension loads; does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/undoHistory.lua:85
function editor_undoHistory.onExtensionLoaded() end

