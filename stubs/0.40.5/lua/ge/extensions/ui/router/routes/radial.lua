---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/radial.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Routes du menu radial (Vue). La racine « radial » appelle core_quickAccess.endRouteHandoff à l'entrée (fin du transfert de route en cours, réaffiche le menu) et a un retour géré par `radialBackHandler`. Enfant : mirrors (réglage des rétroviseurs, retour vers radial).
--- Accès : extension `ui_router_routes_radial` : `extensions.load("ui_router_routes_radial")`, puis la globale `ui_router_routes_radial`
---@class ui_router_routes_radial
---@field Children table<string, table> mirrors (screenId radial.mirrors, titre ui.mirrors.name, backTarget radial).
---@field Root table {screenId = "radial", onEnter = "core_quickAccess.endRouteHandoff", back = handler radialBackHandler, ui = Vue, infoBar par défaut, topBar masquée}
ui_router_routes_radial = {}

