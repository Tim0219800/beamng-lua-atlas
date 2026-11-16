# `flowgraph_nodes_vehicle_getActive`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/getActive.lua` · VM: Game Engine (GE) · 39 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/getActive")` (file under extensions/ but not a regular extension)

Node "Get Vehicle Active" (category `repeat_instant`). Reads the active (visible) state of a vehicle with `obj:getActive()`. Input pin: `vehId` (default: player). Outputs: flow `true` (active), flow `false` (inactive), bool `isActive`.

## Notes

- The pin description says "set visibility" (copy-paste from Set Vehicle Active); this node only reads.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Updates the outputs `true`, `false` and `isActive` according to `getActive()`. | 22 |

## Calls into the engine (C++)

- `obj:` `getActive`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/getActive.lua`.*
