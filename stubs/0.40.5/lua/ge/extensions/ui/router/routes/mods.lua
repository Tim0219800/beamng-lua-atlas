---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/mods.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mod manager routes (legacy Angular interface): local, downloaded, scheduled, repository, automation, automationDetails, details, all with a "menu.mods.*" screenId. Abstract module included by menu.lua and pause.lua (pause adds the pause hooks there).
--- Access: extension `ui_router_routes_mods`: `extensions.load("ui_router_routes_mods")`, then the global `ui_router_routes_mods`
---@class ui_router_routes_mods
---@field Children table<string, table> local, downloaded, scheduled, repository, automation, automationDetails, details.
---@field ModuleName string Name of the routes module (first segment of the dotted name).
---@field Root table {screenId = "menu.mods", abstract = true, ui = Angular only}
ui_router_routes_mods = {}

