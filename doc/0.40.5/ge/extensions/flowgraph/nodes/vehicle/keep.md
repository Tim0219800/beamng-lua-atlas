# `flowgraph_nodes_vehicle_keep`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/keep.lua` · VM: Game Engine (GE) · 38 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/keep")` (file under extensions/ but not a regular extension)

Node "Keep Vehicle" (category `once_instant`). Marks a vehicle to keep when the flowgraph stops (by default the vehicles created during execution are deleted) via `mgr.modules.vehicle:setKeepVehicle(vehId, keep)`. Input pins: `vehId`, `keep` (bool).

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Empty constructor. | 24 |
| `C:workOnce()` | Calls `setKeepVehicle` if `vehId` is defined and copies the input flow to the output. | 28 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/keep.lua`.*
