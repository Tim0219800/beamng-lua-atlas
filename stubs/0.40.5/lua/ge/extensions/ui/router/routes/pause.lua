---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/pause.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Pause menu routes (Vue), the largest module: root pause screen (back via pauseExitHandler) with left/right/bottom rails, then system, hudApps (layout editor), career (branches, missions, history, logbook), milestones, vehicleDetails, multiseat (settings, game modes, vehicle selector), vehicleSelector, stats, vehicle (combined configuration, save, mirrors, selector, details), manageVehicles, photomode (overlay > edit > adjust), freeroamselector, environment, replay, plus included subtrees (mods, bigmap, options, multiplayer, freeroamLevels). Almost all children use the hooks ui_pause_routeLifecycleCallbacks.onPauseEnter/onPauseMount/onPauseLeave.
--- Access: extension `ui_router_routes_pause`: `extensions.load("ui_router_routes_pause")`, then the global `ui_router_routes_pause`
---@class ui_router_routes_pause
---@field Children table<string, table> See the module summary. Includes: mods (with backTarget pause.system and modsPauseLifecycle on each child), bigmap (onLeave onPauseBigmapLeave), options, multiplayer, freeroamLevels.
---@field ModuleName string Name of the routes module (first segment of the dotted name).
---@field Root table {screenId = "pause", title = "ui.environment.pause", back = handler pauseExitHandler, hooks onPauseEnter/Mount/Leave, targetScope "pause-left-rails", scopeTree pause-root > (pause-left-rails, pause-right-rails, pause-bottom-rails, menu-content-card-1), ui = Vue only, topBar hidden}
ui_router_routes_pause = {}

