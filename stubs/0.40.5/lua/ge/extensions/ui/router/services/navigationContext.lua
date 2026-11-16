---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/services/navigationContext.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Builds the UI router navigation context: a snapshot of the game state (career, garage, mission, scenario, multiplayer, multiseat, first drive, freeroam tutorial, big map allowed or not) and the current mode. Each read is protected by pcall, so a missing game module simply gives false/nil. Used for route decisions (screens, context decorators).
--- Access: extension `ui_router_services_navigationContext`: `extensions.load("ui_router_services_navigationContext")`, then the global `ui_router_services_navigationContext`
---@class ui_router_services_navigationContext
ui_router_services_navigationContext = {}

--- Extends getContext() with the navigation kind, extras and {name, params, meta} summaries of the destination and source routes.
---Source: lua/ge/extensions/ui/router/services/navigationContext.lua:77
---@param toRoute table|nil Destination route.
---@param fromRoute table|nil Origin route.
---@param kind string Kind of navigation (inferred from code: passed through as is in context.kind).
---@param extras table|nil Extra data (default {}).
---@return table  Context with kind, extras, toRoute, fromRoute.
function ui_router_services_navigationContext.buildNavigationContext(toRoute, fromRoute, kind, extras) end

--- Returns the context table: isCareerActive, isGarageActive, isMissionActive, isScenarioActive, isMultiplayerActive, foregroundMissionId, isBigMapBlocked, isBigMapAllowed, isFreeroamTutorialActive, isFirstDriveActive, isFirstDriveGuided, isMultiseatGamemodeActive, isMultiseatActive, mode.
---Source: lua/ge/extensions/ui/router/services/navigationContext.lua:31
---@return table  Current context.
function ui_router_services_navigationContext.getContext() end

