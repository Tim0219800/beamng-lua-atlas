---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routeHandlers/radialExitHandlers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestionnaire de retour du menu radial (accès rapide).
--- Accès : extension `ui_router_routeHandlers_radialExitHandlers` : `extensions.load("ui_router_routeHandlers_radialExitHandlers")`, puis la globale `ui_router_routeHandlers_radialExitHandlers`
---@class ui_router_routeHandlers_radialExitHandlers
ui_router_routeHandlers_radialExitHandlers = {}

--- Retour dans le menu radial : appelle core_quickAccess.back() ; si cela ne renvoie rien de vrai, ferme le menu avec core_quickAccess.setEnabled(false, "", false). Échoue avec reason="quick_access_unavailable" si core_quickAccess est indisponible.
---Source : lua/ge/extensions/ui/router/routeHandlers/radialExitHandlers.lua:7
---@return table  {result=true, success=true, data=nil} ou {result=false, success=false, reason="quick_access_unavailable"}.
function ui_router_routeHandlers_radialExitHandlers.radialBackHandler() end

