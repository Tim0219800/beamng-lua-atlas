---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/groundModelDebugHelper.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Adds to the editor the menu entry Window > Debug > "GroundModel Debug", which opens the window of the util_groundModelDebug extension (extensions.util_groundModelDebug.openWindow()).
--- Access: extension `editor_groundModelDebugHelper`: `extensions.load("editor_groundModelDebugHelper")`, then the global `editor_groundModelDebugHelper`
---@class editor_groundModelDebugHelper
editor_groundModelDebugHelper = {}

--- Hook called at editor initialization: adds the "GroundModel Debug" menu entry (Debug group).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/groundModelDebugHelper.lua:11
function editor_groundModelDebugHelper.onEditorInitialized() end

