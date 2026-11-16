---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/legal.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Legal routes (Vue, abstract): online consent wizard in three steps onlineFeatures -> telemetry -> confirmation, each step having the exit guard `onlineConsentSet` and keeping the gamepad help bar.
--- Access: extension `ui_router_routes_legal`: `extensions.load("ui_router_routes_legal")`, then the global `ui_router_routes_legal`
---@class ui_router_routes_legal
---@field Children table<string, table> onlineFeatures (no backTarget), telemetry (back to onlineFeatures), confirmation (back to telemetry); default infoBar restored for the gamepad.
---@field ModuleName string Name of the routes module (first segment of the dotted name).
---@field Root table {abstract = true, ui = Vue only, infoBar and topBar hidden, default uiApps}
ui_router_routes_legal = {}

