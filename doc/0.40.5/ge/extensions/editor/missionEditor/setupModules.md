# `editor_missionEditor_setupModules`

*File: `lua/ge/extensions/editor/missionEditor/setupModules.lua` · VM: Game Engine (GE) · 817 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/missionEditor/setupModules")` (file under extensions/ but not a regular extension)

"SetupModules" panel of the mission editor. It edits mission.setupModules, three enableable modules: vehicles (offered vehicles, player vehicle, differential settings), traffic (number of vehicles, active, parked, respawn rate, custom group) and environment (normalized time of day, time scale, wind, clouds, fog, settings left to the user). It also contains the conversion of the old fixed time to normalizedTime and the detection of malformed data. The module returns a constructor: require(...)(missionEditor).

## Notes

- normalizedTime: 0 = noon, 0.25 = sunset, 0.5 = midnight, 0.75 = sunrise, 1 = noon; a negative value cancels the mission's time setting; > 1 is an error.
- The old time field (fixed time) is called "legacy"; the conversion uses value tables (axisTilt) per level (west_coast_usa by default) to switch to normalizedTime.
- If the instance mission blocks a module (blockedSetupModules), it is displayed disabled with "not available for this mission type". For vehicles, enabled is forced to not isBlocked every frame.
- Traffic: amount = -1 means automatic quantity; respawnRate goes from 0 to 3; timeScale at 0 ignores the setting.
- Disabling a module clears its data (table.clear); the obsolete fields setupModules.playerVehicle and setupModules.timeOfDay are removed by setBackwardsCompatibility.

## Class `C`

Instance of the panel. Fields: missionEditor, name = 'SetupModules', mission, missionInstance, blockedSetupModules, as well as many imgui buffers (traffic*, todInput, normalizedTodInput, windSpeedInput, cloudCoverInput, fogDensityInput...).

The module returns a constructor: `local obj = require("editor_missionEditor_setupModules")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:displayDiffSetup(veh)` | Checkbox combo for a vehicle's differential settings: toggleDifferentials, lockFrontDiffs, lockRearDiffs, setTransfercase (4hi), setRangebox (low), or all at once. | 762 |
| `C:draw()` | Draws the three sections Vehicles, Traffic and Environment with their enable checkboxes and fields. Uses core_environment.getTimeOfDay and getTimeOfDayValueForNormalizedTime for the current time and the conversion. | 226 |
| `C:getMissionIssues(m)` | Calls setMission(m) then reports malformed modules (error), the legacy fixed time (minor) and an invalid normalizedTime (error). | 163 |
| `C:init(missionEditor)` | Constructor: remembers missionEditor and the panel name. | 8 |
| `C:setBackwardsCompatibility()` | Copies into the mission the modules fixed by the game instance (those marked _compatibility) and removes the obsolete modules playerVehicle and timeOfDay. | 149 |
| `C:setMission(mission)` | Sets the current mission, applies backwards compatibility and initializes all the input buffers from mission.setupModules. | 114 |

## Calls into the engine (C++)

- `core_environment.` `getTimeOfDay`, `getTimeOfDayValueForNormalizedTime`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/missionEditor/setupModules.lua`.*
