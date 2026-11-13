---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/garage/routeLifecycleCallbacks.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Callbacks de cycle de vie des routes UI du garage en mode photo. Pour les routes « garage.photomode » (et « garage.photomode.* »), ouvre une session photomode avec le profil « garage » à l'entrée, y joint les données de route fournies par ui_pause_providers_routeData_photomode, et ferme la session à la sortie. Les autres routes sont ignorées.
--- Accès : extension `ui_garage_routeLifecycleCallbacks` : `extensions.load("ui_garage_routeLifecycleCallbacks")`, puis la globale `ui_garage_routeLifecycleCallbacks`
---@class ui_garage_routeLifecycleCallbacks
---@field dependencies string[] Extensions chargées avant : ui_pause_providers_routeData_photomode, ui_pause_photomode.
ui_garage_routeLifecycleCallbacks = {}

--- Hook appelé quand l'UI entre dans une route photomode. Si la route est garage.photomode[.*] : démarre la session photomode (profil « garage »), ajoute data.photomode et notifie onPhotomodeRouteEnter.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/garage/routeLifecycleCallbacks.lua:35
---@param context table Contexte du changement de route (non utilisé).
---@param toRoute table Route cible ; seul le champ name est lu.
---@param fromRoute table|nil Route précédente (non utilisée).
---@param data table Données de route, enrichies avec photomode.
function ui_garage_routeLifecycleCallbacks.onPhotomodeEnter(context, toRoute, fromRoute, data) end

--- Hook appelé à la sortie de la route : notifie onPhotomodeRouteLeave puis termine la session photomode (endPhotomodeSession).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/garage/routeLifecycleCallbacks.lua:57
---@param context table Contexte du changement de route (non utilisé).
---@param toRoute table|nil Route d'arrivée ; name transmis à onPhotomodeRouteLeave.
---@param fromRoute table|nil Route quittée (utilisée pour le log).
---@param data table Données de route (non utilisées).
function ui_garage_routeLifecycleCallbacks.onPhotomodeLeave(context, toRoute, fromRoute, data) end

--- Hook appelé au montage de la route : ajoute data.photomode si la route est garage.photomode[.*].
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/garage/routeLifecycleCallbacks.lua:52
---@param context table Contexte du changement de route (non utilisé).
---@param toRoute table Route cible ; seul name est lu.
---@param fromRoute table|nil Route précédente (non utilisée).
---@param data table Données de route, enrichies avec photomode.
function ui_garage_routeLifecycleCallbacks.onPhotomodeMount(context, toRoute, fromRoute, data) end

