# `flowgraph_nodes_gameplay_dragRace_getRacerSpawnPoint`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/getRacerSpawnPoint.lua` · VM: Game Engine (GE) · 77 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/dragRace/getRacerSpawnPoint")` (file under extensions/ but not a regular extension)

Flowgraph node "Get Drag Racer Spawn Point" (category repeat_instant). Gives the spawn position and rotation of a driver's lane (vehId), generally used once during preparation. Outputs: spawnPos (vec3), spawnRot (quat), lane, available (false if the driver, the lane or the spawn waypoint cannot be found).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Clears data and dragData. | 25 |
| `C:work()` | Reads dragData.strip.lanes[lane].waypoints.spawn.transform and writes the used pins. | 30 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/getRacerSpawnPoint.lua`.*
