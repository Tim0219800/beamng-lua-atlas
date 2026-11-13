---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/menuRouteLifecycleCallbacks.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petite extension qui relie des événements du jeu à la navigation de l'interface. Actuellement elle ne contient qu'un hook : à l'entrée en mode photo, elle ouvre la route « pause.photomode » via ui_router.
--- Accès : extension `ui_menuRouteLifecycleCallbacks` : `extensions.load("ui_menuRouteLifecycleCallbacks")`, puis la globale `ui_menuRouteLifecycleCallbacks`
---@class ui_menuRouteLifecycleCallbacks
ui_menuRouteLifecycleCallbacks = {}

--- Hook appelé à l'entrée en mode photo ; navigue vers la route « pause.photomode » de l'interface.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/menuRouteLifecycleCallbacks.lua:7
---@return any  Résultat de ui_router.navigate (déduit du code).
function ui_menuRouteLifecycleCallbacks.onPhotomodeEnter() end

