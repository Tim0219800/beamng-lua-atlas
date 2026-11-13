# `editor_vehicleEditor_liveEditor_veJBeamPicker`

*Fichier : `lua/ge/extensions/editor/vehicleEditor/liveEditor/veJBeamPicker.lua` · VM : Game Engine (GE) · 805 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_vehicleEditor_liveEditor_veJBeamPicker` : `extensions.load("editor_vehicleEditor_liveEditor_veJBeamPicker")`, puis la globale `editor_vehicleEditor_liveEditor_veJBeamPicker`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_vehicleEditor_liveEditor_veJBeamPicker.onDeserialized(data)` | *(hook)* | 790 |
| `editor_vehicleEditor_liveEditor_veJBeamPicker.onEditorInitialized()` | *(hook)* | 776 |
| `editor_vehicleEditor_liveEditor_veJBeamPicker.onSerialize()` | *(hook)* | 784 |
| `editor_vehicleEditor_liveEditor_veJBeamPicker.onUpdate(dt)` | *(hook)* | 733 |
| `editor_vehicleEditor_liveEditor_veJBeamPicker.onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw)` | *(hook)* | 720 |
| `editor_vehicleEditor_liveEditor_veJBeamPicker.open()` |  | 772 |
| `editor_vehicleEditor_liveEditor_veJBeamPicker.requestDrawnBeamsCallback(beams, scale)` |  | 172 |
| `editor_vehicleEditor_liveEditor_veJBeamPicker.requestDrawnNodesCallback(nodes, scale)` |  | 165 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `beamDataFromVELua` | table |  |
| `menuEntry` | string |  |
| `nodeDataFromVELua` | table |  |

## Appels vers le moteur (C++)

- `be:` `getEnabled`, `queueObjectFastLua`
- `debugDrawer:` `drawCylinder`, `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/vehicleEditor/liveEditor/veJBeamPicker.lua`.*
