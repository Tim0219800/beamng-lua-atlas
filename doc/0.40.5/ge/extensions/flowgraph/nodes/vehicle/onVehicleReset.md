# `flowgraph_nodes_vehicle_onVehicleReset`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/onVehicleReset.lua` · VM: Game Engine (GE) · 69 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/onVehicleReset")` (file under extensions/ but not a regular extension)

Event node "On Vehicle Reset" (category `logic`). Emits a pulse on `flow` when a vehicle is reset (hook `onVehicleResetted`). If the input pin `vehId` is provided, reacts only for this vehicle. Output `vehId` (hidden): the reset vehicle.

## Notes

- The hook name is `onVehicleResetted` (with "ted").

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:_afterTrigger()` | Called by the manager after the node is triggered; resets the event flag to false. | 64 |
| `C:_executionStarted()` | Called by the manager when the flowgraph project execution starts; resets the internal state to zero. | 36 |
| `C:init(mgr, ...)` | Empty constructor. | 32 |
| `C:onVehicleResetted(id)` | Hook called when a vehicle is reset; optionally filters by `vehId` then raises the flag. | 41 |
| `C:work(args)` | If the flag is raised, fills `vehId` and sets `flow` to true for one frame, otherwise false. | 53 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/onVehicleReset.lua`.*
