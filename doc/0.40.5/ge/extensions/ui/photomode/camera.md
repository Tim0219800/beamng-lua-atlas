# `ui_photomode_camera`

*Fichier : `lua/ge/extensions/ui/photomode/camera.lua` · VM : Game Engine (GE) · 1380 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_photomode_camera` : `extensions.load("ui_photomode_camera")`, puis la globale `ui_photomode_camera`

**Dépendances (chargées avant) :** `ui_photomode_shared`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_photomode_camera.activateSessionFreeCamera()` |  | 485 |
| `ui_photomode_camera.applyPresetState(state)` |  | 1225 |
| `ui_photomode_camera.buildMetadataState()` |  | 784 |
| `ui_photomode_camera.buildState()` |  | 751 |
| `ui_photomode_camera.captureDefaultPresetState()` |  | 1207 |
| `ui_photomode_camera.captureNodeGrabberRestoreState()` |  | 436 |
| `ui_photomode_camera.capturePresetState(options)` |  | 1170 |
| `ui_photomode_camera.captureRestoreState()` |  | 467 |
| `ui_photomode_camera.getCameraState()` |  | 1166 |
| `ui_photomode_camera.getTemporaryPresetList()` |  | 1314 |
| `ui_photomode_camera.resetCameraDefaults()` |  | 1129 |
| `ui_photomode_camera.restoreCameraBookmark(bookmark)` |  | 985 |
| `ui_photomode_camera.restoreNodeGrabberState()` |  | 452 |
| `ui_photomode_camera.restoreSavedFreeCameraBookmark()` |  | 1106 |
| `ui_photomode_camera.restoreSavedRelativeCameraBookmark()` |  | 1117 |
| `ui_photomode_camera.restoreSessionCameraTransformState()` |  | 797 |
| `ui_photomode_camera.restoreState()` |  | 703 |
| `ui_photomode_camera.saveCurrentCameraBookmark()` |  | 899 |
| `ui_photomode_camera.setCameraExposureState(partialState)` |  | 930 |
| `ui_photomode_camera.setCameraFov(value)` |  | 914 |
| `ui_photomode_camera.setCameraRoll(value)` |  | 969 |
| `ui_photomode_camera.setCameraSmoothMovement(value)` |  | 1349 |
| `ui_photomode_camera.setCameraSpeed(value)` |  | 953 |
| `ui_photomode_camera.setNodeGrabberVisible(value)` |  | 1329 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Appels vers le moteur (C++)

- `scenetree.` `findClassObjects`, `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/photomode/camera.lua`.*
