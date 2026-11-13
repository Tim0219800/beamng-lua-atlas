---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/mission.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Routes des missions (Vue, abstrait) : détails (retour par missionDetailsExitHandler), contrôle de mission (retour pause ; sélecteur de véhicule en grille avec gridSelector backendName vehicleSelector), grille, historique et règles de drag, classement des concurrents IA.
--- Accès : extension `ui_router_routes_mission` : `extensions.load("ui_router_routes_mission")`, puis la globale `ui_router_routes_mission`
---@class ui_router_routes_mission
---@field Children table<string, table> details, control (> vehicleSelector avec hooks ui_gridSelectorRouteLifecycleCallbacks.onRouteEnter/Mount/Leave et meta.gridSelector {backendName, routePath = "/mission-vehicle-selector", defaultPath}), grid, dragHistory, dragRules, aiCompetitorsLeaderboardTable.
---@field ModuleName string Nom du module de routes (premier segment du nom pointé).
---@field Root table {screenId = "mission", abstract = true, ui = Vue uniquement, infoBar par défaut, topBar masquée, uiApps par défaut}
ui_router_routes_mission = {}

