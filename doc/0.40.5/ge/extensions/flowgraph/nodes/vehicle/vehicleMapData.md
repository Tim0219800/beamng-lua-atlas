# `flowgraph_nodes_vehicle_vehicleMapData`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/vehicleMapData.lua` · VM: Game Engine (GE) · 74 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/vehicleMapData")` (file under extensions/ but not a regular extension)

"Get Vehicle Data" node (category `repeat_instant`). Provides position, directions, rotation, speed, activity and damage from `map.objects[vehId]`. Outputs: `position`, `dirVec`, `dirVecUp`, `rotation`, `velocity` (m/s), `velocityVector`, `active`, `damage`, `newAPIDamage` (`getSectionDamageSum`). Unconnected outputs are not computed (`isUsed`). Input pin: `vehId` (default 0, otherwise player).

## Notes

- If `vehId` refers to a nonexistent object, `vehId` stays at -1 and nothing is written.
- The `if not vehId` test is useless because `vehId` is always defined.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:init(mgr, ...)` | Empty constructor. | 30 |
| `C:work(args)` | Reads `map.objects[vehId]` and fills the connected outputs. | 36 |

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/vehicleMapData.lua`.*
