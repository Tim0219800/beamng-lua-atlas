---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/pause.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Routes du menu pause (Vue), le plus gros module : écran de pause racine (retour par pauseExitHandler) avec rails gauche/droite/bas, puis system, hudApps (éditeur de disposition), career (branches, missions, historique, journal), milestones, vehicleDetails, multiseat (réglages, modes de jeu, sélecteur de véhicule), vehicleSelector, stats, vehicle (configuration combinée, sauvegarde, miroirs, sélecteur, détails), manageVehicles, photomode (overlay > edit > adjust), freeroamselector, environment, replay, plus des sous-arbres inclus (mods, bigmap, options, multiplayer, freeroamLevels). Presque tous les enfants utilisent les hooks ui_pause_routeLifecycleCallbacks.onPauseEnter/onPauseMount/onPauseLeave.
--- Accès : extension `ui_router_routes_pause` : `extensions.load("ui_router_routes_pause")`, puis la globale `ui_router_routes_pause`
---@class ui_router_routes_pause
---@field Children table<string, table> Voir le résumé du module. Inclusions : mods (avec backTarget pause.system et modsPauseLifecycle sur chaque enfant), bigmap (onLeave onPauseBigmapLeave), options, multiplayer, freeroamLevels.
---@field ModuleName string Nom du module de routes (premier segment du nom pointé).
---@field Root table {screenId = "pause", title = "ui.environment.pause", back = handler pauseExitHandler, hooks onPauseEnter/Mount/Leave, targetScope "pause-left-rails", scopeTree pause-root > (pause-left-rails, pause-right-rails, pause-bottom-rails, menu-content-card-1), ui = Vue uniquement, topBar masquée}
ui_router_routes_pause = {}

