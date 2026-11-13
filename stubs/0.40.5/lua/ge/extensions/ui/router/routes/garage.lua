---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/garage.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Routes du garage (Vue) : vue d'ensemble, véhicule (sélecteur, réglage et miroirs, peinture, pièces, sauvegarde de configuration), liste de véhicules, « mycars », mode photo et édition d'overlay. Hook racine : gameplay_garageMode.onGarageEnter. Titres de véhicule dynamiques via gameplay_garageMode.vehicleByIdOrActive.
--- Accès : extension `ui_router_routes_garage` : `extensions.load("ui_router_routes_garage")`, puis la globale `ui_router_routes_garage`
---@class ui_router_routes_garage
---@field Children table<string, table> vehicle (abstrait ; selector, tuning > mirrors, paint, parts, save), vehicles (> vehicle), mycars (> vehicle), photomode (exitGuards confirmPhotomodeExit ; > overlay > edit > adjust).
---@field ModuleName string Nom du module de routes (premier segment du nom pointé).
---@field Root table {screenId = "garage", title = "Garage", scopeTree garage-layout > garage-sidemenu, ui = Vue, infoBar visible sans info système, topBar et uiApps masquées, onEnter = gameplay_garageMode.onGarageEnter}
ui_router_routes_garage = {}

