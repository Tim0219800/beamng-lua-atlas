# `flowgraph_nodes_mission_knockAwayCheck`

*File: `lua/ge/extensions/flowgraph/nodes/mission/knockAwayCheck.lua` · VM: Game Engine (GE) · 180 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/mission/knockAwayCheck")` (file under extensions/ but not a regular extension)

Flowgraph node 'KnockAway Check' (repeat_instant category). Detects whether the vehicles of a prefab (pin prefabId) have been knocked over (tilt angle) or moved (distance) relative to their original position. Counts the hit vehicles (count), the total, the points (per vehicle, dynamic field knockAwayPoints or defaultPoints, 1 by default) and emits 'done' when all are hit. Can display markers above the targets and pointers on the minimap. Vehicles whose internal name contains 'ignore' are excluded.

## Notes

- The tilt test compares up:dot(val.up) (a cosine) to (pi * angle / 180) (an angle in radians): the two quantities are not comparable, so tippingMinAngle does not actually correspond to an angle in degrees.
- The output pins 'points' and 'maxPoints' have descriptions copied from the pins 'count' and 'total'.
- work calls self:_executionStopped() on a reset to release the markers.
- The node writes 'no mapdata!' to the console as long as the vehicle is not tracked by mapmgr.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Empty. | 35 |
| `C:_executionStopped()` | Ends and releases the markers (scenario/race_marker). | 44 |
| `C:getOriginalVehicleTransforms(data)` | For each BeamNGVehicle of the prefab, records position, rotation and up vector, and adds the vehicle to the manager's vehicle module. | 51 |
| `C:init()` | data.zOffset=0, positions empty. | 39 |
| `C:onDrawOnMinimap(td)` | Draws on the minimap a pointer (edge) or a circle for each vehicle not yet knocked over. | 168 |
| `C:onPreRender(dt, dtSim)` | Called every render frame; draws the markers. | 161 |
| `C:work()` | On reset, reinitializes. On the first frame of flow, initializes the counters, points and markers; then tests each vehicle (tilt via dirVecUp, displacement via pos) and updates the counters and markers; writes count, total, points, done, flow. | 68 |

## Calls into the engine (C++)

- `Sim.` `upcast`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/mission/knockAwayCheck.lua`.*
