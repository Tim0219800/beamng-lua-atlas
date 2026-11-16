---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/logHelper.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor extension that displays in the editor's main menu bar the error counter (red, suffix E) and warning counter (yellow, suffix W) of the development log, via Lua:getDevLogStats().
--- Access: extension `editor_logHelper`: `extensions.load("editor_logHelper")`, then the global `editor_logHelper`
---@class editor_logHelper
editor_logHelper = {}

--- Main menu bar draw hook. Writes "LogStats:" then the number of errors and warnings if they are greater than 0. Does nothing if Lua.getDevLogStats does not exist.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/logHelper.lua:9
---@param windowSize table Window size (unused: the SameLine line is commented out).
function editor_logHelper.onEditorMainMenuBar(windowSize) end

