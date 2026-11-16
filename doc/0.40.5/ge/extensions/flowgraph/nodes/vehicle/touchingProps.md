# `flowgraph_nodes_vehicle_touchingProps`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/touchingProps.lua` · VM: Game Engine (GE) · 49 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/touchingProps")` (file under extensions/ but not a regular extension)

"Props Touch" node (category `repeat_instant`, tags collision/collide/hit). Tells whether a vehicle touches an object (prop) from a list of ids, via `map.objects[vehId].objectCollisions`. Input pins: `flow`, `vehId`, `propsIds` (table of ids). Outputs: `flow` (true), `touching` (flow), `isTouching` (bool, hidden).

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:init(mgr, ...)` | Empty constructor. | 26 |
| `C:work()` | Iterates over `propsIds` and sets `touching` / `isTouching` on the first colliding object. | 30 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/touchingProps.lua`.*
