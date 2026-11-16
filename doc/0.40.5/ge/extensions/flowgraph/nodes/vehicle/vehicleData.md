# `flowgraph_nodes_vehicle_vehicleData`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/vehicleData.lua` · VM: Game Engine (GE) · 103 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/vehicleData")` (file under extensions/ but not a regular extension)

"Get Vehicle Data" node (category `repeat_instant`), obsolete: "replaced by Get Vehicle Data, Vehicle OOBB and Vehicle Wheels". Reads `map.objects[vehId]` and the vehicle geometry. Outputs: `active`, `damage`, `dirVec`, `dirVecUp`, `rotation`, `position` (refnode), `corner_FR/FL/BR/BL`, `wheelCenter`, `velocityVector`, `velocity` (m/s). Input pin: `vehId` (default 0).

## Notes

- The final code (`extractVehicleData`, `model`/`config` outputs) is in a commented-out block.
- Crashes if the player vehicle does not exist (`veh:getId()` is not reached thanks to the `return`).

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:init(mgr, ...)` | Empty constructor. | 45 |
| `C:work(args)` | Fills all outputs from `map.objects` and the bounding box. | 53 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/vehicleData.lua`.*
