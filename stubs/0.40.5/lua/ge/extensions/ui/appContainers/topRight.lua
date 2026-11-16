---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/appContainers/topRight.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Declares the "topRight" app container (top-right corner of the interface) with ui_appContainers, with the UI trigger setTopRightAppVisibility. The app list is empty in 0.40.5: the container exists but manages no app.
--- Access: extension `ui_appContainers_topRight`: `extensions.load("ui_appContainers_topRight")`, then the global `ui_appContainers_topRight`
---@class ui_appContainers_topRight
---@field dependencies table<integer, string> { "ui_appContainers" }: loaded before this module.
ui_appContainers_topRight = {}

--- Called when the extension loads: registers the topRight container (no apps) via ui_appContainers.registerContainer.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/appContainers/topRight.lua:8
function ui_appContainers_topRight.onExtensionLoaded() end

