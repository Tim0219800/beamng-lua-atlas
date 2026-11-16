# `gameplay_missions_locationsDetector`

*File: `lua/ge/extensions/gameplay/missions/locationsDetector.lua` · VM: Game Engine (GE) · 58 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_missions_locationsDetector`: `extensions.load("gameplay_missions_locationsDetector")`, then the global `gameplay_missions_locationsDetector`

Detects the missions whose marker cluster contains the player's given position. getNearbyLocations iterates over the gameplay_missions_clustering clusters (with the big map's merge radius if it is active) and returns, for each mission found, its type, the mission object, the cluster and the id. The "background missions" part is commented out in the file.

## Notes

- The proximity test is defaultLocationCheck: cluster.pos and cluster.radius must exist and distance(playerPosition, cluster.pos) <= cluster.radius.
- The returned array is reused on every call (cleared by table.clear): do not keep it between two calls.
- Inconsistency: M.onPoiTriggered and M.isEnabled are assigned to local variables that are never defined: these fields are nil.
- missionsChanged is always false: getMissionsAtLocation returns the variable changed which is never modified (the code that updated it is commented out).
- The accessible parameter of getNearbyLocations comes from an undefined variable (nil) and is forced to true anyway in getMissionsAtLocation; the variable p (profiler) is tested there as a global, nil if not defined.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_missions_locationsDetector.getNearbyLocations(level, playerPosition)` | Returns the missions for which a cluster contains the player's position. | 43 |

### Parameter details

#### `gameplay_missions_locationsDetector.getNearbyLocations(level, playerPosition)`

Returns the missions for which a cluster contains the player's position.

- `level` (*string*) : Level identifier (passed to the test function, unused).
- `playerPosition` (*vec3*) : Player position.
- **returns**: table {missions = {{type, mission, location, id}, ...}, missionsChanged = false}.

## Fields

| Field | Type | Description |
|---|---|---|
| `isEnabled` | nil | Always nil: reference to an undefined local variable. ⚠ reference `isEnabled` not defined in the file (probably nil) |
| `onPoiTriggered` | nil | Always nil: reference to an undefined local variable. ⚠ reference `onPoiTriggered` not defined in the file (probably nil) |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/missions/locationsDetector.lua`.*
