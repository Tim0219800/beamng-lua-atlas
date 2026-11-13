# `editor_vehicleEditor_liveEditor_vePropTransformer`

*Fichier : `lua/ge/extensions/editor/vehicleEditor/liveEditor/vePropTransformer.lua` · VM : Game Engine (GE) · 573 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_vehicleEditor_liveEditor_vePropTransformer` : `extensions.load("editor_vehicleEditor_liveEditor_vePropTransformer")`, puis la globale `editor_vehicleEditor_liveEditor_vePropTransformer`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_vehicleEditor_liveEditor_vePropTransformer.onDeserialized(data)` | *(hook)* | 560 |
| `editor_vehicleEditor_liveEditor_vePropTransformer.onSerialize()` | *(hook)* | 554 |
| `editor_vehicleEditor_liveEditor_vePropTransformer.onUpdate(dt)` | *(hook)* | 452 |
| `editor_vehicleEditor_liveEditor_vePropTransformer.onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw)` | *(hook)* | 433 |
| `editor_vehicleEditor_liveEditor_vePropTransformer.onVehicleSpawned(id)` | *(hook)* | 545 |
| `editor_vehicleEditor_liveEditor_vePropTransformer.onVehicleSwitched(oldVehicle, newVehicle, player)` | *(hook)* | 541 |
| `editor_vehicleEditor_liveEditor_vePropTransformer.open()` |  | 550 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `menuEntry` | string |  |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawSphere`, `drawTextAdvanced`, `drawTriSolid`
- `worldEditorCppApi.` `setAxisGizmoRenderMoveGrid`, `setAxisGizmoRenderPlane`, `setAxisGizmoRenderPlaneHashes`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/vehicleEditor/liveEditor/vePropTransformer.lua`.*
