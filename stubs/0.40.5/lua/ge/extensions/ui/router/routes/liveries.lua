---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/liveries.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Routes de l'éditeur de livrées (Vue) : liste (liveries), édition (liveries.edit), peinture (liveries.edit.paint) et décalcomanies (inclut le module decals). Hooks : ui_liveries_routeLifecycleCallbacks.onLiveriesEnter / onLiveriesEditEnter / onLiveriesPaintEnter / onLiveriesLeave / onLiveriesRootLeave.
--- Accès : extension `ui_router_routes_liveries` : `extensions.load("ui_router_routes_liveries")`, puis la globale `ui_router_routes_liveries`
---@class ui_router_routes_liveries
---@field Children table<string, table> edit (backTarget liveries ; enfants paint et decals = include du module decals).
---@field ModuleName string Nom du module de routes (premier segment du nom pointé).
---@field Root table {screenId = "liveries", title = "ui.liveries.title", Vue uniquement, infoBar par défaut, topBar masquée, onEnter onLiveriesEnter, onLeave onLiveriesRootLeave}
ui_router_routes_liveries = {}

