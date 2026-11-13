# `gameplay_rally_compositors_helpers_calibrationOverrides`

*Fichier : `lua/ge/extensions/gameplay/rally/compositors/helpers/calibrationOverrides.lua` · VM : Game Engine (GE) · 173 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_compositors_helpers_calibrationOverrides` : `extensions.load("gameplay_rally_compositors_helpers_calibrationOverrides")`, puis la globale `gameplay_rally_compositors_helpers_calibrationOverrides`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_compositors_helpers_calibrationOverrides.applyBoundariesToList(list, key, boundaries)` |  | 75 |
| `gameplay_rally_compositors_helpers_calibrationOverrides.applyToConfig(config, compositorName, missionDir)` |  | 143 |
| `gameplay_rally_compositors_helpers_calibrationOverrides.boundariesFromList(list, key)` |  | 39 |
| `gameplay_rally_compositors_helpers_calibrationOverrides.calibrationFile(missionDir)` |  | 17 |
| `gameplay_rally_compositors_helpers_calibrationOverrides.load(missionDir)` |  | 87 |
| `gameplay_rally_compositors_helpers_calibrationOverrides.save(missionDir, data)` |  | 101 |
| `gameplay_rally_compositors_helpers_calibrationOverrides.setBoundaries(missionDir, compositorName, groupName, key, boundaries)` |  | 126 |
| `gameplay_rally_compositors_helpers_calibrationOverrides.setLengthBoundaries(missionDir, compositorName, intensityName, boundaries)` |  | 134 |
| `gameplay_rally_compositors_helpers_calibrationOverrides.validateBoundaries(boundaries, expectedCount)` |  | 59 |

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/compositors/helpers/calibrationOverrides.lua`.*
