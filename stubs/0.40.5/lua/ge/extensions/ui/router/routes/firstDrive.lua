---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/firstDrive.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Routes of the guided first drive (Vue): introduction, onboarding, arrival, completion, recovery, learning areas. Back is locked (`firstDriveLockedHandler`) except onboarding (previousRouteBackHandler). The onMount/onEnter/onLeave hooks call gameplay_discover_firstDrive_experience.
--- Access: extension `ui_router_routes_firstDrive`: `extensions.load("ui_router_routes_firstDrive")`, then the global `ui_router_routes_firstDrive`
---@class ui_router_routes_firstDrive
---@field Children table<string, table> onboarding (infoBar visible), arrival, completion (dedicated onMount, locked back), recovery (backTarget play, onLeave onFirstDriveRecoveryRouteLeave), learning (backTarget pause, dedicated onEnter/onLeave, triggerPause = true, scope first-drive-learning-areas).
---@field ModuleName string Name of the routes module (first segment of the dotted name).
---@field Root table {screenId = "firstDrive", onMount = "gameplay_discover_firstDrive_experience.onFirstDriveRouteMount", back = handler firstDriveLockedHandler, scopeTree first-drive-intro, ui = Vue, bars hidden, uiApps hidden, triggerPause = false}
ui_router_routes_firstDrive = {}

