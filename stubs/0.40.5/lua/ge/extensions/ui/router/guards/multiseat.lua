---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/guards/multiseat.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Exit guard "confirmMultiseatSettingsExit": when leaving the multi-seat settings screen, delegates the confirmation to ui_multiseat_multiseatSettings.confirmExit(route, params, context). Moves between pause.multiseatSettings and pause.multiseatSettings.vehicleSelector stay in the flow and are allowed; if ui_multiseat_multiseatSettings is not loaded, the exit is allowed.
--- Access: extension `ui_router_guards_multiseat`: `extensions.load("ui_router_guards_multiseat")`, then the global `ui_router_guards_multiseat`
---@class ui_router_guards_multiseat
---@field guards table<string, function> Table of exposed guards: {confirmMultiseatSettingsExit = function(route, params, context)}.
ui_router_guards_multiseat = {}

