# `flowgraph_nodes_vehicle_shiftToGearIndex`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/shiftToGearIndex.lua` · VM: Game Engine (GE) · 39 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/shiftToGearIndex")` (file under extensions/ but not a regular extension)

Node "Shift to Gear Index" (category `repeat_instant`). Shifts to a specific gear on a manual gearbox: `core_vehicleBridge.executeAction(veh,'shiftToGearIndex', gear)`. `gear`: 0 neutral, -1 reverse, 1 first, etc. Input pins: `vehId`, `gear`.

## Notes

- Undefined behavior according to the code (node description) for an automatic gearbox or an out-of-range gear.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Sends `shiftToGearIndex` to the vehicle. | 25 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/shiftToGearIndex.lua`.*
