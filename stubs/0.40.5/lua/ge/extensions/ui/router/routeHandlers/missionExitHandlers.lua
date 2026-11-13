---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routeHandlers/missionExitHandlers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestionnaires de sortie/retour des écrans de mission et de pause. Quand un écran de début/fin de mission est actif, ils renvoient vers la route « mission.control » avec le mode correspondant ; sinon vers la route de gameplay (ui_menuManager.getGameplayRoute(), « play » par défaut).
--- Accès : extension `ui_router_routeHandlers_missionExitHandlers` : `extensions.load("ui_router_routeHandlers_missionExitHandlers")`, puis la globale `ui_router_routeHandlers_missionExitHandlers`
---@class ui_router_routeHandlers_missionExitHandlers
ui_router_routeHandlers_missionExitHandlers = {}

--- Quitte les détails de mission : si une mission est active et qu'un écran de début/fin est affiché, navigue vers mission.control avec {mode = mode de l'écran} ; sinon vers la route de gameplay.
---Source : lua/ge/extensions/ui/router/routeHandlers/missionExitHandlers.lua:11
---@return table|nil  Résultat de navigate dans le cas mission.control ; nil sinon (la navigation est lancée sans retourner son résultat).
function ui_router_routeHandlers_missionExitHandlers.missionDetailsExitHandler() end

--- Retour du sélecteur de véhicule de mission : même logique que pauseExitHandler.
---Source : lua/ge/extensions/ui/router/routeHandlers/missionExitHandlers.lua:35
---@return table  Résultat de ui_router.navigate.
function ui_router_routeHandlers_missionExitHandlers.missionVehicleSelectorBackHandler() end

--- Quitte la pause : navigue vers mission.control {mode} si un écran de début/fin de mission est actif, sinon vers la route de gameplay.
---Source : lua/ge/extensions/ui/router/routeHandlers/missionExitHandlers.lua:24
---@return table  Résultat de ui_router.navigate.
function ui_router_routeHandlers_missionExitHandlers.pauseExitHandler() end

