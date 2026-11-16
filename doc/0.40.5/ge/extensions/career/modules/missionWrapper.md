# `career_modules_missionWrapper`

*File: `lua/ge/extensions/career/modules/missionWrapper.lua` · VM: Game Engine (GE) · 98 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_missionWrapper`: `extensions.load("career_modules_missionWrapper")`, then the global `career_modules_missionWrapper`

Links the mission system (gameplay_missions_*) with the career save. Mission progress data is stored in <save>/career/missions/; the module tracks "dirty" (modified) missions and writes them on each profile save. It also triggers a save before and after a mission if autosave is active.

## Notes

- On extension unload, the mission save path is reset to nil and the whole mission system is reloaded.
- If a mission save fails (saveMissionSaveData returns false), career_saveSystem.saveFailed() is called.
- At the end of a mission (stopped state), the player state is reset (career_modules_playerDriving.resetPlayerState).
- init, setMissionInfo and the task parameter of preMissionHandling are useless; `dirtyDate` is an ISO UTC date (os.date("!%Y-%m-%dT%H:%M:%SZ")) by default.

**Dependencies (loaded first):** `career_career`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_missionWrapper.cacheMissionData(id, dirtyDate)` | Marks the mission as modified (to be saved) with the given date or the current UTC date. | 46 |
| `career_modules_missionWrapper.onAnyMissionChanged(state, mission)` | Hook: in the "stopped" state, resets the player state and, if autosave is active, saves the mission. *(internal)* *(hook)* | 59 |
| `career_modules_missionWrapper.onExtensionLoaded()` | Hook: if the career is active, sets the mission save path and reloads the mission system (returns false otherwise). *(internal)* *(hook)* | 20 |
| `career_modules_missionWrapper.onExtensionUnloaded()` | Hook: removes the mission save path and reloads the mission system. *(internal)* *(hook)* | 27 |
| `career_modules_missionWrapper.onMissionLoaded(id, dirtyDate)` | Hook called when a mission's data is loaded: registers it as tracked. *(internal)* *(hook)* | 50 |
| `career_modules_missionWrapper.onSaveCurrentProfile(currentSavePath)` | Save hook: writes the data of each modified mission to career/missions/. *(internal)* *(hook)* | 33 |
| `career_modules_missionWrapper.onVehicleSaveFinished()` | Hook called when the vehicle save is finished: unblocks the pending mission start step. *(internal)* *(hook)* | 69 |
| `career_modules_missionWrapper.preMissionHandling(step, task)` | Step called before a mission starts: if autosave is active, saves and waits for onVehicleSaveFinished to set step.handlingComplete = true; otherwise marks the step as complete right away. | 76 |
| `career_modules_missionWrapper.saveMission(id)` | Marks the mission as modified and starts a full career save (career_saveSystem.saveCurrent). | 54 |

### Parameter details

#### `career_modules_missionWrapper.cacheMissionData(id, dirtyDate)`

Marks the mission as modified (to be saved) with the given date or the current UTC date.

- `id` (*string*) : Mission identifier.
- `dirtyDate` (*string|nil*) : ISO 8601 date, now by default.

#### `career_modules_missionWrapper.onAnyMissionChanged(state, mission)`

Hook: in the "stopped" state, resets the player state and, if autosave is active, saves the mission.

- `state` (*string*) : Mission state.
- `mission` (*table|nil*) : Mission concerned.

#### `career_modules_missionWrapper.onMissionLoaded(id, dirtyDate)`

Hook called when a mission's data is loaded: registers it as tracked.

- `id` (*string*) : Mission identifier.
- `dirtyDate` (*string|nil*) : Associated date.

#### `career_modules_missionWrapper.onSaveCurrentProfile(currentSavePath)`

Save hook: writes the data of each modified mission to career/missions/.

- `currentSavePath` (*string*) : Save folder.

#### `career_modules_missionWrapper.preMissionHandling(step, task)`

Step called before a mission starts: if autosave is active, saves and waits for onVehicleSaveFinished to set step.handlingComplete = true; otherwise marks the step as complete right away.

- `step` (*table*) : Mission start step (handlingComplete field).
- `task` (*any*) : Not used.

#### `career_modules_missionWrapper.saveMission(id)`

Marks the mission as modified and starts a full career save (career_saveSystem.saveCurrent).

- `id` (*string*) : Mission identifier.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: career_career. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/missionWrapper.lua`.*
