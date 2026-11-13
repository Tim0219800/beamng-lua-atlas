# `util_screenshotCreator`

*Fichier : `lua/ge/extensions/util/screenshotCreator.lua` · VM : Game Engine (GE) · 111 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_screenshotCreator` : `extensions.load("util_screenshotCreator")`, puis la globale `util_screenshotCreator`

**Dépendances (chargées avant) :** `ui_imgui`, `ui_imguiUtils`, `ui_vehicleSelector_tileGrouping`, `render_renderViews`, `core_vehicle_manager`, `util_screenshotCreator_settings`, `util_screenshotCreator_shippedConfigs`, `util_screenshotCreator_thumbnailConfig`, `util_screenshotCreator_nodeOutpaint`, `util_screenshotCreator_vehicleSetup`, `util_screenshotCreator_capture`, `util_screenshotCreator_framing_legacy`, `util_screenshotCreator_framing_isometric`, `util_screenshotCreator_framing_procedural`, `util_screenshotCreator_framing_configured`, `util_screenshotCreator_framingManager`, `util_screenshotCreator_modelSelection`, `util_screenshotCreator_job`, `util_screenshotCreator_thumbnailPaths`, `util_screenshotCreator_thumbnailTargets`, `util_screenshotCreator_thumbnailCapturePipeline`, `util_screenshotCreator_currentConfigThumbnail`, `util_screenshotCreator_ui`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_screenshotCreator.frameVehicle(vehicle, fov, nearPlane, aspectRatio, resolution, configName)` |  | 43 |
| `util_screenshotCreator.getFramingMode()` |  | 101 |
| `util_screenshotCreator.listFramingModes()` |  | 98 |
| `util_screenshotCreator.onDeserialized(data)` | *(hook)* | 76 |
| `util_screenshotCreator.onExtensionUnloaded()` | *(hook)* | 87 |
| `util_screenshotCreator.openWindow()` |  | 35 |
| `util_screenshotCreator.setFramingMode(modeId)` |  | 104 |
| `util_screenshotCreator.startWork(workOptions)` |  | 39 |
| `util_screenshotCreator.takeThumbnailScreenshot(filepath, camera, callback, uniqueId)` |  | 60 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |
| `state` | table |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/screenshotCreator.lua`.*
