# `util_screenshotCreator_thumbnailCapturePipeline`

*Fichier : `lua/ge/extensions/util/screenshotCreator/thumbnailCapturePipeline.lua` · VM : Game Engine (GE) · 137 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_screenshotCreator_thumbnailCapturePipeline` : `extensions.load("util_screenshotCreator_thumbnailCapturePipeline")`, puis la globale `util_screenshotCreator_thumbnailCapturePipeline`

**Dépendances (chargées avant) :** `core_vehicles`, `core_camera`, `util_screenshotCreator_settings`, `util_screenshotCreator_vehicleSetup`, `util_screenshotCreator_capture`, `util_screenshotCreator_lightingSetup`, `util_screenshotCreator_framing_legacy`, `util_screenshotCreator_framingManager`, `util_screenshotCreator_thumbnailPaths`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_screenshotCreator_thumbnailCapturePipeline.processWorkItem(item, index, total, settingsSnapshot, runContext, options)` |  | 65 |
| `util_screenshotCreator_thumbnailCapturePipeline.resetRenderState()` |  | 128 |
| `util_screenshotCreator_thumbnailCapturePipeline.resolveCamera(vehicle, modelName, configName, outputResolution)` | "Warehouse angle" framing with slightly tighter margins, saved config/model cameras are ignored | 45 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Appels vers le moteur (C++)

- `FS:` `copyFile`
- `be:` `getPhysicsRunning`, `setPhysicsRunning`, `setPhysicsSpeedFactor`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/screenshotCreator/thumbnailCapturePipeline.lua`.*
