---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/scenario.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Routes de fin et de début de scénario (Vue, module abstrait) : start, end, quickrace.end et chapter.end. Chaque écran a un scopeTree d'actions avec backTarget vers la racine ; les blocs conditionnels (réglages, progression, véhicule, récompenses, stats, mission) sont `optional = true` pour le validateur de portées. Retour par défaut vers pause.
--- Accès : extension `ui_router_routes_scenario` : `extensions.load("ui_router_routes_scenario")`, puis la globale `ui_router_routes_scenario`
---@class ui_router_routes_scenario
---@field Children table<string, table> start, end, quickrace (abstrait > end), chapter (abstrait > end) ; screenId scenario.start / scenario.end / scenario.quickrace.end / scenario.chapter.end, tous en Vue avec backTarget = "pause".
---@field ModuleName string Nom du module de routes (premier segment du nom pointé).
---@field Root table {abstract = true, ui = filtre only, infoBar et topBar masquées, uiApps visibles}
ui_router_routes_scenario = {}

