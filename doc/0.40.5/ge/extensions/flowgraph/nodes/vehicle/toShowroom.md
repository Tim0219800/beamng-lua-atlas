# `flowgraph_nodes_vehicle_toShowroom`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/toShowroom.lua` · VM: Game Engine (GE) · 38 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/toShowroom")` (file under extensions/ but not a regular extension)

Node "Move To Showroom" (category `repeat_instant`, depends on `util_showroom`). Resets and moves a vehicle into the showroom (`util_showroom.moveInside(veh)`). Input pin: `vehId` (default: player).

**Dependencies (loaded first):** `util_showroom`

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Empty constructor. | 22 |
| `C:work()` | Calls `util_showroom.moveInside` on the vehicle. | 24 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/toShowroom.lua`.*
