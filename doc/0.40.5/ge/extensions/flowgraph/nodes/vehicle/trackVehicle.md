# `flowgraph_nodes_vehicle_trackVehicle`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/trackVehicle.lua` · VM: Game Engine (GE) · 41 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/trackVehicle")` (file under extensions/ but not a regular extension)

"Track Vehicle" node (category `repeat_instant`). Lets the flowgraph track a vehicle created outside of it (`mgr.modules.vehicle:addVehicle(veh, {dontDelete})`). Input pins: `flow`, `vehId` (default 0), `dontDelete` (hidden, default true: do not delete on stop).

## Notes

- No fallback to the player vehicle despite the pin description; a nil `vehId` causes `findObjectById(nil)`.
- Called every frame while the flow is active.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Empty function. | 36 |
| `C:init()` | Empty constructor. | 25 |
| `C:work()` | Adds the vehicle to the manager's vehicle module. | 29 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/trackVehicle.lua`.*
