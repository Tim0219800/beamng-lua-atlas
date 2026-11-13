# `util_screenshotCreator_job`

*Fichier : `lua/ge/extensions/util/screenshotCreator/job.lua` · VM : Game Engine (GE) · 860 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_screenshotCreator_job` : `extensions.load("util_screenshotCreator_job")`, puis la globale `util_screenshotCreator_job`

**Dépendances (chargées avant) :** `core_camera`, `core_vehicles`, `core_vehicle_manager`, `ui_vehicleSelector_general`, `util_screenshotCreator_settings`, `util_screenshotCreator_thumbnailConfig`, `util_screenshotCreator_vehicleSetup`, `util_screenshotCreator_capture`, `util_screenshotCreator_lightingSetup`, `util_screenshotCreator_framing_configured`, `util_screenshotCreator_framingManager`, `util_screenshotCreator_modelSelection`, `util_screenshotCreator_shippedConfigs`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_screenshotCreator_job.clearRunDone()` |  | 810 |
| `util_screenshotCreator_job.consumeRunDone()` |  | 804 |
| `util_screenshotCreator_job.getProgress()` |  | 846 |
| `util_screenshotCreator_job.getReviewData()` |  | 847 |
| `util_screenshotCreator_job.isCameraSet()` |  | 851 |
| `util_screenshotCreator_job.isRunning()` |  | 845 |
| `util_screenshotCreator_job.onClientEndMission()` | *(hook)* | 833 |
| `util_screenshotCreator_job.onDeserialized(data)` | *(hook)* | 824 |
| `util_screenshotCreator_job.onExit()` | *(hook)* | 833 |
| `util_screenshotCreator_job.onExtensionUnloaded()` | *(hook)* | 833 |
| `util_screenshotCreator_job.onPreRender()` | *(hook)* | 785 |
| `util_screenshotCreator_job.onSerialize()` | *(hook)* | 814 |
| `util_screenshotCreator_job.resetCamera()` |  | 117 |
| `util_screenshotCreator_job.startPreview(vehicle, configName, modeOrOptions, fixedRotation)` |  | 765 |
| `util_screenshotCreator_job.startPreviewWithDelay(vehicle, configName, modeOrOptions, fixedRotation)` |  | 769 |
| `util_screenshotCreator_job.startWork(workOptions)` |  | 654 |
| `util_screenshotCreator_job.stop()` |  | 779 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Appels vers le moteur (C++)

- `Engine.` `getStartingArgs`
- `FS:` `copyFile`, `directoryCreate`, `fileExists`, `fileSize`, `removeFile`
- `be:` `getPhysicsRunning`, `getPhysicsSpeedFactor`, `setPhysicsRunning`, `setPhysicsSpeedFactor`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/screenshotCreator/job.lua`.*
