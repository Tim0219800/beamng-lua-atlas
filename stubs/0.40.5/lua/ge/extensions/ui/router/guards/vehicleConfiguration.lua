---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/guards/vehicleConfiguration.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Exit guard "confirmVehicleConfigurationCombinedExit": delegates to ui_pause_vehicleConfigurationGuard.confirmExit(route, params, context) the exit confirmation of the vehicle configuration screen; allows if this module is not loaded.
--- Access: extension `ui_router_guards_vehicleConfiguration`: `extensions.load("ui_router_guards_vehicleConfiguration")`, then the global `ui_router_guards_vehicleConfiguration`
---@class ui_router_guards_vehicleConfiguration
---@field guards table<string, function> Table of exposed guards: {confirmVehicleConfigurationCombinedExit = function(route, params, context)}.
ui_router_guards_vehicleConfiguration = {}

