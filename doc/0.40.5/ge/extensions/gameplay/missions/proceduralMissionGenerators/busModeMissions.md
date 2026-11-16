# `gameplay_missions_proceduralMissionGenerators_busModeMissions`

*File: `lua/ge/extensions/gameplay/missions/proceduralMissionGenerators/busModeMissions.lua` · VM: Game Engine (GE) · 120 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_missions_proceduralMissionGenerators_busModeMissions`: `extensions.load("gameplay_missions_proceduralMissionGenerators_busModeMissions")`, then the global `gameplay_missions_proceduralMissionGenerators_busModeMissions`

Procedural mission generator for "busMode" (bus driving in freeroam). For each level that has /levels/<level>/buslines/*.buslines.json files, it creates one mission per "bus" scenario of scenario_scenariosLoader, with the route data (task list, navigation helpers, color, vehicle, reverse route) and a trigger placed on the bus spawn point. Called by gameplay_missions_missions to add these missions to the list.

## Example

```lua
local missions = gameplay_missions_proceduralMissionGenerators_busModeMissions.generate('gridmap')
```

## Notes

- The generated missions have the id "<level>/<routeID>-<variance>-procedural", missionType "busMode", an empty startCondition (the TODO says a bus should be required), trafficAllowed=false, justFinish and noAccident stars, showInCareer=false and showInFreeroam=true.
- The reverse route is the route with the same routeID and the opposite variance (a <-> b); its data is stored in missionTypeData.rtasklist / rnavhelp / rdirection.
- Probable bug: when the spawn is given by rotAngAxisF, the angle is converted with (w * 3.1459) / 180, so a faulty approximation of pi (3.14159).
- The level is identified by string.lower(level.levelName); if a scenario's route is not found in the buslines, `route.tasklist` will raise an error (no guard).

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_missions_proceduralMissionGenerators_busModeMissions.generate(levelIdentifier)` | Generates the list of busMode missions for one or more levels (all if nil). Keeps only levels with at least one bus route. Places the trigger (startTrigger) on missionStartTriggerPos if it exists, otherwise on the bus spawn point, and fills missionTypeData.spawnPos / spawnRot. | 32 |

### Parameter details

#### `gameplay_missions_proceduralMissionGenerators_busModeMissions.generate(levelIdentifier)`

Generates the list of busMode missions for one or more levels (all if nil). Keeps only levels with at least one bus route. Places the trigger (startTrigger) on missionStartTriggerPos if it exists, otherwise on the bus spawn point, and fills missionTypeData.spawnPos / spawnRot.

- `levelIdentifier` (*string|table|nil*) : Level name or list of names; nil = all levels.
- **returns**: table List of mission definitions (tables not saved to disk).

## Calls into the engine (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/missions/proceduralMissionGenerators/busModeMissions.lua`.*
