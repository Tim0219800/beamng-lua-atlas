# `util_screenshotCreator`

*Fichier : `lua/ge/extensions/util/screenshotCreator.lua` · VM : Game Engine (GE) · 111 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_screenshotCreator` : `extensions.load("util_screenshotCreator")`, puis la globale `util_screenshotCreator`

Point d'entrée de l'outil interne de génération de vignettes (thumbnails) de véhicules. Ce fichier est une façade : il déclare comme dépendances tous les sous-modules util_screenshotCreator_* (interface ImGui, réglages, cadrage, capture, job de traitement par lots, etc.) et délègue vers eux. Il sert à ouvrir la fenêtre de l'outil, lancer la génération par lots, cadrer un véhicule, prendre une capture hors écran et choisir le mode de cadrage.

## Exemple

```lua
extensions.load('util_screenshotCreator')
extensions.util_screenshotCreator.openWindow()
```

## Remarques

- Dans takeThumbnailScreenshot, la résolution, le sur-échantillonnage, le champ de vision et le plan proche viennent des réglages de util_screenshotCreator_settings et non d'arguments.
- Le champ state.show n'est pas utilisé dans ce fichier.

**Dépendances (chargées avant) :** `ui_imgui`, `ui_imguiUtils`, `ui_vehicleSelector_tileGrouping`, `render_renderViews`, `core_vehicle_manager`, `util_screenshotCreator_settings`, `util_screenshotCreator_shippedConfigs`, `util_screenshotCreator_thumbnailConfig`, `util_screenshotCreator_nodeOutpaint`, `util_screenshotCreator_vehicleSetup`, `util_screenshotCreator_capture`, `util_screenshotCreator_framing_legacy`, `util_screenshotCreator_framing_isometric`, `util_screenshotCreator_framing_procedural`, `util_screenshotCreator_framing_configured`, `util_screenshotCreator_framingManager`, `util_screenshotCreator_modelSelection`, `util_screenshotCreator_job`, `util_screenshotCreator_thumbnailPaths`, `util_screenshotCreator_thumbnailTargets`, `util_screenshotCreator_thumbnailCapturePipeline`, `util_screenshotCreator_currentConfigThumbnail`, `util_screenshotCreator_ui`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_screenshotCreator.frameVehicle(vehicle, fov, nearPlane, aspectRatio, resolution, configName)` | Calcule la position et l'orientation de caméra qui cadrent un véhicule avec le cadrage procédural, d'après le contexte de cadrage des réglages. | 43 |
| `util_screenshotCreator.getFramingMode()` | Renvoie l'identifiant du mode de cadrage sélectionné. | 101 |
| `util_screenshotCreator.listFramingModes()` | Liste les modes de cadrage disponibles (délègue à util_screenshotCreator_framingManager.listModes). | 98 |
| `util_screenshotCreator.onDeserialized(data)` | Hook appelé après un rechargement d'extensions : si les données contiennent un état d'interface (windowOpen, resolutionPtr, reviewData ou skipCustomCameras), les transmet à util_screenshotCreator_ui.onDeserialized. *(interne)* *(hook)* | 76 |
| `util_screenshotCreator.onExtensionUnloaded()` | Hook appelé au déchargement : restaure l'environnement modifié par les réglages (restoreEnvironment) et logue le déchargement. *(interne)* *(hook)* | 87 |
| `util_screenshotCreator.openWindow()` | Ouvre la fenêtre ImGui de l'outil (délègue à util_screenshotCreator_ui.openWindow). | 35 |
| `util_screenshotCreator.setFramingMode(modeId)` | Sélectionne le mode de cadrage. | 104 |
| `util_screenshotCreator.startWork(workOptions)` | Démarre la génération de vignettes par lots (délègue à util_screenshotCreator_job.startWork). | 39 |
| `util_screenshotCreator.takeThumbnailScreenshot(filepath, camera, callback, uniqueId)` | Prend une capture hors écran depuis la caméra donnée et l'enregistre dans filepath (délègue à util_screenshotCreator_capture), avec les paramètres de capture des réglages. | 60 |

### Détail des paramètres

#### `util_screenshotCreator.frameVehicle(vehicle, fov, nearPlane, aspectRatio, resolution, configName)`

Calcule la position et l'orientation de caméra qui cadrent un véhicule avec le cadrage procédural, d'après le contexte de cadrage des réglages.

- `vehicle` (*userdata*) : Objet véhicule à cadrer
- `fov` (*number|nil*) : Champ de vision en degrés (défaut : valeur des réglages)
- `nearPlane` (*number|nil*) : Plan proche de la caméra (défaut : réglages)
- `aspectRatio` (*number|nil*) : Rapport largeur/hauteur (défaut : réglages)
- `resolution` (*table|nil*) : Résolution {largeur, hauteur} utilisée pour le contexte de cadrage
- `configName` (*string|nil*) : Nom de la configuration du véhicule
- **renvoie** : vec3|nil Position de la caméra
- **renvoie** : quat|nil Rotation de la caméra
- **renvoie** : table|nil Données de cadrage (framingData)

#### `util_screenshotCreator.getFramingMode()`

Renvoie l'identifiant du mode de cadrage sélectionné.

- **renvoie** : string Identifiant du mode

#### `util_screenshotCreator.listFramingModes()`

Liste les modes de cadrage disponibles (délègue à util_screenshotCreator_framingManager.listModes).

- **renvoie** : table Modes de cadrage enregistrés

#### `util_screenshotCreator.onDeserialized(data)`

Hook appelé après un rechargement d'extensions : si les données contiennent un état d'interface (windowOpen, resolutionPtr, reviewData ou skipCustomCameras), les transmet à util_screenshotCreator_ui.onDeserialized.

- `data` (*table|nil*) : Données sauvegardées par la sérialisation

#### `util_screenshotCreator.openWindow()`

Ouvre la fenêtre ImGui de l'outil (délègue à util_screenshotCreator_ui.openWindow).

- **renvoie** : any Valeur renvoyée par util_screenshotCreator_ui.openWindow

#### `util_screenshotCreator.setFramingMode(modeId)`

Sélectionne le mode de cadrage.

- `modeId` (*string*) : Identifiant du mode (par exemple « fixedIsometric » ou « configured »)
- **renvoie** : any Valeur renvoyée par framingManager.setSelectedModeId

#### `util_screenshotCreator.startWork(workOptions)`

Démarre la génération de vignettes par lots (délègue à util_screenshotCreator_job.startWork).

- `workOptions` (*table*) : Options du traitement (déduit du code : transmises telles quelles au module job)
- **renvoie** : any Valeur renvoyée par util_screenshotCreator_job.startWork

#### `util_screenshotCreator.takeThumbnailScreenshot(filepath, camera, callback, uniqueId)`

Prend une capture hors écran depuis la caméra donnée et l'enregistre dans filepath (délègue à util_screenshotCreator_capture), avec les paramètres de capture des réglages.

- `filepath` (*string*) : Chemin du fichier image à écrire
- `camera` (*table*) : Caméra {pos, rot, fov?, nearPlane?, screenshotDelay?}
- `callback` (*function|nil*) : Appelé à la fin de la capture
- `uniqueId` (*any*) : Identifiant transmis au module de capture

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Liste des extensions util_screenshotCreator_* chargées avec celle-ci |
| `state` | table | État du module, initialement {show = false} |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/screenshotCreator.lua`.*
