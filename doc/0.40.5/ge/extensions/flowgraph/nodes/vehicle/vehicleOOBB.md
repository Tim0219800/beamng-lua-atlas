# `flowgraph_nodes_vehicle_vehicleOOBB`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/vehicleOOBB.lua` · VM: Game Engine (GE) · 55 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/vehicleOOBB")` (file under extensions/ but not a regular extension)

"Get Vehicle Bounds" node (category `repeat_instant`, tags telemetry/bounds/corner). Gives the corners of the vehicle's oriented bounding box (`getSpawnWorldOOBB`): outputs `corner_FR`, `corner_FL`, `corner_BR`, `corner_BL`, `center` (vec3). Input pin: `vehId` (default 0, otherwise player).

## Notes

- `center` is the average of the OOBB corners at indices 0, 3, 4, 7.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:init(mgr, ...)` | Empty constructor. | 28 |
| `C:work(args)` | Writes the four corners and the center to the outputs. | 31 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/vehicleOOBB.lua`.*
