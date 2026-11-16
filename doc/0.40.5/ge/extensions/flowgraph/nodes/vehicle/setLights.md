# `flowgraph_nodes_vehicle_setLights`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/setLights.lua` · VM: Game Engine (GE) · 45 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/setLights")` (file under extensions/ but not a regular extension)

Node "Set Lights" (category `repeat_instant`). Sets the state of the headlights: `core_vehicleBridge.executeAction(veh,'setLightMode', mode)`. `mode`: 0 off, 1 on, 2 high beams. Input pins: `vehId`, `mode`.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Empty constructor. | 24 |
| `C:postInit()` | Defines the templates of `mode` (Off, On, Highbeams). | 27 |
| `C:work()` | Sends `setLightMode` to the vehicle. | 31 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/setLights.lua`.*
