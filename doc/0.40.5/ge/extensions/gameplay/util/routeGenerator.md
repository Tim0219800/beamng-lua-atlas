# `gameplay_util_routeGenerator`

*File: `lua/ge/extensions/gameplay/util/routeGenerator.lua` · VM: Game Engine (GE) · 851 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_util_routeGenerator`: `extensions.load("gameplay_util_routeGenerator")`, then the global `gameplay_util_routeGenerator`

Procedurally generates a race route on the map's road graph (map.getMap().nodes). A guided random walk (preferred angle depending on the requested flow, avoidance of U-turns and dead ends, target trail/dirt/tarmac ratios depending on drivability) produces a path, which is smoothed, resampled every 8 m, then reduced to checkpoints by Douglas-Peucker, shifted ahead of sharp turns and validated by A* so that the ground marker properly follows the generated road. A modder calls it with a start position and a target distance.

## Example

```lua
local chemin, checkpoints, rayons, normales, distance = gameplay_util_routeGenerator.generateRaceRoute(vec3(x, y, z), 5000, dirDepart, nil, 2)
local depart = gameplay_util_routeGenerator.pickRandomRoadPoint()
```

## Notes

- Phases: 1 graph walk, 1.5 removal of small deviations on overlapping roads (deviation < 15 m), 1.75 resampling at 8 m, 2 RDP selection (tolerance 30 m, minimum spacing 30 m), 2.5 shifting checkpoints ahead of turns > 45°, 3 A* validation of the ground markers.
- Default values: minDrivability 0.35; flow 2 (clamped to 1..3: 1 = pronounced turns, 3 = almost straight); look-ahead (lookAheadDistance) 300 m; distance between checkpoints 130 m; checkpoint radius clamped between 4 and 13 m.
- Links whose drivability is below minDrivability are ignored; one-way roads are only traversed in their direction.
- Band classification: drivability < bandBoundaries[1] = trail, <= bandBoundaries[2] = dirt, otherwise tarmac. targetRatios is a table {trail, dirt, tarmac} of proportions.
- The call reseeds the global random generator (math.randomseed(seed or os.time())): with the same seed and the same map, the result is reproducible, but the game's global random state is modified.
- Returns nil if the map has no nodes or if no connected start node is found.
- If `job` is provided (a jobsystem job), the function calls job.yield() between phases: it must then run in a jobsystem coroutine.
- The first point (player start) is not returned as a checkpoint.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_util_routeGenerator.generateRaceRoute(startPos, targetDistanceMeters, startDir, minDrivability, routeSmoothness, lookAheadDistance, job, seed, targetRatios, bandBoundaries, checkpointDistance)` | Generates a route of the requested length from a position, with checkpoints, radii and normals. | 608 |
| `gameplay_util_routeGenerator.pickRandomRoadPoint()` | Picks a random position: a random road node, otherwise a random point in the terrain box, otherwise the origin. | 813 |

### Parameter details

#### `gameplay_util_routeGenerator.generateRaceRoute(startPos, targetDistanceMeters, startDir, minDrivability, routeSmoothness, lookAheadDistance, job, seed, targetRatios, bandBoundaries, checkpointDistance)`

Generates a route of the requested length from a position, with checkpoints, radii and normals.

- `startPos` (*vec3*) : Start position.
- `targetDistanceMeters` (*number*) : Target route length (m).
- `startDir` (*vec3|nil*) : Start direction, used to choose the road direction; otherwise the nearest connected node.
- `minDrivability` (*number|nil*) : Minimum drivability of links (0.35 by default).
- `routeSmoothness` (*integer|nil*) : 1 to 3 (2 by default); the higher, the straighter the route.
- `lookAheadDistance` (*number|nil*) : Look-ahead distance in m (300 by default).
- `job` (*table|nil*) : Jobsystem job used to yield between phases.
- `seed` (*integer|nil*) : Random seed (os.time() by default).
- `targetRatios` (*table<string, number>|nil*) : Target proportions {trail, dirt, tarmac}.
- `bandBoundaries` (*number[]|nil*) : Two drivability thresholds separating trail/dirt/tarmac.
- `checkpointDistance` (*number|nil*) : Target distance between checkpoints in m (130 by default).
- **returns**: vec3[]|nil Positions of the path traveled (coarse), nil on failure.
- **returns**: vec3[] Checkpoint positions.
- **returns**: number[] Checkpoint radii (m).
- **returns**: vec3[] Checkpoint normals (horizontal direction of passage).
- **returns**: number Total distance traveled (m).

#### `gameplay_util_routeGenerator.pickRandomRoadPoint()`

Picks a random position: a random road node, otherwise a random point in the terrain box, otherwise the origin.

- **returns**: vec3 Chosen position.

## Fields

| Field | Type | Description |
|---|---|---|
| `defaultMinDrivability` | number | 0.35. Ground marker routing must use the same value, otherwise phase 3 validates a route the player will never take. |
| `drivabilityPenalty` | number | 10. Drivability penalty to use with ground marker routing. |
| `maxCheckpointRadius` | number | 13 (m). Maximum radius of a generated checkpoint. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/util/routeGenerator.lua`.*
