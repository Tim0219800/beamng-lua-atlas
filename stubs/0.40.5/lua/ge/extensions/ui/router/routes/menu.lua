---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/menu.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Routes du menu principal (Vue) : sélecteurs de jeu (freeroam, quickrace, lightrunner, bus, scénarios, expériences, rallye), niveaux, véhicules et configuration (vehicleconfig, partpacks), options (audio, caméra, contrôles, affichage, gameplay, graphismes, langue, autres, interface), mods, discover, replay, crédits, infos de version, sons d'UI. Plusieurs sous-arbres sont montés par `include` (mods, freeroamLevels, quickraceWizard, lightrunnerWizard, busRouteWizard, multiplayer). Le retour de la racine passe par `mainmenuExitHandler`.
--- Accès : extension `ui_router_routes_menu` : `extensions.load("ui_router_routes_menu")`, puis la globale `ui_router_routes_menu`
---@class ui_router_routes_menu
---@field Children table<string, table> Entre autres : bigmapMenu, campaigns, dragRaceOverview, careerPause, freeroamconfigurator, freeroamselector, quickraceWizard, lightrunnerWizard, busRouteWizard, environment, discover (> details, multiseat), gameplay, rallySelector, experiencesSelector, photomode, rally, levels, levelDetails, others, credits, modsDetails (Angular), options (abstrait), release-info, replay, scenarios, threeElementSelect, uiSounds, vehicleconfig, vehicles, vehiclesdetails, vehiclesnew.
---@field Root table {screenId = "menu", title = "ui.common.menu", scopeTree root, back = handler mainmenuExitHandler, ui = Vue uniquement}
ui_router_routes_menu = {}

