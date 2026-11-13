---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routeHandlers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Registre des gestionnaires de retour/sortie nommés des routes. Une route dont le retour est en mode « handler » désigne un nom (par exemple garageExitHandler) ; router.back() le récupère via getHandler et l'appelle. La plupart des gestionnaires sont définis dans routeHandlers/*ExitHandlers.lua ou délèguent à des modules de gameplay (carrière, inventaire, achat de véhicules, garde de configuration de véhicule).
--- Accès : extension `ui_router_routeHandlers` : `extensions.load("ui_router_routeHandlers")`, puis la globale `ui_router_routeHandlers`
---@class ui_router_routeHandlers
ui_router_routeHandlers = {}

--- Renvoie le gestionnaire enregistré sous ce nom.
---Source : lua/ge/extensions/ui/router/routeHandlers.lua:36
---@param handlerName string Nom du gestionnaire déclaré dans la route (back.handler).
---@return function|nil  Gestionnaire, ou nil si le nom est inconnu.
function ui_router_routeHandlers.getHandler(handlerName) end

