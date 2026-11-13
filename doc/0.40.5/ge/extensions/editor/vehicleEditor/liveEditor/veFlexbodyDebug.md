# `editor_vehicleEditor_liveEditor_veFlexbodyDebug`

*Fichier : `lua/ge/extensions/editor/vehicleEditor/liveEditor/veFlexbodyDebug.lua` · VM : Game Engine (GE) · 1171 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_vehicleEditor_liveEditor_veFlexbodyDebug` : `extensions.load("editor_vehicleEditor_liveEditor_veFlexbodyDebug")`, puis la globale `editor_vehicleEditor_liveEditor_veFlexbodyDebug`

**Dépendances (chargées avant) :** `editor_veMain`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_vehicleEditor_liveEditor_veFlexbodyDebug.onDeserialized(data)` | *(hook)* | 1157 |
| `editor_vehicleEditor_liveEditor_veFlexbodyDebug.onSerialize()` | *(hook)* | 1151 |
| `editor_vehicleEditor_liveEditor_veFlexbodyDebug.onUpdate(dt)` | *(hook)* | 1108 |
| `editor_vehicleEditor_liveEditor_veFlexbodyDebug.onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw)` | *(hook)* | 622 |
| `editor_vehicleEditor_liveEditor_veFlexbodyDebug.onVehicleSpawned(id)` | *(hook)* | 1143 |
| `editor_vehicleEditor_liveEditor_veFlexbodyDebug.onVehicleSwitched(oldVehicle, newVehicle, player)` | *(hook)* | 1139 |
| `editor_vehicleEditor_liveEditor_veFlexbodyDebug.open()` |  | 1147 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |
| `menuEntry` | string |  |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/vehicleEditor/liveEditor/veFlexbodyDebug.lua`.*
