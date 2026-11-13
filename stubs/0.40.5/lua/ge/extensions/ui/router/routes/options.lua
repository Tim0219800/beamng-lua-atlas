---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/options.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Routes des options (Vue) : racine « options » (repli vers menu via fallbackTarget) avec infoBar sans info système, et enfant category (screenId pause.options.category, topBar masquée). Les écrans d'options détaillés se trouvent dans menu.options.* et pause.options.
--- Accès : extension `ui_router_routes_options` : `extensions.load("ui_router_routes_options")`, puis la globale `ui_router_routes_options`
---@class ui_router_routes_options
---@field Children table<string, table> category.
---@field ModuleName string Nom du module de routes (premier segment du nom pointé).
---@field Root table {screenId = "options", title = "Options", fallbackTarget = "menu", ui = Vue uniquement, infoBar visible sans info système, topBar masquée, uiApps masquées}
ui_router_routes_options = {}

