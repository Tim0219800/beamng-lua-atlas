---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/multiseat.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Route racine du mode multiseat (plusieurs joueurs sur un écran, Vue) : écran « multiseat » (titre ui.multiseat.title), sortie par rootExit, navigation UI désactivée (uiNav = false), barres et apps masquées. Aucun enfant.
--- Accès : extension `ui_router_routes_multiseat` : `extensions.load("ui_router_routes_multiseat")`, puis la globale `ui_router_routes_multiseat`
---@class ui_router_routes_multiseat
---@field Children table<string, table> Table vide.
---@field ModuleName string Nom du module de routes (premier segment du nom pointé).
---@field Root table {screenId = "multiseat", title = "ui.multiseat.title", back = rootExit, ui = {uiNav = false, Vue uniquement, infoBar/topBar masquées, uiApps masquées}}
ui_router_routes_multiseat = {}

