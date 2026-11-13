# `util_screenshotCreator_thumbnailConfig`

*Fichier : `lua/ge/extensions/util/screenshotCreator/thumbnailConfig.lua` · VM : Game Engine (GE) · 143 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_screenshotCreator_thumbnailConfig` : `extensions.load("util_screenshotCreator_thumbnailConfig")`, puis la globale `util_screenshotCreator_thumbnailConfig`

**Dépendances (chargées avant) :** `core_camera`, `core_vehicles`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_screenshotCreator_thumbnailConfig.getCameraConfig(modelName, configName)` |  | 54 |
| `util_screenshotCreator_thumbnailConfig.getCameraOffsets(configName, vehicle)` |  | 116 |
| `util_screenshotCreator_thumbnailConfig.getLevelAxes(bb)` | vehicle box axes levelled to world up (heading kept), so a tilted spawn cannot tilt the camera | 95 |
| `util_screenshotCreator_thumbnailConfig.getPauseDelay(modelName, configName)` |  | 83 |
| `util_screenshotCreator_thumbnailConfig.getReferenceAxes(vehicle, configName, boundingBox)` |  | 104 |
| `util_screenshotCreator_thumbnailConfig.getRotation(modelName, configName)` |  | 72 |
| `util_screenshotCreator_thumbnailConfig.rewindCameraOffsets(posOffset, rotOffset, vehicle, configName)` |  | 132 |
| `util_screenshotCreator_thumbnailConfig.saveModelConfig(modelName, config)` |  | 41 |
| `util_screenshotCreator_thumbnailConfig.saveVehicleConfig(modelName, configName, config)` |  | 27 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/screenshotCreator/thumbnailConfig.lua`.*
