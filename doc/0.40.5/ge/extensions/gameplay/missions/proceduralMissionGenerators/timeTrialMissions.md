# `gameplay_missions_proceduralMissionGenerators_timeTrialMissions`

*File: `lua/ge/extensions/gameplay/missions/proceduralMissionGenerators/timeTrialMissions.lua` · VM: Game Engine (GE) · 240 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_missions_proceduralMissionGenerators_timeTrialMissions`: `extensions.load("gameplay_missions_proceduralMissionGenerators_timeTrialMissions")`, then the global `gameplay_missions_proceduralMissionGenerators_timeTrialMissions`

Procedural mission generator for "generatedTimeTrial" based on each level's quick races (quickraces). It loads scenario_quickRaceLoader, iterates over the tracks, converts those without a .race.json file (via gameplay/race/path:fromTrack) into a cache file in gameplay/temp/timeTrials/, then creates a mission with the race file, the prefabs (normal, forward, reverse), the preview and the trigger placed on the default start position.

## Example

```lua
local missions = gameplay_missions_proceduralMissionGenerators_timeTrialMissions.generate({'gridmap_v2'})
```

## Notes

- The missions have the id "<level>/timeTrials/<trackName>-procedural", missionType "generatedTimeTrial", startCondition {type='vehicleDriven'}, a single justFinish star, showInCareer=false and showInFreeroam=true.
- Ignored tracks: race.ignoreAsMission, invalid cache, race.hideMission, or no start position matching defaultStartPosition (the mission is then not added).
- The cache is written to disk (jsonWriteFile) on the first pass; a failed conversion writes {invalid=true} so it is not retried. Deleting the cache file forces a new conversion.
- Prefabs not found are searched in levels/<level>/<path>.prefab(.json); those that do not exist are removed from the list. The automatic prefabs <trackName>, <trackName>_reverse, <trackName>_forward in levels/<level>/quickrace/ are added if they exist.
- The `enableConversion` block (a local variable set to false) would allow converting these procedural missions into real timeTrial missions on disk via saveMission; it is inactive. `hiddenFiles` is never filled (commented-out code), so the hidden missions counter stays at 0 despite the final log.
- The tables returned by generate are not saved: they serve as the in-memory mission list.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_missions_proceduralMissionGenerators_timeTrialMissions.generate(levelIdentifier)` | Generates the "generatedTimeTrial" missions for one or more levels (all if nil) from scenario_quickRaceLoader.getQuickraceList. Writes cache files for the tracks to convert and logs the number of hidden missions. | 74 |

### Parameter details

#### `gameplay_missions_proceduralMissionGenerators_timeTrialMissions.generate(levelIdentifier)`

Generates the "generatedTimeTrial" missions for one or more levels (all if nil) from scenario_quickRaceLoader.getQuickraceList. Writes cache files for the tracks to convert and logs the number of hidden missions.

- `levelIdentifier` (*string|table|nil*) : Level name or list of names; nil = all levels.
- **returns**: table List of mission definitions.

## Calls into the engine (C++)

- `FS:` `copyFile`, `fileExists`

**Loads extensions:** `scenario_quickRaceLoader`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/missions/proceduralMissionGenerators/timeTrialMissions.lua`.*
