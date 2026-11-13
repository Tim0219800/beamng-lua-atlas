# `util_screenshotCreator_thumbnailComposerRun`

*Fichier : `lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua` · VM : Game Engine (GE) · 569 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_screenshotCreator_thumbnailComposerRun` : `extensions.load("util_screenshotCreator_thumbnailComposerRun")`, puis la globale `util_screenshotCreator_thumbnailComposerRun`

**Dépendances (chargées avant) :** `ui_imgui`, `util_screenshotCreator_settings`, `util_screenshotCreator_lightingSetup`, `util_screenshotCreator_thumbnailCapturePipeline`, `util_screenshotCreator_thumbnailConfig`, `util_screenshotCreator_thumbnailPaths`, `util_screenshotCreator_thumbnailTargets`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_screenshotCreator_thumbnailComposerRun.cancel(ownerId)` |  | 385 |
| `util_screenshotCreator_thumbnailComposerRun.drawShowroomTools()` |  | 542 |
| `util_screenshotCreator_thumbnailComposerRun.isActive(ownerId)` |  | 392 |
| `util_screenshotCreator_thumbnailComposerRun.onExtensionUnloaded()` | *(hook)* | 415 |
| `util_screenshotCreator_thumbnailComposerRun.onPreRender()` | *(hook)* | 397 |
| `util_screenshotCreator_thumbnailComposerRun.sendStatus(ownerId, handlers)` |  | 311 |
| `util_screenshotCreator_thumbnailComposerRun.setViewOptions(message)` |  | 85 |
| `util_screenshotCreator_thumbnailComposerRun.start(ownerId, message, handlers)` | message: targets (nil captures the player vehicle), captureMode ("defaults" writes default.jpg, otherwise<br> one file per config), missingOnly, outputWidth/outputHeight and the blur/exposure view options | 335 |
| `util_screenshotCreator_thumbnailComposerRun.startPreview(message)` |  | 159 |
| `util_screenshotCreator_thumbnailComposerRun.stopPreview()` |  | 152 |
| `util_screenshotCreator_thumbnailComposerRun.subscribe(ownerId, handlers)` |  | 324 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |
| `onClientEndMission` | any |  |
| `onExit` | any |  |

## Appels vers le moteur (C++)

- `Engine.` `castRay`
- `be:` `getPhysicsRunning`, `getPhysicsSpeedFactor`, `setPhysicsRunning`, `setPhysicsSpeedFactor`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua`.*
