# `flowgraph_nodes_vehicle_setIgnition`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/setIgnition.lua` · VM: Game Engine (GE) · 51 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/setIgnition")` (file under extensions/ but not a regular extension)

Node "Set Ignition" (category `repeat_instant`). Sets the ignition level: `core_vehicleBridge.executeAction(veh,'setIgnitionLevel', mode)`. `mode`: 0 off, 1 accessories, 2 ignition on, 3 starter. Input pins: `vehId`, `mode`. To read the level, use "Get Electrics Value".

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Empty constructor. | 24 |
| `C:postInit()` | Defines the templates of `mode` (Off, Accessory Mode, Ignition On, Starter On). | 27 |
| `C:work()` | Sends `setIgnitionLevel` to the vehicle. | 36 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/setIgnition.lua`.*
