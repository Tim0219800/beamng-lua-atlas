# `career_modules_missionWrapper`

*Fichier : `lua/ge/extensions/career/modules/missionWrapper.lua` · VM : Game Engine (GE) · 98 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_missionWrapper` : `extensions.load("career_modules_missionWrapper")`, puis la globale `career_modules_missionWrapper`

**Dépendances (chargées avant) :** `career_career`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_missionWrapper.cacheMissionData(id, dirtyDate)` |  | 46 |
| `career_modules_missionWrapper.onAnyMissionChanged(state, mission)` | *(hook)* | 59 |
| `career_modules_missionWrapper.onExtensionLoaded()` | *(hook)* | 20 |
| `career_modules_missionWrapper.onExtensionUnloaded()` | *(hook)* | 27 |
| `career_modules_missionWrapper.onMissionLoaded(id, dirtyDate)` | *(hook)* | 50 |
| `career_modules_missionWrapper.onSaveCurrentProfile(currentSavePath)` | this should only be loaded when the career is active *(hook)* | 33 |
| `career_modules_missionWrapper.onVehicleSaveFinished()` | *(hook)* | 69 |
| `career_modules_missionWrapper.preMissionHandling(step, task)` |  | 76 |
| `career_modules_missionWrapper.saveMission(id)` |  | 54 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/missionWrapper.lua`.*
