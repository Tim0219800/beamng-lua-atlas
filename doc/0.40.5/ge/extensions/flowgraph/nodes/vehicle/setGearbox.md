# `flowgraph_nodes_vehicle_setGearbox`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/setGearbox.lua` · VM: Game Engine (GE) · 64 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/setGearbox")` (file under extensions/ but not a regular extension)

Node "Set Gearbox Mode" (category `once_f_duration`). Changes the gearbox mode (`arcade` or `realistic`) via `core_vehicleBridge.executeAction(veh,'setGearboxMode', mode)`, then sends a `ping` to know when it is received. Input pins: `vehId`, `mode` (string).

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Called by the manager when the flowgraph project execution starts; resets the internal state to zero. | 31 |
| `C:init()` | Node constructor, called at its creation by the flowgraph editor/manager; initializes the internal state. | 24 |
| `C:onNodeReset()` | Clears the response and goes to `inactive` duration. | 35 |
| `C:postInit()` | Defines the values offered for `mode`: arcade, realistic. | 27 |
| `C:work()` | When the ping returns, goes to `finished`. | 55 |
| `C:workOnce()` | Sends the action and a ping to the vehicle, goes to `started`. | 40 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/setGearbox.lua`.*
