# `flowgraph_nodes_vehicle_setLightbar`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/setLightbar.lua` · VM: Game Engine (GE) · 45 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/setLightbar")` (file under extensions/ but not a regular extension)

Node "Set Lightbar" (category `repeat_instant`). Sets the lightbar mode: `core_vehicleBridge.executeAction(veh,'setLightbarMode', mode)`. `mode`: 0 off, 1 on, 2 siren. Input pins: `vehId`, `mode`.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Empty constructor. | 24 |
| `C:postInit()` | Defines the templates of `mode` (Off, On, Siren). | 27 |
| `C:work()` | Sends `setLightbarMode` to the vehicle. | 31 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/setLightbar.lua`.*
