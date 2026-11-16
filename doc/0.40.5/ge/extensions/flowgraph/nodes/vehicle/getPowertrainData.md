# `flowgraph_nodes_vehicle_getPowertrainData`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/getPowertrainData.lua` · VM: Game Engine (GE) · 64 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/getPowertrainData")` (file under extensions/ but not a regular extension)

Node "Get Powertrain Data" (category `once_f_duration`). Requests a property of a powertrain device (`core_vehicleBridge.requestValue(veh, cb, 'powertrainDevice', device, property)`). Input pins: `vehId`, `device` (device name), `property`; output `value` (any). Duration state: inactive/started/finished.

## Notes

- The request callback contains `dump(val) dumpz(self, 1)`: debug traces are written to the log on each response.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Called by the manager when the flowgraph project execution starts; resets the internal state to zero. | 29 |
| `C:init()` | Node constructor, called at its creation by the flowgraph editor/manager; initializes the internal state. | 26 |
| `C:onNodeReset()` | Clears the received response and goes to `inactive` duration. | 33 |
| `C:work()` | When the response has arrived, copies it to `value` and goes to `finished`. | 51 |
| `C:workOnce()` | Sends the powertrain request to the vehicle and goes to `started`. | 38 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/getPowertrainData.lua`.*
