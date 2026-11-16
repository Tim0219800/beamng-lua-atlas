# `flowgraph_nodes_vehicle_toggleVehicleControls`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/toggleVehicleControls.lua` · VM: Game Engine (GE) · 38 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/toggleVehicleControls")` (file under extensions/ but not a regular extension)

Node "Toggle Vehicle Controls" (category `repeat_instant`). Enables or disables the action map `VehicleCommonActionMap` (`setEnabled(controllable)`), hence the vehicle controls for the player. Input pin: `controllable` (bool). On stop, the controls are re-enabled.

## Notes

- `C.todo`: "PlayerUsable has bugs and only works the first time" (text copied from Player Usable).

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Re-enables the action map when the project stops. | 30 |
| `C:init()` | Empty constructor. | 20 |
| `C:work()` | Enables/disables the `VehicleCommonActionMap` action map. | 25 |

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/toggleVehicleControls.lua`.*
