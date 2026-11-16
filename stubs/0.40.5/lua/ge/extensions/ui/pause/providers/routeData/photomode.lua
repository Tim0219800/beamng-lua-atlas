---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/providers/routeData/photomode.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Pause menu data provider for the photo mode page. It returns the payload provided by ui_pause_photomode.getRoutePayload(), or failing that a fallback payload (contractVersion 6) where all sections and functions are disabled (camera, scene, effects, capture, upload, Steam, etc.) and where supersampling is 1 with limits from 1 to 24.
--- Access: extension `ui_pause_providers_routeData_photomode`: `extensions.load("ui_pause_providers_routeData_photomode")`, then the global `ui_pause_providers_routeData_photomode`
---@class ui_pause_providers_routeData_photomode
---@field dependencies string[] {"ui_pause_photomode"}
ui_pause_providers_routeData_photomode = {}

--- Returns {mainPanelContent = {}, photomode = payload}, where payload comes from ui_pause_photomode.getRoutePayload() if available, otherwise the fallback payload.
---Source: lua/ge/extensions/ui/pause/providers/routeData/photomode.lua:133
---@return table  Photomode route data.
function ui_pause_providers_routeData_photomode.getPhotomodeData() end

