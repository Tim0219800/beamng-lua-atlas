---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/default.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module de routes par défaut, abstrait, qui définit la configuration `ui` d'écrans de base : mapview (Angular), options (Vue, infoBar par défaut), play (Angular, uiApps visibles) et radial (Vue).
--- Accès : extension `ui_router_routes_default` : `extensions.load("ui_router_routes_default")`, puis la globale `ui_router_routes_default`
---@class ui_router_routes_default
---@field Children table<string, table> mapview, options, play, radial : chacun ne définit que son bloc `ui` (uiTypes, uiTypesFilter = only, infoBar, topBar, uiApps).
---@field ModuleName string Nom du module de routes (premier segment du nom pointé).
---@field Root table {abstract = true}
ui_router_routes_default = {}

