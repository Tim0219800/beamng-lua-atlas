---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/garage.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Garage routes (Vue): overview, vehicle (selector, tuning and mirrors, paint, parts, configuration save), vehicle list, "mycars", photo mode and overlay editing. Root hook: gameplay_garageMode.onGarageEnter. Dynamic vehicle titles via gameplay_garageMode.vehicleByIdOrActive.
--- Access: extension `ui_router_routes_garage`: `extensions.load("ui_router_routes_garage")`, then the global `ui_router_routes_garage`
---@class ui_router_routes_garage
---@field Children table<string, table> vehicle (abstract; selector, tuning > mirrors, paint, parts, save), vehicles (> vehicle), mycars (> vehicle), photomode (exitGuards confirmPhotomodeExit; > overlay > edit > adjust).
---@field ModuleName string Name of the routes module (first segment of the dotted name).
---@field Root table {screenId = "garage", title = "Garage", scopeTree garage-layout > garage-sidemenu, ui = Vue, infoBar visible without system info, topBar and uiApps hidden, onEnter = gameplay_garageMode.onGarageEnter}
ui_router_routes_garage = {}

