---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/managers/frameworkManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Pont sortant du routeur Lua vers les frameworks UI (Vue, Angular) par guihooks. Il émet les évènements de changement de route (démarrage, fin, annulation) et ne garde aucun état : l'état de transition, la progression, les timeouts et la validation des accusés sont dans transitionManager.lua et router.lua.
--- Accès : extension `ui_router_managers_frameworkManager` : `extensions.load("ui_router_managers_frameworkManager")`, puis la globale `ui_router_managers_frameworkManager`
---@class ui_router_managers_frameworkManager
ui_router_managers_frameworkManager = {}

--- Émet l'évènement GUI ui_router_routeChange pour demander au framework d'afficher la route.
---Source : lua/ge/extensions/ui/router/managers/frameworkManager.lua:31
---@param data table Entrée de navigation (traitée comme immuable).
---@param transitionId string|nil Identifiant de transition à joindre à la charge utile (copie).
function ui_router_managers_frameworkManager.sendRouteChange(data, transitionId) end

--- Émet l'évènement GUI ui_router_routeChangeCancelled. Si extras contient transitionId ou reason, une copie de la route est émise avec ces champs pour que l'UI n'efface que le handoff correspondant.
---Source : lua/ge/extensions/ui/router/managers/frameworkManager.lua:57
---@param data table|nil Route annulée (toRoute), traitée comme immuable.
---@param extras table|nil {transitionId?, reason?}.
function ui_router_managers_frameworkManager.sendRouteChangeCancelled(data, extras) end

--- Émet l'évènement GUI ui_router_afterRouteChange avec l'entrée de navigation validée.
---Source : lua/ge/extensions/ui/router/managers/frameworkManager.lua:43
---@param data table Entrée courante validée.
function ui_router_managers_frameworkManager.sendRouteChangeComplete(data) end

