# `flowgraph_nodes_vehicle_onVehicleSpawned`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/onVehicleSpawned.lua` · VM: Game Engine (GE) · 57 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/onVehicleSpawned")` (file under extensions/ but not a regular extension)

Event node "On Vehicle Spawned" (category `logic`). Emits a pulse on `flow` and the id `vehId` when a vehicle is created (hook `onVehicleSpawned`).

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:_afterTrigger()` | Called by the manager after the node is triggered; resets the event flag to false. | 52 |
| `C:_executionStarted()` | Called by the manager when the flowgraph project execution starts; resets the internal state to zero. | 32 |
| `C:init(mgr, ...)` | Empty constructor. | 28 |
| `C:onVehicleSpawned(id)` | Hook called when a vehicle is created; stores `id` and raises the flag. | 37 |
| `C:work(args)` | If the flag is raised, fills `vehId` and sets `flow` to true for one frame, otherwise false. | 42 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/onVehicleSpawned.lua`.*
