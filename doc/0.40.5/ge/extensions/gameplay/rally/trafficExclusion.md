# `gameplay_rally_trafficExclusion`

*File: `lua/ge/extensions/gameplay/rally/trafficExclusion.lua` · VM: Game Engine (GE) · 271 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_trafficExclusion`: `extensions.load("gameplay_rally_trafficExclusion")`, then the global `gameplay_rally_trafficExclusion`

Computes spherical exclusion zones for AI traffic along the rally special stages, then applies them to the navgraph (`map.setTrafficExclusionZones` + `map.reset`) so that traffic does not drive on the course. The zones come from the driveline (drivelineV3) of each `rallyStage` mission, sampled every 1.5 x radius, and, for a loop, from an optional `trafficGatedRoads.grzones.json` file in the mission folder. Default radius: 10 m.

## Example

```lua
gameplay_rally_trafficExclusion.applyForRallyLoop(loopMission, 12)
-- ...later
gameplay_rally_trafficExclusion.clearTrafficExclusion()
```

## Notes

- Only missions of type `rallyStage` produce zones; the other types give an "Unsupported mission type" warning. Road sections (rallyRoadSection) found via extractMissionIdsFromRallyLoop are therefore ignored when creating the zones.
- If no mission is given to createZones, the rally editor's current mission (editor_rallyEditor.getMissionId) is used.
- applyForRallyLoop and clearTrafficExclusion call map.reset(), which reloads the navgraph: an expensive operation.
- The functions loadRacePath, createZonesForRallyStage and applyForMissionIds are dead code (commented out or unused local).

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rally_trafficExclusion.applyForRallyLoop(loopMission, radius)` | Applies the traffic exclusion for a loop: finds the missions via extractMissionIdsFromRallyLoop, creates the zones, adds the spheres of the optional trafficGatedRoads.grzones.json file (spheres field with pos {x,y,z} and radius), then calls map.setTrafficExclusionZones and map.reset(). | 211 |
| `gameplay_rally_trafficExclusion.clearTrafficExclusion()` | Removes all the exclusion zones (map.clearTrafficExclusionZones) and reloads the navgraph (map.reset). | 258 |
| `gameplay_rally_trafficExclusion.createZones(missions, radius)` | Builds the list of exclusion zones for rally missions. For each `rallyStage` mission, loads the driveline and samples its points every 1.5 x radius. | 101 |
| `gameplay_rally_trafficExclusion.extractMissionIdsFromRallyLoop(mission)` | Reads mission.fgVariables of a loop mission and returns the ids of the missions used, in order: for each stage 1 to 4, the road section (`stageN_rallyRoadSection`) then the special stage (`stageN_rallyStage`), finally `return_rallyRoadSection`. The values have the format "Name (id)"; `<none>` is ignored. | 151 |
| `gameplay_rally_trafficExclusion.getDefaultRadius()` | Returns the default radius of the zones. | 268 |

### Parameter details

#### `gameplay_rally_trafficExclusion.applyForRallyLoop(loopMission, radius)`

Applies the traffic exclusion for a loop: finds the missions via extractMissionIdsFromRallyLoop, creates the zones, adds the spheres of the optional trafficGatedRoads.grzones.json file (spheres field with pos {x,y,z} and radius), then calls map.setTrafficExclusionZones and map.reset().

- `loopMission` (*table*) : Loop mission.
- `radius` (*number|nil*) : Radius of the zones coming from the special stages; default 10.
- **returns**: table[] Applied zones ({pos, radius}); empty table if loopMission is nil.

#### `gameplay_rally_trafficExclusion.createZones(missions, radius)`

Builds the list of exclusion zones for rally missions. For each `rallyStage` mission, loads the driveline and samples its points every 1.5 x radius.

- `missions` (*table[]|nil*) : Missions (gameplay_missions_missions objects). If empty or nil, uses the rally editor's mission.
- `radius` (*number|nil*) : Radius of the zones in meters; default 10.
- **returns**: table[] List of {pos = vec3, radius = number}; empty if nothing is available.

#### `gameplay_rally_trafficExclusion.extractMissionIdsFromRallyLoop(mission)`

Reads mission.fgVariables of a loop mission and returns the ids of the missions used, in order: for each stage 1 to 4, the road section (`stageN_rallyRoadSection`) then the special stage (`stageN_rallyStage`), finally `return_rallyRoadSection`. The values have the format "Name (id)"; `<none>` is ignored.

- `mission` (*table*) : Loop-type mission (with fgVariables).
- **returns**: string[] Mission ids; empty if fgVariables is absent.

#### `gameplay_rally_trafficExclusion.getDefaultRadius()`

Returns the default radius of the zones.

- **returns**: number 10 (meters).

## Calls into the engine (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/trafficExclusion.lua`.*
