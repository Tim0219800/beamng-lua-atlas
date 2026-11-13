---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/firstDrive.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Routes de la première conduite guidée (Vue) : introduction, onboarding, arrivée, fin, récupération, zones d'apprentissage. Les retours sont verrouillés (`firstDriveLockedHandler`) sauf onboarding (previousRouteBackHandler). Les hooks onMount/onEnter/onLeave appellent gameplay_discover_firstDrive_experience.
--- Accès : extension `ui_router_routes_firstDrive` : `extensions.load("ui_router_routes_firstDrive")`, puis la globale `ui_router_routes_firstDrive`
---@class ui_router_routes_firstDrive
---@field Children table<string, table> onboarding (infoBar visible), arrival, completion (onMount dédiés, retour verrouillé), recovery (backTarget play, onLeave onFirstDriveRecoveryRouteLeave), learning (backTarget pause, onEnter/onLeave dédiés, triggerPause = true, scope first-drive-learning-areas).
---@field ModuleName string Nom du module de routes (premier segment du nom pointé).
---@field Root table {screenId = "firstDrive", onMount = "gameplay_discover_firstDrive_experience.onFirstDriveRouteMount", back = handler firstDriveLockedHandler, scopeTree first-drive-intro, ui = Vue, barres masquées, uiApps masquées, triggerPause = false}
ui_router_routes_firstDrive = {}

