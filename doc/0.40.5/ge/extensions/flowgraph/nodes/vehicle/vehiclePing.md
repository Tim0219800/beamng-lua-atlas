# `flowgraph_nodes_vehicle_vehiclePing`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/vehiclePing.lua` · VM: Game Engine (GE) · 59 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/vehiclePing")` (file under extensions/ but not a regular extension)

"Vehicle Ping" node (category `once_f_duration`). Sends a `ping` to the vehicle (`core_vehicleBridge.requestValue(veh, cb, 'ping')`) to make sure previous commands have arrived before continuing. Input pin: `vehId` (default: player). Duration: inactive/started/finished.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Called by the manager when the flowgraph project execution starts; resets the internal state to zero. | 26 |
| `C:init()` | Node constructor, called at its creation by the flowgraph editor/manager; initializes the internal state. | 23 |
| `C:onNodeReset()` | Clears the response and goes to `inactive` duration. | 30 |
| `C:work()` | When the ping returns, goes to `finished`. | 48 |
| `C:workOnce()` | Sends the ping and switches to `started`. | 35 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/vehiclePing.lua`.*
