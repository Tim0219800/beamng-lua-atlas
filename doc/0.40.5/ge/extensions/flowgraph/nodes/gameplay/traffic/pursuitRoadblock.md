# `flowgraph_nodes_gameplay_traffic_pursuitRoadblock`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/pursuitRoadblock.lua` · VM: Game Engine (GE) · 39 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/traffic/pursuitRoadblock")` (file under extensions/ but not a regular extension)

Flowgraph node "Pursuit Roadblock" (once_instant). Places up to 3 vehicles (vehId1..3) in a roadblock with gameplay_police.placeRoadblock. Inputs: pos, rot, width, angle, centerAngle, checkWidth (declared but not passed on in the code).

## Notes

- The checkWidth pin is declared but never read by workOnce.
- pos and rot are converted without a nil check.

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Gathers the vehicle ids, builds the parameters {angle, centerAngle, width} and calls gameplay_police.placeRoadblock. | 28 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/pursuitRoadblock.lua`.*
