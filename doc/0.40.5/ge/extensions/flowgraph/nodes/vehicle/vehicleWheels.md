# `flowgraph_nodes_vehicle_vehicleWheels`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/vehicleWheels.lua` · VM: Game Engine (GE) · 51 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/vehicleWheels")` (file under extensions/ but not a regular extension)

"Get Vehicle Wheel Center" node (category `repeat_instant`, tags telemetry/wheel). Computes the average of the wheel positions (first axis node of each wheel) plus the vehicle position. Input pin: `vehId` (default 0, otherwise player). Output: `wheelCenter` (vec3).

## Notes

- If the vehicle has only one wheel (`getWheelCount() - 1` equals 0), the center stays at the vehicle position.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:init(mgr, ...)` | Empty constructor. | 22 |
| `C:work(args)` | Computes the wheel center and writes it to `wheelCenter`. | 27 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/vehicleWheels.lua`.*
