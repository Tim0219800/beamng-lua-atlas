---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/config.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Constantes de configuration du routeur d'interface (ui_router) : route principale par défaut, délais des transitions (plat pour Angular/legacy, par phases pour le flux d'accusés Vue), source du décorateur de contexte et valeurs d'interface par défaut fusionnées dans la configuration d'une route. Module de données pur, sans fonction.
--- Accès : extension `ui_router_config` : `extensions.load("ui_router_config")`, puis la globale `ui_router_config`
---@class ui_router_config
---@field ContextDecoratorDefaultSource string Source par défaut du décorateur de contexte : "core_gamestate.gameStateDecorator".
---@field MainRoute string Route par défaut quand aucune route n'est précisée : "menu".
---@field PhaseTimeouts table<string, number> Délais des transitions par phases (Vue) : startupResendInterval, routeCommit, mountReady, total (secondes).
---@field RouteUiDefaults table Valeurs d'interface par défaut ajoutées à la configuration de route si elle ne les définit pas : {uiNav = true}.
---@field ShowContextDecoratorInBreadcrumbs boolean false : le décorateur de contexte n'est pas affiché par défaut dans le fil d'Ariane.
---@field Timeout number Délai en secondes (3) avant forçage de fin d'une transition non phasée (Angular/legacy).
ui_router_config = {}

