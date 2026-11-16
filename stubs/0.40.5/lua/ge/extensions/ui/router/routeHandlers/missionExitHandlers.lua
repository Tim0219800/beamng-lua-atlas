---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routeHandlers/missionExitHandlers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Exit/back handlers of the mission and pause screens. When a mission start/end screen is active, they send back to the "mission.control" route with the matching mode; otherwise to the gameplay route (ui_menuManager.getGameplayRoute(), "play" by default).
--- Access: extension `ui_router_routeHandlers_missionExitHandlers`: `extensions.load("ui_router_routeHandlers_missionExitHandlers")`, then the global `ui_router_routeHandlers_missionExitHandlers`
---@class ui_router_routeHandlers_missionExitHandlers
ui_router_routeHandlers_missionExitHandlers = {}

--- Leaves the mission details: if a mission is active and a start/end screen is displayed, navigates to mission.control with {mode = screen mode}; otherwise to the gameplay route.
---Source: lua/ge/extensions/ui/router/routeHandlers/missionExitHandlers.lua:11
---@return table|nil  Result of navigate in the mission.control case; nil otherwise (navigation is started without returning its result).
function ui_router_routeHandlers_missionExitHandlers.missionDetailsExitHandler() end

--- Back from the mission vehicle selector: same logic as pauseExitHandler.
---Source: lua/ge/extensions/ui/router/routeHandlers/missionExitHandlers.lua:35
---@return table  Result of ui_router.navigate.
function ui_router_routeHandlers_missionExitHandlers.missionVehicleSelectorBackHandler() end

--- Leaves the pause: navigates to mission.control {mode} if a mission start/end screen is active, otherwise to the gameplay route.
---Source: lua/ge/extensions/ui/router/routeHandlers/missionExitHandlers.lua:24
---@return table  Result of ui_router.navigate.
function ui_router_routeHandlers_missionExitHandlers.pauseExitHandler() end

