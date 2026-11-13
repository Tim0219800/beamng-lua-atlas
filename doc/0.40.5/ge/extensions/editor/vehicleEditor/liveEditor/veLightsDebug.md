# `editor_vehicleEditor_liveEditor_veLightsDebug`

*Fichier : `lua/ge/extensions/editor/vehicleEditor/liveEditor/veLightsDebug.lua` · VM : Game Engine (GE) · 159 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_vehicleEditor_liveEditor_veLightsDebug` : `extensions.load("editor_vehicleEditor_liveEditor_veLightsDebug")`, puis la globale `editor_vehicleEditor_liveEditor_veLightsDebug`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_vehicleEditor_liveEditor_veLightsDebug.onDeserialized(data)` | *(hook)* | 147 |
| `editor_vehicleEditor_liveEditor_veLightsDebug.onSerialize()` | *(hook)* | 141 |
| `editor_vehicleEditor_liveEditor_veLightsDebug.onUpdate()` | *(hook)* | 123 |
| `editor_vehicleEditor_liveEditor_veLightsDebug.onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw)` | *(hook)* | 32 |
| `editor_vehicleEditor_liveEditor_veLightsDebug.open()` |  | 137 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `menuEntry` | string |  |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawSphere`, `drawTextAdvanced`, `drawTriSolid`, `setSolidTriCulling`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/vehicleEditor/liveEditor/veLightsDebug.lua`.*
