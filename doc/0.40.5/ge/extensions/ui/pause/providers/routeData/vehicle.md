# `ui_pause_providers_routeData_vehicle`

*Fichier : `lua/ge/extensions/ui/pause/providers/routeData/vehicle.lua` · VM : Game Engine (GE) · 498 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_pause_providers_routeData_vehicle` : `extensions.load("ui_pause_providers_routeData_vehicle")`, puis la globale `ui_pause_providers_routeData_vehicle`

Fournit les données des routes « véhicule » du menu pause (pause.vehicle et sous-routes : configuration combinée, packs, réglages, peinture, sauvegarde, liste des configurations, véhicules apparus, debug). Chaque fonction renvoie une table décrivant les composants Vue à afficher (mainPanelContent, sidePanelContents, rail, mainCardClass, heading). getVehicleData calcule en plus les permissions de chaque action selon le mode de jeu, la première conduite et la présence d'un véhicule.

## Remarques

- Les éléments de panneau sont des tables {id, type = "component"|"title", componentName, props}.
- Édition de véhicule autorisée seulement en freeroam, multiplayer, garage et freeroamTutorial ; la récupération (réparer, dernière route, remettre sur les roues) en freeroam, multiplayer et freeroamTutorial ; le sélecteur de véhicule en freeroam, multiplayer, garage et freeroamTutorial.
- En multiseat actif, getVehicleData renvoie uniquement le composant PauseMultiseatVehiclesDigest, sans rail ni actions.
- Sans véhicule joueur (getPlayerVehicle(0) nil), les actions configurationCombined et de récupération sont désactivées avec la raison ui.radialmenu2.noVehicle.
- Pendant une session de première conduite (gameplay_discover_firstDrive_capabilities), les permissions sont ajustées via applyUiPermission (partsAndTuning, vehicleManagement, radialMenu, advancedSandbox).
- Seuls les boutons configurationCombined, vehicleSelector et les trois boutons de récupération sont réellement construits dans le rail ; partpacks, tuning, colorSkin et seatAdjust sont commentés dans le code (mais restent dans la table actions).
- Les boutons de récupération émettent onPauseMenuRightRailButtonPressed avec « repairHere », « recoverToRoad » ou « flipUpright ».
- getVehicleSpawnedData ne renvoie qu'un contenu léger (shell) ; l'écran Vue demande ensuite les données complètes après le montage.

**Dépendances (chargées avant) :** `ui_pause_providers_vehicleTabInteractions`, `ui_vehicleSelector_general`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_pause_providers_routeData_vehicle.getVehicleConfigListManageData()` | Données de la route de gestion de la liste des configurations : composant PauseVehicleConfigListManage. | 454 |
| `ui_pause_providers_routeData_vehicle.getVehicleConfigurationCombinedData()` | Données de l'écran de configuration combinée (pièces, composant PauseVehicleConfigurationCombined), avec customConfigurationsEnabled selon les capacités de la première conduite. | 403 |
| `ui_pause_providers_routeData_vehicle.getVehicleData(context)` | Données de la route principale « véhicule » : indicateur editable, rail (groupes vehicleButtons, vehicleSelectorButtons, vehicleRecoveryButtons), composant PauseVehicleSpawned, panneau latéral PauseVehicleTab et table actions avec visible, enabled et disabledReason pour chaque action. | 282 |
| `ui_pause_providers_routeData_vehicle.getVehicleDebugData()` | Données de la route de debug du véhicule : composant PauseVehicleDebug. | 484 |
| `ui_pause_providers_routeData_vehicle.getVehiclePacksData()` | Données de la route des packs de pièces : composant PauseVehiclePacks. | 391 |
| `ui_pause_providers_routeData_vehicle.getVehiclePaintData()` | Données de la route de peinture : composant PauseVehicleSkin. | 432 |
| `ui_pause_providers_routeData_vehicle.getVehicleSaveData()` | Données de la route de sauvegarde de configuration : titre « Enregistrer la configuration - <marque modèle> » du véhicule actuel. | 444 |
| `ui_pause_providers_routeData_vehicle.getVehicleSaveRouteTitle()` | Renvoie le titre de la route de sauvegarde : le texte ui.pause.route.saveConfig, suivi de « - marque modèle » si le véhicule joueur est connu. | 450 |
| `ui_pause_providers_routeData_vehicle.getVehicleSpawnedData(context)` | Données de la route des véhicules apparus : composant PauseVehicleSpawned et données allégées (shell) de ui_pause_providers_vehicleTabInteractions.getSpawnedVehiclesShellData. | 467 |
| `ui_pause_providers_routeData_vehicle.getVehicleTuningData()` | Données de la route de réglages : composant PauseVehicleTuning. | 420 |

### Détail des paramètres

#### `ui_pause_providers_routeData_vehicle.getVehicleConfigListManageData()`

Données de la route de gestion de la liste des configurations : composant PauseVehicleConfigListManage.

- **renvoie** : table {mainCardClass, mainPanelContent}.

#### `ui_pause_providers_routeData_vehicle.getVehicleConfigurationCombinedData()`

Données de l'écran de configuration combinée (pièces, composant PauseVehicleConfigurationCombined), avec customConfigurationsEnabled selon les capacités de la première conduite.

- **renvoie** : table {heading, mainCardClass, mainPanelContent}.

#### `ui_pause_providers_routeData_vehicle.getVehicleData(context)`

Données de la route principale « véhicule » : indicateur editable, rail (groupes vehicleButtons, vehicleSelectorButtons, vehicleRecoveryButtons), composant PauseVehicleSpawned, panneau latéral PauseVehicleTab et table actions avec visible, enabled et disabledReason pour chaque action.

- `context` (*table*) : Contexte du pause : mode, isMultiseatActive, isFirstDriveActive.
- **renvoie** : table {editable, rail, mainCardClass, mainPanelContent, spawnedVehicles, sidePanelContents, actions}.

#### `ui_pause_providers_routeData_vehicle.getVehicleDebugData()`

Données de la route de debug du véhicule : composant PauseVehicleDebug.

- **renvoie** : table {mainCardClass, mainPanelContent}.

#### `ui_pause_providers_routeData_vehicle.getVehiclePacksData()`

Données de la route des packs de pièces : composant PauseVehiclePacks.

- **renvoie** : table {mainPanelContent}.

#### `ui_pause_providers_routeData_vehicle.getVehiclePaintData()`

Données de la route de peinture : composant PauseVehicleSkin.

- **renvoie** : table {mainPanelContent}.

#### `ui_pause_providers_routeData_vehicle.getVehicleSaveData()`

Données de la route de sauvegarde de configuration : titre « Enregistrer la configuration - <marque modèle> » du véhicule actuel.

- **renvoie** : table {heading}.

#### `ui_pause_providers_routeData_vehicle.getVehicleSaveRouteTitle()`

Renvoie le titre de la route de sauvegarde : le texte ui.pause.route.saveConfig, suivi de « - marque modèle » si le véhicule joueur est connu.

- **renvoie** : string Titre.

#### `ui_pause_providers_routeData_vehicle.getVehicleSpawnedData(context)`

Données de la route des véhicules apparus : composant PauseVehicleSpawned et données allégées (shell) de ui_pause_providers_vehicleTabInteractions.getSpawnedVehiclesShellData.

- `context` (*table*) : Contexte du pause.
- **renvoie** : table {mainCardClass, mainPanelContent, spawnedVehicles}.

#### `ui_pause_providers_routeData_vehicle.getVehicleTuningData()`

Données de la route de réglages : composant PauseVehicleTuning.

- **renvoie** : table {mainPanelContent}.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : ui_pause_providers_vehicleTabInteractions, ui_vehicleSelector_general. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onPauseMenuRightRailButtonPressed`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/pause/providers/routeData/vehicle.lua`.*
