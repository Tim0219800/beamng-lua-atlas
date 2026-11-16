# `flowgraph_nodes_vehicle_freeze`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/freeze.lua` · VM: Game Engine (GE) · 47 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/freeze")` (file under extensions/ but not a regular extension)

Node "Freeze Vehicle" (category `repeat_instant`). Freezes or unfreezes a vehicle via `core_vehicleBridge.executeAction(veh,'setFreeze', freeze)`. Input pins: `vehId`, `freeze` (bool). If `vehId` is absent, player vehicle.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Empty constructor. | 28 |
| `C:work()` | Sends the `setFreeze` action with the value of the `freeze` pin. | 32 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/freeze.lua`.*
