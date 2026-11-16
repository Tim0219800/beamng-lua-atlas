---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/levelSettings.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Minimal editor extension: registers an inspector handler for the "level_settings" selection type (which only displays the text "Level Settings") and adds editor.showLevelSettings() to select this pseudo-object.
--- Access: extension `editor_levelSettings`: `extensions.load("editor_levelSettings")`, then the global `editor_levelSettings`
---@class editor_levelSettings
editor_levelSettings = {}

--- Called when the editor is activated: registers the "level_settings" inspector type and defines editor.showLevelSettings.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/levelSettings.lua:21
function editor_levelSettings.onEditorActivated() end

--- Called when the editor is deactivated: removes the "level_settings" inspector type.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/levelSettings.lua:26
function editor_levelSettings.onEditorDeactivated() end

--- Hook called when the extension loads. Empty body.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/levelSettings.lua:13
function editor_levelSettings.onExtensionLoaded() end

