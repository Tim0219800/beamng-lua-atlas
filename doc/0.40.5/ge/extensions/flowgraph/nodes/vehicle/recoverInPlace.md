# `flowgraph_nodes_vehicle_recoverInPlace`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/recoverInPlace.lua` · VM: Game Engine (GE) · 47 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/recoverInPlace")` (file under extensions/ but not a regular extension)

Node "Recover In Place" (category `once_instant`). Recovers a vehicle in place: `veh:resetBrokenFlexMesh()` then `spawn.safeTeleport` at the current position with the current direction/up, so it is not inside an obstacle (it may be moved slightly). Input pin: `vehId` (default: player).

## Notes

- The description of the `vehId` pin says "to freeze" (copy-paste).

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Empty constructor. | 27 |
| `C:workOnce()` | Resets the broken flexmeshes to zero then safely teleports the vehicle in place. | 31 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/recoverInPlace.lua`.*
