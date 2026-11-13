---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/freeroamLevels.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Assistant Vue de choix de niveau/véhicule/options pour le mode libre (freeroam), version à racine « grille de niveaux ». Les hooks appellent freeroam_freeroamConfigurator.onWizard*. Enfants : level (détail, sous-route mineure), vehicles (> vehicle, options > multiplayer).
--- Accès : extension `ui_router_routes_freeroamLevels` : `extensions.load("ui_router_routes_freeroamLevels")`, puis la globale `ui_router_routes_freeroamLevels`
---@class ui_router_routes_freeroamLevels
---@field Children table<string, table> level (titre dynamique via resolveSelectedLevelTitle), vehicles (> vehicle avec titre dynamique resolveSelectedVehicleTitle, > options > multiplayer).
---@field ModuleName string Nom du module de routes (premier segment du nom pointé).
---@field Root table {screenId = "freeroamLevels", title = "ui.menu.freeroamSelector.wizard.location", onEnter onWizardLevelsRouteEnter, onMount onWizardLevelsRouteMount, scopeTree root > (grid, auxillary), targetScope grid, ui Vue, infoBar par défaut, uiApps masquées}
ui_router_routes_freeroamLevels = {}

