# `career_modules_speedTraps`

*File: `lua/ge/extensions/career/modules/speedTraps.lua` · VM: Game Engine (GE) · 139 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_speedTraps`: `extensions.load("career_modules_speedTraps")`, then the global `career_modules_speedTraps`

Career reaction to speed traps (gameplay_speedTraps): fines for speeding and running red lights, UI messages, flash sound, and recording into the speed trap leaderboards (gameplay_speedTrapLeaderboards) saved in <save>/career/speedTrapLeaderboards/. Only the player's vehicle (index 0) is concerned.

## Notes

- Speeding fine (overSpeed in m/s): <= 6.7056 m/s (15 mph) 35; <= 11.176 m/s (25 mph) 70; beyond that 100. It is paid with canBeNegative = true (the balance can become negative).
- Penalty type: vehicle outside the inventory or owned with a plate (part whose name contains "licenseplate") = normal fine; without a plate = message without a fine; loaned "work" type vehicle with a plate = loss of 10 reputation points of the owning organization. A non-owned, non-"work" vehicle with a plate receives no penalty (penaltyType nil).
- Red light: fixed fine of 500 if the vehicle is outside the inventory or has a plate; otherwise only a message.
- Whatever the outcome, onSpeedTrapTriggered adds a record to the leaderboard and displays a message (new record, record with no previous one, or no new record).

**Dependencies (loaded first):** `career_career`, `gameplay_speedTraps`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_speedTraps.onExtensionLoaded()` | Hook: loads the profile's speed trap leaderboards if the career is active (returns false otherwise). *(internal)* *(hook)* | 122 |
| `career_modules_speedTraps.onRedLightCamTriggered(speedTrapData, playerSpeed)` | Hook called when a red light camera triggers: fine of 500 with message and sound if the player's vehicle is identifiable by a plate. *(internal)* *(hook)* | 97 |
| `career_modules_speedTraps.onSaveCurrentProfile(currentSavePath)` | Save hook: writes the speed trap leaderboards to career/speedTrapLeaderboards/. *(internal)* *(hook)* | 129 |
| `career_modules_speedTraps.onSpeedTrapTriggered(speedTrapData, playerSpeed, overSpeed)` | Hook called when a speed trap triggers: applies the fine or penalty depending on the plate and vehicle type, then updates the speed trap's leaderboard. *(internal)* *(hook)* | 35 |

### Parameter details

#### `career_modules_speedTraps.onRedLightCamTriggered(speedTrapData, playerSpeed)`

Hook called when a red light camera triggers: fine of 500 with message and sound if the player's vehicle is identifiable by a plate.

- `speedTrapData` (*table*) : Camera data (subjectID).
- `playerSpeed` (*number*) : Recorded speed (not used here).

#### `career_modules_speedTraps.onSaveCurrentProfile(currentSavePath)`

Save hook: writes the speed trap leaderboards to career/speedTrapLeaderboards/.

- `currentSavePath` (*string*) : Save folder.

#### `career_modules_speedTraps.onSpeedTrapTriggered(speedTrapData, playerSpeed, overSpeed)`

Hook called when a speed trap triggers: applies the fine or penalty depending on the plate and vehicle type, then updates the speed trap's leaderboard.

- `speedTrapData` (*table*) : Speed trap data (speedLimit, subjectID...).
- `playerSpeed` (*number*) : Recorded speed in m/s.
- `overSpeed` (*number*) : Excess over the limit in m/s.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: career_career, gameplay_speedTraps. |

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/speedTraps.lua`.*
