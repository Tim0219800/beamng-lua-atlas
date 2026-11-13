# `ui_pause_routeLifecycleCallbacks`

*Fichier : `lua/ge/extensions/ui/pause/routeLifecycleCallbacks.lua` · VM : Game Engine (GE) · 705 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_pause_routeLifecycleCallbacks` : `extensions.load("ui_pause_routeLifecycleCallbacks")`, puis la globale `ui_pause_routeLifecycleCallbacks`

Callbacks de cycle de vie des routes « pause.* » du nouveau menu pause (routeur UI Vue). Le routeur appelle ces hooks quand l'utilisateur entre, monte, ou quitte une route de pause, de configuration véhicule, de grande carte ou de mode photo. Le module construit les données de mise en page (onglets du haut, titre, fil d'Ariane, contenu principal/latéral/panneaux, rail) en déléguant aux fournisseurs ui_pause_providers_routeData_*, gère la demande de pause de la simulation, la caméra de pause (ui_pause_camera) et les sessions du mode photo.

## Remarques

- Aucune fonction n'est destinée à être appelée à la main : toutes sont des hooks appelés par le routeur avec (context, toRoute, fromRoute, data), où data est la table que le hook remplit (data.layoutMenu, data.pause, data.photomode).
- Lors de onPauseEnter, le contenu de route n'est pas calculé (includeRouteContent = false) ; il l'est dans onPauseMount (true).
- La simulation est mise en pause (simTimeAuthority.pushPauseRequest, id « ui_pause_home_tab ») pour pause, pause.system, pause.manageVehicles et pause.options ; elle ne l'est pas pour la configuration combinée (sauf routes non listées), tuning, debug, paint, météo, simulation, replay et photomode.
- Les onglets du haut dépendent du mode : career (Progression si dispo, Historique), sinon Véhicule et Environnement (filtrés par gameplay_discover_firstDrive_capabilities pendant la première conduite), Multijoueur si MP existe en freeroam, puis onglets de mods via ui_pause_actions.getVisibleModTabs().
- onPauseEnter appelle dump("not a pause route") pour les routes hors pause (reste de debug laissé dans le code).
- attachPhotomodeRouteData contient un TODO : contournement pour fournir des données fraîches du mode photo à l'entrée, car onMount peut arriver en retard.

**Dépendances (chargées avant) :** `ui_pause_actions`, `ui_pause_providers_routeData_system`, `ui_pause_providers_routeData_home`, `ui_pause_providers_routeData_career`, `ui_pause_providers_routeData_vehicle`, `ui_pause_providers_routeData_environment`, `ui_pause_providers_routeData_multiplayer`, `ui_pause_providers_routeData_gamemodes`, `ui_pause_providers_routeData_photomode`, `ui_pause_providers_trafficControls`, `ui_pause_providers_vehicleTabInteractions`, `ui_pause_photomode`, `ui_pause_vehicleConfigurationOccupants`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_pause_routeLifecycleCallbacks.onPauseBigmapLeave(context, toRoute, fromRoute, data)` | Sortie de la route de grande carte : ferme la carte (freeroam_vueBigMap.exitBigMap, sinon freeroam_bigMapMode.exitBigMap(true)) puis appelle onPauseLeave. *(interne)* *(hook)* | 655 |
| `ui_pause_routeLifecycleCallbacks.onPauseEnter(context, toRoute, fromRoute, data)` | Hook d'entrée dans une route pause.*. Ignore les routes hors pause. Prévient vehicleTabInteractions, remplit data.layoutMenu et data.pause sans contenu de route, met à jour la demande de pause de simulation, et démarre ui_pause_camera sur la route « pause » racine. *(interne)* *(hook)* | 573 |
| `ui_pause_routeLifecycleCallbacks.onPauseLeave(context, toRoute, fromRoute, data)` | Hook de sortie d'une route pause. Prévient vehicleTabInteractions, ajuste la demande de pause selon la route cible, arrête ui_pause_camera si on quitte « pause », et termine la session de caméra (endPauseSession) si on sort complètement des routes pause. *(interne)* *(hook)* | 606 |
| `ui_pause_routeLifecycleCallbacks.onPauseMount(context, toRoute, fromRoute, data)` | Hook appelé quand le composant de la route est monté. Remplit data.layoutMenu avec le contenu complet de la route, met à jour la pause de simulation et appelle ui_pause_camera.beginPauseSession(). *(interne)* *(hook)* | 595 |
| `ui_pause_routeLifecycleCallbacks.onPhotomodeEnter(context, toRoute, fromRoute, data)` | Entrée dans une route pause.photomode : appelle onPauseEnter, ui_pause_photomode.beginPhotomodeSession(), rattache les données du mode photo (data.photomode) puis ui_pause_photomode.onPhotomodeRouteEnter(nomRoute). *(interne)* *(hook)* | 665 |
| `ui_pause_routeLifecycleCallbacks.onPhotomodeLeave(context, toRoute, fromRoute, data)` | Sortie d'une route du mode photo. Si la cible est encore une route pause.photomode.*, appelle seulement onPauseLeave. Sinon notifie ui_pause_photomode.onPhotomodeRouteLeave, termine la session (endPhotomodeSession) puis appelle onPauseLeave. *(interne)* *(hook)* | 689 |
| `ui_pause_routeLifecycleCallbacks.onPhotomodeMount(context, toRoute, fromRoute, data)` | Montage d'une route du mode photo : appelle onPauseMount puis copie les données photomode vers data.photomode. *(interne)* *(hook)* | 681 |
| `ui_pause_routeLifecycleCallbacks.onVehicleConfigTargetChanged(current, previous, reason)` | Hook émis quand la cible de configuration change. Ne fait quelque chose que si la cible disparaît (current nil) avec la raison « vehicleDestroyed » : ferme la vue solo et, si la route courante est une route de configuration, revient à la route de retour (previous.returnRoute ou « pause.vehicle »). *(interne)* *(hook)* | 641 |
| `ui_pause_routeLifecycleCallbacks.onVehicleConfigurationLeave(context, toRoute, fromRoute, data)` | Sortie d'une route de configuration véhicule : appelle onPauseLeave ; si la route cible n'est pas elle-même une route de configuration, termine la session ui_pause_vehicleConfigurationOccupants, la vue solo de render_splitScreen et vide core_vehicle_configTarget (raison « routeLeave »). *(interne)* *(hook)* | 626 |

### Détail des paramètres

#### `ui_pause_routeLifecycleCallbacks.onPauseBigmapLeave(context, toRoute, fromRoute, data)`

Sortie de la route de grande carte : ferme la carte (freeroam_vueBigMap.exitBigMap, sinon freeroam_bigMapMode.exitBigMap(true)) puis appelle onPauseLeave.

- `context` (*table*) : Contexte de pause
- `toRoute` (*table*) : Route cible
- `fromRoute` (*table*) : Route quittée
- `data` (*table*) : Données de navigation

#### `ui_pause_routeLifecycleCallbacks.onPauseEnter(context, toRoute, fromRoute, data)`

Hook d'entrée dans une route pause.*. Ignore les routes hors pause. Prévient vehicleTabInteractions, remplit data.layoutMenu et data.pause sans contenu de route, met à jour la demande de pause de simulation, et démarre ui_pause_camera sur la route « pause » racine.

- `context` (*table*) : Contexte de pause (mode, isFirstDriveActive, isMultiseatActive…)
- `toRoute` (*table*) : Route cible (name, params)
- `fromRoute` (*table|nil*) : Route quittée
- `data` (*table*) : Table de données à remplir pour l'UI

#### `ui_pause_routeLifecycleCallbacks.onPauseLeave(context, toRoute, fromRoute, data)`

Hook de sortie d'une route pause. Prévient vehicleTabInteractions, ajuste la demande de pause selon la route cible, arrête ui_pause_camera si on quitte « pause », et termine la session de caméra (endPauseSession) si on sort complètement des routes pause.

- `context` (*table*) : Contexte de pause
- `toRoute` (*table*) : Route cible
- `fromRoute` (*table*) : Route quittée
- `data` (*table*) : Données de navigation

#### `ui_pause_routeLifecycleCallbacks.onPauseMount(context, toRoute, fromRoute, data)`

Hook appelé quand le composant de la route est monté. Remplit data.layoutMenu avec le contenu complet de la route, met à jour la pause de simulation et appelle ui_pause_camera.beginPauseSession().

- `context` (*table*) : Contexte de pause
- `toRoute` (*table*) : Route montée
- `fromRoute` (*table|nil*) : Route précédente
- `data` (*table*) : Table de données à remplir

#### `ui_pause_routeLifecycleCallbacks.onPhotomodeEnter(context, toRoute, fromRoute, data)`

Entrée dans une route pause.photomode : appelle onPauseEnter, ui_pause_photomode.beginPhotomodeSession(), rattache les données du mode photo (data.photomode) puis ui_pause_photomode.onPhotomodeRouteEnter(nomRoute).

- `context` (*table*) : Contexte de pause
- `toRoute` (*table*) : Route cible
- `fromRoute` (*table|nil*) : Route précédente
- `data` (*table*) : Données à remplir

#### `ui_pause_routeLifecycleCallbacks.onPhotomodeLeave(context, toRoute, fromRoute, data)`

Sortie d'une route du mode photo. Si la cible est encore une route pause.photomode.*, appelle seulement onPauseLeave. Sinon notifie ui_pause_photomode.onPhotomodeRouteLeave, termine la session (endPhotomodeSession) puis appelle onPauseLeave.

- `context` (*table*) : Contexte de pause
- `toRoute` (*table*) : Route cible
- `fromRoute` (*table*) : Route quittée
- `data` (*table*) : Données de navigation

#### `ui_pause_routeLifecycleCallbacks.onPhotomodeMount(context, toRoute, fromRoute, data)`

Montage d'une route du mode photo : appelle onPauseMount puis copie les données photomode vers data.photomode.

- `context` (*table*) : Contexte de pause
- `toRoute` (*table*) : Route montée
- `fromRoute` (*table|nil*) : Route précédente
- `data` (*table*) : Données à remplir

#### `ui_pause_routeLifecycleCallbacks.onVehicleConfigTargetChanged(current, previous, reason)`

Hook émis quand la cible de configuration change. Ne fait quelque chose que si la cible disparaît (current nil) avec la raison « vehicleDestroyed » : ferme la vue solo et, si la route courante est une route de configuration, revient à la route de retour (previous.returnRoute ou « pause.vehicle »).

- `current` (*table|nil*) : Nouvelle cible
- `previous` (*table|nil*) : Ancienne cible (returnRoute)
- `reason` (*string*) : Raison du changement, par exemple vehicleDestroyed

#### `ui_pause_routeLifecycleCallbacks.onVehicleConfigurationLeave(context, toRoute, fromRoute, data)`

Sortie d'une route de configuration véhicule : appelle onPauseLeave ; si la route cible n'est pas elle-même une route de configuration, termine la session ui_pause_vehicleConfigurationOccupants, la vue solo de render_splitScreen et vide core_vehicle_configTarget (raison « routeLeave »).

- `context` (*table*) : Contexte de pause
- `toRoute` (*table*) : Route cible
- `fromRoute` (*table*) : Route quittée
- `data` (*table*) : Données de navigation

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions chargées avant ce module : ui_pause_actions, fournisseurs routeData (system, home, career, vehicle, environment, multiplayer, gamemodes, photomode), ui_pause_providers_trafficControls, ui_pause_providers_vehicleTabInteractions, ui_pause_photomode, ui_pause_vehicleConfigurationOccupants. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/pause/routeLifecycleCallbacks.lua`.*
