# `editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector`

*Fichier : `lua/ge/extensions/editor/vehicleEditor/liveEditor/veNodeTriSelfCollisionDetector.lua` · VM : Game Engine (GE) · 227 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector` : `extensions.load("editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector")`, puis la globale `editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector.onDeserialized(data)` | *(hook)* | 213 |
| `editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector.onSerialize()` | *(hook)* | 205 |
| `editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector.onUpdate()` | *(hook)* | 177 |
| `editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector.onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw)` | *(hook)* | 40 |
| `editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector.open()` |  | 201 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `menuEntry` | string |  |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawText`, `drawTriSolid`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/vehicleEditor/liveEditor/veNodeTriSelfCollisionDetector.lua`.*
