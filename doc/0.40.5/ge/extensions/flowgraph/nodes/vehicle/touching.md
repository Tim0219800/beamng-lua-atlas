# `flowgraph_nodes_vehicle_touching`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/touching.lua` · VM: Game Engine (GE) · 75 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/touching")` (file under extensions/ but not a regular extension)

"Vehicle Touch" node (category `repeat_instant`, tags collision/collide/hit). Uses `map.objects[vehIdA].objectCollisions` to detect whether one vehicle touches another. Input pins: `flow`, `vehIdA`, `vehIdB` (optional). Outputs: `flow` (always true), `touching` (flow), `touchingb` (bool), and `vehId1` to `vehId5` (hidden: up to 5 touched ids, sorted, -1 if none). Without `vehIdB`, tests for any collision.

## Notes

- With `vehIdB`, the `vehId1..5` outputs stay at -1.
- The descriptions of `vehId1..5` are identical ("lowest-id-ed vehicle").

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:init(mgr, ...)` | Empty constructor. | 31 |
| `C:work()` | Resets the outputs, then fills them from vehicle A's collision table. | 35 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/touching.lua`.*
