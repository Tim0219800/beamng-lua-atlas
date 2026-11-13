---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/bigmap.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Routes de la grande carte (Vue) : écran « bigmap » (titre Map) avec une sous-route bigmapMenu. Arbre de portées (scopes) de navigation manette : bigmap-layout contient bigmap-camera et bigmap-main, qui contient bigmap-details. Inclus par d'autres modules (ex. pause.bigmap).
--- Accès : extension `ui_router_routes_bigmap` : `extensions.load("ui_router_routes_bigmap")`, puis la globale `ui_router_routes_bigmap`
---@class ui_router_routes_bigmap
---@field Children table<string, table> Enfant « bigmapMenu » (screenId bigmap.bigmapMenu, Vue).
---@field Root table {screenId = "bigmap", title = "Map", targetScope = "bigmap-main", scopeTree = bigmap-layout > (bigmap-camera, bigmap-main > bigmap-details), ui = Vue uniquement, infoBar par défaut, topBar masquée, uiApps par défaut}
ui_router_routes_bigmap = {}

