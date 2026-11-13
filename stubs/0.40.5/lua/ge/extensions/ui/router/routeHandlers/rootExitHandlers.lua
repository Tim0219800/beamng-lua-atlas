---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routeHandlers/rootExitHandlers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestionnaire de sortie des routes racines (garage / menu).
--- Accès : extension `ui_router_routeHandlers_rootExitHandlers` : `extensions.load("ui_router_routeHandlers_rootExitHandlers")`, puis la globale `ui_router_routeHandlers_rootExitHandlers`
---@class ui_router_routeHandlers_rootExitHandlers
ui_router_routeHandlers_rootExitHandlers = {}

--- Bascule entre « menu » et « garage » : sans route courante, navigue vers « menu » ; si la route courante est « menu », navigue vers « garage » ; sinon navigue vers « menu ».
---Source : lua/ge/extensions/ui/router/routeHandlers/rootExitHandlers.lua:7
---@return boolean|nil  true dans les deux premiers cas, nil dans le dernier.
function ui_router_routeHandlers_rootExitHandlers.garageExitHandler() end

