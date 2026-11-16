# `flowgraph_nodes_vehicle_onCannonFired`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/onCannonFired.lua` · VM: Game Engine (GE) · 40 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/onCannonFired")` (file under extensions/ but not a regular extension)

Event node "on Cannon Fired" (category `repeat_instant`). Emits a pulse on the flow output `cannonFired` when the `onCannonFired` hook is received. No input.

## Notes

- The hook's `id` parameter is not exposed on an output.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:onCannonFired(id)` | Hook called when a cannon fires; raises the internal flag. `id`: vehicle/object identifier (inferred from the name, unused). | 35 |
| `C:work(args)` | Sets `cannonFired` to true for one frame if a shot was signaled, otherwise false. | 26 |
| `C:workOnce()` | Sets the internal flag `flag` to false. | 22 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/onCannonFired.lua`.*
