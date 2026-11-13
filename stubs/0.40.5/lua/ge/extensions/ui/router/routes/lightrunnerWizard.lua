---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/lightrunnerWizard.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Assistant Vue de configuration du mode LightRunner (portage de l'ancien module Angular lightrunner). Même structure que quickraceWizard, backend oneshotRaceCore.lua, configurateur lightrunner_lightrunnerConfigurator. Enfants : level (> middle, titre « ui.quickrace.quickraceTracks »), vehicle.
--- Accès : extension `ui_router_routes_lightrunnerWizard` : `extensions.load("ui_router_routes_lightrunnerWizard")`, puis la globale `ui_router_routes_lightrunnerWizard`
---@class ui_router_routes_lightrunnerWizard
---@field Children table<string, table> level (onWizardLevelRouteEnter ; sous-route mineure middle -> onWizardMiddleRouteEnter), vehicle (onWizardVehicleRouteEnter) ; scopeTree de sélecteur en grille.
---@field ModuleName string Nom du module de routes (premier segment du nom pointé).
---@field Root table {screenId = "lightrunnerWizard", title = "ui.playmodes.lightRunner", onEnter = "lightrunner_lightrunnerConfigurator.onWizardRouteEnter", Vue uniquement, barres masquées}
ui_router_routes_lightrunnerWizard = {}

