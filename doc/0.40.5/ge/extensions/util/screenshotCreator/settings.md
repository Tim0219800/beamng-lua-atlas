# `util_screenshotCreator_settings`

*Fichier : `lua/ge/extensions/util/screenshotCreator/settings.lua` · VM : Game Engine (GE) · 1055 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_screenshotCreator_settings` : `extensions.load("util_screenshotCreator_settings")`, puis la globale `util_screenshotCreator_settings`

**Dépendances (chargées avant) :** `ui_imgui`, `core_camera`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_screenshotCreator_settings.addVehicleMargin(margin)` |  | 205 |
| `util_screenshotCreator_settings.applyEnvironment(options)` |  | 429 |
| `util_screenshotCreator_settings.applyEnvironmentSnapshot(snapshot)` |  | 441 |
| `util_screenshotCreator_settings.applyExposure()` |  | 375 |
| `util_screenshotCreator_settings.applyLicensePlates()` |  | 388 |
| `util_screenshotCreator_settings.applyLowBeams(vehicle, enabled)` |  | 949 |
| `util_screenshotCreator_settings.applyReflections()` |  | 382 |
| `util_screenshotCreator_settings.beginWork(options)` |  | 612 |
| `util_screenshotCreator_settings.deserialize(data)` |  | 875 |
| `util_screenshotCreator_settings.drawCameraOverlay(fovOverride)` |  | 782 |
| `util_screenshotCreator_settings.drawLightingControls()` |  | 340 |
| `util_screenshotCreator_settings.drawOutput(options)` |  | 646 |
| `util_screenshotCreator_settings.drawOutputControls(options)` |  | 646 |
| `util_screenshotCreator_settings.drawOverlayControls()` |  | 760 |
| `util_screenshotCreator_settings.drawOverlays(fovOverride)` |  | 782 |
| `util_screenshotCreator_settings.finishWork()` |  | 616 |
| `util_screenshotCreator_settings.getCaptureContext()` |  | 545 |
| `util_screenshotCreator_settings.getControls()` |  | 980 |
| `util_screenshotCreator_settings.getCurrentResolution()` |  | 239 |
| `util_screenshotCreator_settings.getDefaults()` |  | 1005 |
| `util_screenshotCreator_settings.getDynamicReflectionQualities()` |  | 1012 |
| `util_screenshotCreator_settings.getEnvironmentSnapshot()` |  | 486 |
| `util_screenshotCreator_settings.getFramingContext(resolution)` |  | 524 |
| `util_screenshotCreator_settings.getFramingDefaults()` |  | 1007 |
| `util_screenshotCreator_settings.getFramingMargin(resolution)` |  | 517 |
| `util_screenshotCreator_settings.getJobSettings(options)` |  | 572 |
| `util_screenshotCreator_settings.getLightingRig()` |  | 300 |
| `util_screenshotCreator_settings.getMarginTarget(index)` |  | 200 |
| `util_screenshotCreator_settings.getOutputControls()` |  | 981 |
| `util_screenshotCreator_settings.getOutputDestinations()` |  | 1008 |
| `util_screenshotCreator_settings.getRenderControls()` |  | 991 |
| `util_screenshotCreator_settings.getResolutions()` |  | 1009 |
| `util_screenshotCreator_settings.getSafeMargins()` |  | 1010 |
| `util_screenshotCreator_settings.getThumbnailConfig()` |  | 1006 |
| `util_screenshotCreator_settings.getThumbnailResolution()` |  | 234 |
| `util_screenshotCreator_settings.getVehicleSafeMargin()` |  | 1011 |
| `util_screenshotCreator_settings.isDefaultConfig()` |  | 499 |
| `util_screenshotCreator_settings.isThumbnailConfigGood()` |  | 512 |
| `util_screenshotCreator_settings.onClientEndMission()` | *(hook)* | 968 |
| `util_screenshotCreator_settings.onClientPostStartMission()` | *(hook)* | 961 |
| `util_screenshotCreator_settings.onDeserialized(data)` | *(hook)* | 875 |
| `util_screenshotCreator_settings.onExit()` | *(hook)* | 968 |
| `util_screenshotCreator_settings.onExtensionLoaded()` | *(hook)* | 956 |
| `util_screenshotCreator_settings.onExtensionUnloaded()` | *(hook)* | 968 |
| `util_screenshotCreator_settings.onSerialize()` | *(hook)* | 837 |
| `util_screenshotCreator_settings.resetToDefaults()` |  | 262 |
| `util_screenshotCreator_settings.restoreEnvironment()` |  | 491 |
| `util_screenshotCreator_settings.scaleMargin(margin, resolution)` |  | 219 |
| `util_screenshotCreator_settings.serialize()` |  | 837 |
| `util_screenshotCreator_settings.setImageResolution(width, height)` |  | 247 |
| `util_screenshotCreator_settings.setPreviewResolution(enabled)` |  | 620 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLineInstance`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/screenshotCreator/settings.lua`.*
