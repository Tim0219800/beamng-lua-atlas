---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/mods.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Routes du gestionnaire de mods (interface Angular héritée) : local, downloaded, scheduled, repository, automation, automationDetails, details, tous avec un screenId « menu.mods.* ». Module abstrait inclus par menu.lua et pause.lua (pause y ajoute les hooks de pause).
--- Accès : extension `ui_router_routes_mods` : `extensions.load("ui_router_routes_mods")`, puis la globale `ui_router_routes_mods`
---@class ui_router_routes_mods
---@field Children table<string, table> local, downloaded, scheduled, repository, automation, automationDetails, details.
---@field ModuleName string Nom du module de routes (premier segment du nom pointé).
---@field Root table {screenId = "menu.mods", abstract = true, ui = Angular uniquement}
ui_router_routes_mods = {}

