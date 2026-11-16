---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/appContainers/topLeft.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Declares the "topLeft" app container (top-left corner of the interface) with ui_appContainers. The UI trigger is setTopLeftAppVisibility. Declared apps: messages and tasks (visible by default), scoreboard, driftScores, dragInfo and dragDialControl (hidden by default).
--- Access: extension `ui_appContainers_topLeft`: `extensions.load("ui_appContainers_topLeft")`, then the global `ui_appContainers_topLeft`
---@class ui_appContainers_topLeft
---@field dependencies table<integer, string> { "ui_appContainers" }: loaded before this module.
ui_appContainers_topLeft = {}

--- Called when the extension loads: registers the topLeft container via ui_appContainers.registerContainer.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/appContainers/topLeft.lua:8
function ui_appContainers_topLeft.onExtensionLoaded() end

