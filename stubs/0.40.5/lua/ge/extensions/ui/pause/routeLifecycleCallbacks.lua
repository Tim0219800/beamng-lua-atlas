---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/routeLifecycleCallbacks.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Callbacks de cycle de vie des routes « pause.* » du nouveau menu pause (routeur UI Vue). Le routeur appelle ces hooks quand l'utilisateur entre, monte, ou quitte une route de pause, de configuration véhicule, de grande carte ou de mode photo. Le module construit les données de mise en page (onglets du haut, titre, fil d'Ariane, contenu principal/latéral/panneaux, rail) en déléguant aux fournisseurs ui_pause_providers_routeData_*, gère la demande de pause de la simulation, la caméra de pause (ui_pause_camera) et les sessions du mode photo.
--- Accès : extension `ui_pause_routeLifecycleCallbacks` : `extensions.load("ui_pause_routeLifecycleCallbacks")`, puis la globale `ui_pause_routeLifecycleCallbacks`
---@class ui_pause_routeLifecycleCallbacks
---@field dependencies string[] Extensions chargées avant ce module : ui_pause_actions, fournisseurs routeData (system, home, career, vehicle, environment, multiplayer, gamemodes, photomode), ui_pause_providers_trafficControls, ui_pause_providers_vehicleTabInteractions, ui_pause_photomode, ui_pause_vehicleConfigurationOccupants.
ui_pause_routeLifecycleCallbacks = {}

--- Sortie de la route de grande carte : ferme la carte (freeroam_vueBigMap.exitBigMap, sinon freeroam_bigMapMode.exitBigMap(true)) puis appelle onPauseLeave.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/pause/routeLifecycleCallbacks.lua:655
---@param context table Contexte de pause
---@param toRoute table Route cible
---@param fromRoute table Route quittée
---@param data table Données de navigation
function ui_pause_routeLifecycleCallbacks.onPauseBigmapLeave(context, toRoute, fromRoute, data) end

--- Hook d'entrée dans une route pause.*. Ignore les routes hors pause. Prévient vehicleTabInteractions, remplit data.layoutMenu et data.pause sans contenu de route, met à jour la demande de pause de simulation, et démarre ui_pause_camera sur la route « pause » racine.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/pause/routeLifecycleCallbacks.lua:573
---@param context table Contexte de pause (mode, isFirstDriveActive, isMultiseatActive…)
---@param toRoute table Route cible (name, params)
---@param fromRoute table|nil Route quittée
---@param data table Table de données à remplir pour l'UI
function ui_pause_routeLifecycleCallbacks.onPauseEnter(context, toRoute, fromRoute, data) end

--- Hook de sortie d'une route pause. Prévient vehicleTabInteractions, ajuste la demande de pause selon la route cible, arrête ui_pause_camera si on quitte « pause », et termine la session de caméra (endPauseSession) si on sort complètement des routes pause.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/pause/routeLifecycleCallbacks.lua:606
---@param context table Contexte de pause
---@param toRoute table Route cible
---@param fromRoute table Route quittée
---@param data table Données de navigation
function ui_pause_routeLifecycleCallbacks.onPauseLeave(context, toRoute, fromRoute, data) end

--- Hook appelé quand le composant de la route est monté. Remplit data.layoutMenu avec le contenu complet de la route, met à jour la pause de simulation et appelle ui_pause_camera.beginPauseSession().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/pause/routeLifecycleCallbacks.lua:595
---@param context table Contexte de pause
---@param toRoute table Route montée
---@param fromRoute table|nil Route précédente
---@param data table Table de données à remplir
function ui_pause_routeLifecycleCallbacks.onPauseMount(context, toRoute, fromRoute, data) end

--- Entrée dans une route pause.photomode : appelle onPauseEnter, ui_pause_photomode.beginPhotomodeSession(), rattache les données du mode photo (data.photomode) puis ui_pause_photomode.onPhotomodeRouteEnter(nomRoute).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/pause/routeLifecycleCallbacks.lua:665
---@param context table Contexte de pause
---@param toRoute table Route cible
---@param fromRoute table|nil Route précédente
---@param data table Données à remplir
function ui_pause_routeLifecycleCallbacks.onPhotomodeEnter(context, toRoute, fromRoute, data) end

--- Sortie d'une route du mode photo. Si la cible est encore une route pause.photomode.*, appelle seulement onPauseLeave. Sinon notifie ui_pause_photomode.onPhotomodeRouteLeave, termine la session (endPhotomodeSession) puis appelle onPauseLeave.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/pause/routeLifecycleCallbacks.lua:689
---@param context table Contexte de pause
---@param toRoute table Route cible
---@param fromRoute table Route quittée
---@param data table Données de navigation
function ui_pause_routeLifecycleCallbacks.onPhotomodeLeave(context, toRoute, fromRoute, data) end

--- Montage d'une route du mode photo : appelle onPauseMount puis copie les données photomode vers data.photomode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/pause/routeLifecycleCallbacks.lua:681
---@param context table Contexte de pause
---@param toRoute table Route montée
---@param fromRoute table|nil Route précédente
---@param data table Données à remplir
function ui_pause_routeLifecycleCallbacks.onPhotomodeMount(context, toRoute, fromRoute, data) end

--- Hook émis quand la cible de configuration change. Ne fait quelque chose que si la cible disparaît (current nil) avec la raison « vehicleDestroyed » : ferme la vue solo et, si la route courante est une route de configuration, revient à la route de retour (previous.returnRoute ou « pause.vehicle »).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/pause/routeLifecycleCallbacks.lua:641
---@param current table|nil Nouvelle cible
---@param previous table|nil Ancienne cible (returnRoute)
---@param reason string Raison du changement, par exemple vehicleDestroyed
function ui_pause_routeLifecycleCallbacks.onVehicleConfigTargetChanged(current, previous, reason) end

--- Sortie d'une route de configuration véhicule : appelle onPauseLeave ; si la route cible n'est pas elle-même une route de configuration, termine la session ui_pause_vehicleConfigurationOccupants, la vue solo de render_splitScreen et vide core_vehicle_configTarget (raison « routeLeave »).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/pause/routeLifecycleCallbacks.lua:626
---@param context table Contexte de pause
---@param toRoute table Route cible
---@param fromRoute table Route quittée
---@param data table Données de navigation
function ui_pause_routeLifecycleCallbacks.onVehicleConfigurationLeave(context, toRoute, fromRoute, data) end

