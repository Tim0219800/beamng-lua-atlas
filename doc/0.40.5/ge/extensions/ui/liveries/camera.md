# `ui_liveries_camera`

*Fichier : `lua/ge/extensions/ui/liveries/camera.lua` · VM : Game Engine (GE) · 467 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_liveries_camera` : `extensions.load("ui_liveries_camera")`, puis la globale `ui_liveries_camera`

**Dépendances (chargées avant) :** `editor_api_dynamicDecals`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_liveries_camera.activateOrbitMode()` |  | 157 |
| `ui_liveries_camera.ensureTransformOrbitMode()` |  | 383 |
| `ui_liveries_camera.getViews()` |  | 137 |
| `ui_liveries_camera.moveLeftRight(value, filterType, player)` |  | 456 |
| `ui_liveries_camera.orbitToLayer(layerUid)` | orbit camera framing for a decal layer: preset side when orthographic, otherwise the layer's angle | 246 |
| `ui_liveries_camera.panToLayer(layerUid)` |  | 232 |
| `ui_liveries_camera.panUpDown(value, filterType, player)` |  | 438 |
| `ui_liveries_camera.previewLayer(layerUid)` | snaps orthographic placements to their preset, otherwise restores the exact angle | 265 |
| `ui_liveries_camera.setView(viewId)` |  | 145 |
| `ui_liveries_camera.setup()` |  | 112 |
| `ui_liveries_camera.startTransform()` |  | 329 |
| `ui_liveries_camera.startTransformAtLayer(layerUid)` |  | 300 |
| `ui_liveries_camera.stopTransform()` |  | 404 |
| `ui_liveries_camera.teardown()` |  | 121 |
| `ui_liveries_camera.toggleTransformCameraMode()` |  | 387 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/liveries/camera.lua`.*
