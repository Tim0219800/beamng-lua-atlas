---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/debug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Routes de débogage de l'UI (Vue, barres masquées, module abstrait) : composants de démonstration, test des apps UI, chargeur asynchrone en masse, surbrillance de tutoriel (voir ui_tutorialHighlight).
--- Accès : extension `ui_router_routes_debug` : `extensions.load("ui_router_routes_debug")`, puis la globale `ui_router_routes_debug`
---@class ui_router_routes_debug
---@field Children table<string, table> components (scopeTree root > demo), ui-apps-test, asyncBulkLoader, tutorialHighlight.
---@field Root table {abstract = true, ui = Vue, infoBar et topBar masquées, uiApps par défaut}
ui_router_routes_debug = {}

