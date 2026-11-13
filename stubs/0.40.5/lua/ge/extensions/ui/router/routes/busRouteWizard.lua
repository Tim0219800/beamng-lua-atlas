---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/busRouteWizard.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Assistant Vue de configuration d'une ligne de bus (portage de l'ancien module Angular busRoute, gardé à côté de « menu.busRoutes » derrière un drapeau de fonctionnalité). Même structure que quickraceWizard ; partage le backend oneshotRaceCore.lua et ne diffère que par le configurateur Lua (busroute_busrouteConfigurator). Racine = écran d'accueil, enfants = choix du niveau (avec sous-étape « middle » = choix de la ligne) et du véhicule.
--- Accès : extension `ui_router_routes_busRouteWizard` : `extensions.load("ui_router_routes_busRouteWizard")`, puis la globale `ui_router_routes_busRouteWizard`
---@class ui_router_routes_busRouteWizard
---@field Children table<string, table> Enfants : level (onEnter onWizardLevelRouteEnter, sous-route mineure level.middle -> onWizardMiddleRouteEnter) et vehicle (onWizardVehicleRouteEnter). Ils utilisent un scopeTree de sélecteur en grille (grid-selector-grid / grid-selector-details avec retour vers la grille).
---@field ModuleName string Nom du module de routes (premier segment du nom pointé).
---@field Root table {screenId = "busRouteWizard", title = "ui.playmodes.bus", onEnter = "busroute_busrouteConfigurator.onWizardRouteEnter", scopeTree racine, Vue uniquement, infoBar et topBar masquées}
ui_router_routes_busRouteWizard = {}

