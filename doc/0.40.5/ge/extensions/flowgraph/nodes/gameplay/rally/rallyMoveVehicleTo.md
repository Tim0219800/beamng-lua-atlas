# `flowgraph_nodes_gameplay_rally_rallyMoveVehicleTo`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyMoveVehicleTo.lua` · VM: Game Engine (GE) · 72 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/rallyMoveVehicleTo")` (file under extensions/ but not a regular extension)

Flowgraph node "Rally Move Vehicle To" (category repeat_instant, tag rally). Moves a vehicle so that the middle of its front bumper, at the level of the bottom of its spawn bounding box (OOBB), is at position pos with rotation rot. It computes the offset between the vehicle position and this front-bottom point in the vehicle frame, reapplies it in the target frame, then calls veh:setPositionRotation. Inputs: vehId, pos (vec3), rot (quat).

## Notes

- The final Z coordinate is pos.z + 0.25 (fixed margin), not the value computed from the offset.
- If the vehicle cannot be found, a warning is logged.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work(args)` | If vehId, pos and rot are provided, repositions the vehicle according to the target front-bottom position. | 22 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyMoveVehicleTo.lua`.*
