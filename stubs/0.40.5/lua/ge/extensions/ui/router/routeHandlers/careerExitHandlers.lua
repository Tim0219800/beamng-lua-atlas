---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routeHandlers/careerExitHandlers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestionnaires de retour/sortie des écrans de carrière, référencés par routeHandlers.lua : sortie de la sélection de profil, retour dans les pages de branche et sortie d'une négociation.
--- Accès : extension `ui_router_routeHandlers_careerExitHandlers` : `extensions.load("ui_router_routeHandlers_careerExitHandlers")`, puis la globale `ui_router_routeHandlers_careerExitHandlers`
---@class ui_router_routeHandlers_careerExitHandlers
ui_router_routeHandlers_careerExitHandlers = {}

--- Retour d'une page de branche de carrière. Si la branche (params.pathId) a un parent, navigue vers career.branchPage avec {pathId = parentId, focusPathId = pathId, returnRoute?}. Sinon, si returnRoute == "career.computer", navigue vers career.computer, sinon vers career.domainSelection avec {focusPathId = pathId}.
---Source : lua/ge/extensions/ui/router/routeHandlers/careerExitHandlers.lua:15
---@return table  Résultat de ui_router.navigate.
function ui_router_routeHandlers_careerExitHandlers.careerBranchPageBackHandler() end

--- Quitte l'écran des profils de carrière : navigue vers « pause » si la carrière est active (career_career.isActive), sinon vers « menu ».
---Source : lua/ge/extensions/ui/router/routeHandlers/careerExitHandlers.lua:7
function ui_router_routeHandlers_careerExitHandlers.careerProfilesExitHandler() end

--- Quitte une négociation : appelle career_modules_marketplace.finalizeNegotiationExit() puis retourne à l'entrée précédente (mêmes paramètres, restoreLastScope = true).
---Source : lua/ge/extensions/ui/router/routeHandlers/careerExitHandlers.lua:41
---@return table  Résultat de navigate, ou {success=false, reason="no_previous_entry"} sans entrée précédente.
function ui_router_routeHandlers_careerExitHandlers.negotiationExitHandler() end

