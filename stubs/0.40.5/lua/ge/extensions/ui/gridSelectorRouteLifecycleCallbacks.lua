---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gridSelectorRouteLifecycleCallbacks.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Callbacks de cycle de vie des routes de l'UI pour les écrans à sélecteur en grille. À l'entrée ou au montage d'une route, il calcule un instantané (ui_gridSelector.getSelectorSnapshot) à partir de la config `meta.gridSelector` de la route et l'ajoute à `data.gridSelector` (et `data.vehicleSelector` pour le backend vehicleSelector). Il relaie aussi les hooks onPauseEnter/onPauseMount/onPauseLeave à `ui_pause_routeLifecycleCallbacks` quand la route est une route de pause.
--- Accès : extension `ui_gridSelectorRouteLifecycleCallbacks` : `extensions.load("ui_gridSelectorRouteLifecycleCallbacks")`, puis la globale `ui_gridSelectorRouteLifecycleCallbacks`
---@class ui_gridSelectorRouteLifecycleCallbacks
---@field dependencies table<integer, string> Charge ui_gridSelector avant ce module.
ui_gridSelectorRouteLifecycleCallbacks = {}

--- Appelée par le routeur d'UI à l'entrée dans une route. Relaie onPauseEnter si c'est une route de pause, puis joint l'instantané du sélecteur à `data`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/gridSelectorRouteLifecycleCallbacks.lua:163
---@param context any Contexte du routeur.
---@param toRoute table Route cible (name, params, meta).
---@param fromRoute table|nil Route quittée.
---@param data table Table de données de la route, enrichie de gridSelector.
function ui_gridSelectorRouteLifecycleCallbacks.onRouteEnter(context, toRoute, fromRoute, data) end

--- Appelée par le routeur d'UI en quittant une route. Relaie seulement onPauseLeave pour les routes de pause.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/gridSelectorRouteLifecycleCallbacks.lua:173
---@param context any Contexte du routeur.
---@param toRoute table|nil Route cible.
---@param fromRoute table Route quittée.
---@param data table|nil Données de la route.
function ui_gridSelectorRouteLifecycleCallbacks.onRouteLeave(context, toRoute, fromRoute, data) end

--- Appelée par le routeur d'UI au montage de la route. Relaie onPauseMount si route de pause, puis joint l'instantané du sélecteur à `data`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/gridSelectorRouteLifecycleCallbacks.lua:168
---@param context any Contexte du routeur.
---@param toRoute table Route cible.
---@param fromRoute table|nil Route quittée.
---@param data table Données de la route.
function ui_gridSelectorRouteLifecycleCallbacks.onRouteMount(context, toRoute, fromRoute, data) end

