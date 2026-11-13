---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/quickraceWizard.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Assistant Vue de la course rapide (portage de l'ancien module Angular quickrace, séparé de « menu.quickrace » pour coexister derrière un drapeau). La racine est l'écran d'aperçu/options ; level (> middle = choix du tracé) et vehicle sont des étapes qui reviennent à la racine. Configurateur : quickrace_quickraceConfigurator ; backend commun oneshotRaceCore.lua.
--- Accès : extension `ui_router_routes_quickraceWizard` : `extensions.load("ui_router_routes_quickraceWizard")`, puis la globale `ui_router_routes_quickraceWizard`
---@class ui_router_routes_quickraceWizard
---@field Children table<string, table> level (onWizardLevelRouteEnter, titre ui.quickrace.quickraceLevels ; sous-route mineure middle -> onWizardMiddleRouteEnter, titre ui.quickrace.quickraceTracks), vehicle (onWizardVehicleRouteEnter) ; scopeTree de sélecteur en grille.
---@field ModuleName string Nom du module de routes (premier segment du nom pointé).
---@field Root table {screenId = "quickraceWizard", title = "ui.playmodes.quickrace", onEnter = "quickrace_quickraceConfigurator.onWizardRouteEnter", Vue uniquement, barres masquées}
ui_router_routes_quickraceWizard = {}

