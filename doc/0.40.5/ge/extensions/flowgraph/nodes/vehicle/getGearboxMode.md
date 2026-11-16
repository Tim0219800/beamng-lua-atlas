# `flowgraph_nodes_vehicle_getGearboxMode`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/getGearboxMode.lua` · VM: Game Engine (GE) · 61 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/getGearboxMode")` (file under extensions/ but not a regular extension)

Node "Get Gearboxmode" (category `once_f_duration`). Asks the vehicle's `mainController` controller for its `gearboxMode` (via `core_vehicleBridge.requestValue`) and returns it on the `value` output (any). Input pin: `vehId` (default: player). Duration state: inactive/started/finished.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Called by the manager when the flowgraph project execution starts; resets the internal state to zero. | 27 |
| `C:init()` | Node constructor, called at its creation by the flowgraph editor/manager; initializes the internal state. | 24 |
| `C:onNodeReset()` | Clears the received response and goes to `inactive` duration. | 31 |
| `C:work()` | When the response has arrived, copies it to `value` and goes to `finished`. | 49 |
| `C:workOnce()` | Sends the `mainController/gearboxMode` request to the vehicle and goes to `started`. | 36 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/getGearboxMode.lua`.*
