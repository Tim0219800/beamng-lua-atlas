---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolShortcuts.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor 'Edit Mode Shortcuts' window: lets you assign an edit mode (editor.editModes) to each of the keys F2 to F10 (9 slots). The assignments are read/written in settings/editor/editModeShortcuts.json. Without a file, the defaults are objectSelect, createObject then the modes with an icon sorted by key name. The extension also creates editor.openTool1 ... editor.openTool9 which activate the assigned mode.
--- Access: extension `editor_toolShortcuts`: `extensions.load("editor_toolShortcuts")`, then the global `editor_toolShortcuts`
---@class editor_toolShortcuts
editor_toolShortcuts = {}

--- Editor render hook: draws, for each key F2-F10, the mode icon, a search combo to choose the mode, and the 'Reset to Defaults' button.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/toolShortcuts.lua:112
function editor_toolShortcuts.onEditorGui() end

--- Editor initialization hook: loads the assignments, registers the window (380x380) and defines editor.openTool1...openTool9.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/toolShortcuts.lua:167
function editor_toolShortcuts.onEditorInitialized() end

--- Shows the 'Edit Mode Shortcuts' window (editor.showWindow).
---Source: lua/ge/extensions/editor/toolShortcuts.lua:108
function editor_toolShortcuts.openWindow() end

