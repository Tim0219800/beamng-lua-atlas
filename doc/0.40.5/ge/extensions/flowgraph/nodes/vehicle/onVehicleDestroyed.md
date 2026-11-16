# `flowgraph_nodes_vehicle_onVehicleDestroyed`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/onVehicleDestroyed.lua` · VM: Game Engine (GE) · 57 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/onVehicleDestroyed")` (file under extensions/ but not a regular extension)

Event node "On Vehicle Destroyed" (category `logic`, tag event). Emits a pulse on `flow` and the `vehId` of the destroyed vehicle when the `onVehicleDestroyed` hook is received. Input pin: `flow`.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:_afterTrigger()` | Called by the manager after the node is triggered; resets the event flag to false. | 52 |
| `C:_executionStarted()` | Called by the manager when the flowgraph project execution starts; resets the internal state to zero. | 32 |
| `C:init(mgr, ...)` | Empty constructor. | 28 |
| `C:onVehicleDestroyed(id)` | Hook called when a vehicle is destroyed; stores `id` and raises the flag. | 37 |
| `C:work(args)` | If the flag is raised, sets `vehId` and `flow` to true for one frame, otherwise `flow` to false. | 42 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/onVehicleDestroyed.lua`.*
