# `editor_drivePathEditor_record`

*Fichier : `lua/ge/extensions/editor/drivePathEditor/record.lua` · VM : Game Engine (GE) · 151 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_drivePathEditor_record` : `extensions.load("editor_drivePathEditor_record")`, puis la globale `editor_drivePathEditor_record`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_drivePathEditor_record.getRecordingTime()` | Gets the current playback time. | 36 |
| `editor_drivePathEditor_record.handleRecord()` | Handles recording of the current vehicle. | 39 |
| `editor_drivePathEditor_record.startRecord(vehicle)` | Starts recording with the given vehicle. | 64 |
| `editor_drivePathEditor_record.stopRecord(sceneVehicles)` | Stops recording with the given vehicle. | 86 |

## Appels vers le moteur (C++)

- `be:` `enterVehicle`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/drivePathEditor/record.lua`.*
