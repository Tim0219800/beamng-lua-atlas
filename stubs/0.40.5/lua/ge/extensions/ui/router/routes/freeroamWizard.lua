---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/freeroamWizard.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Variante « Wizard » de l'assistant freeroam : même parcours que freeroamLevels (levels > level, vehicles > vehicle, options, multiplayer) mais sous la racine freeroamWizard (titre ui.menu.freeroamSelector.title). Les hooks appellent freeroam_freeroamConfigurator.onWizard*.
--- Accès : extension `ui_router_routes_freeroamWizard` : `extensions.load("ui_router_routes_freeroamWizard")`, puis la globale `ui_router_routes_freeroamWizard`
---@class ui_router_routes_freeroamWizard
---@field Children table<string, table> levels (> level), vehicles (> vehicle), options, multiplayer ; titres dynamiques via resolveSelectedLevelTitle / resolveSelectedVehicleTitle.
---@field ModuleName string Nom du module de routes (premier segment du nom pointé).
---@field Root table {title = "ui.menu.freeroamSelector.title", ui = Vue uniquement, infoBar par défaut, topBar et uiApps masquées}
ui_router_routes_freeroamWizard = {}

