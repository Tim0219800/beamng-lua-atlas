---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/services/navigationContext.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Construit le contexte de navigation du routeur UI : un instantané de l'état du jeu (carrière, garage, mission, scénario, multijoueur, multiseat, premier trajet, tutoriel freeroam, grande carte autorisée ou non) et le mode courant. Chaque lecture est protégée par pcall, donc un module de jeu absent donne simplement false/nil. Sert aux décisions de routes (écrans, décorateurs de contexte).
--- Accès : extension `ui_router_services_navigationContext` : `extensions.load("ui_router_services_navigationContext")`, puis la globale `ui_router_services_navigationContext`
---@class ui_router_services_navigationContext
ui_router_services_navigationContext = {}

--- Complète getContext() avec le type de navigation, des extras et des résumés {name, params, meta} des routes d'arrivée et de départ.
---Source : lua/ge/extensions/ui/router/services/navigationContext.lua:77
---@param toRoute table|nil Route de destination.
---@param fromRoute table|nil Route d'origine.
---@param kind string Nature de la navigation (déduit du code : transmis tel quel dans context.kind).
---@param extras table|nil Données supplémentaires (défaut {}).
---@return table  Contexte avec kind, extras, toRoute, fromRoute.
function ui_router_services_navigationContext.buildNavigationContext(toRoute, fromRoute, kind, extras) end

--- Renvoie la table de contexte : isCareerActive, isGarageActive, isMissionActive, isScenarioActive, isMultiplayerActive, foregroundMissionId, isBigMapBlocked, isBigMapAllowed, isFreeroamTutorialActive, isFirstDriveActive, isFirstDriveGuided, isMultiseatGamemodeActive, isMultiseatActive, mode.
---Source : lua/ge/extensions/ui/router/services/navigationContext.lua:31
---@return table  Contexte courant.
function ui_router_services_navigationContext.getContext() end

