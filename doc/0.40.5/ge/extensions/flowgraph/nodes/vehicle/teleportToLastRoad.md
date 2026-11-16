# `flowgraph_nodes_vehicle_teleportToLastRoad`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/teleportToLastRoad.lua` · VM: Game Engine (GE) · 44 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/teleportToLastRoad")` (file under extensions/ but not a regular extension)

Node "Teleport To Last Road" (category `repeat_instant`). Teleports the vehicle to the last valid road (`spawn.teleportToLastRoad`) and triggers the `onVehicleTeleportedToLastRoad(vehId)` hook. Input pins: `vehId`, `resetVehicle` (bool), `destinationPos` (vec3, optional: position to look toward, otherwise 15 m in front of the vehicle).

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Empty constructor. | 21 |
| `C:work()` | Computes the target position then calls `spawn.teleportToLastRoad` and the hook. | 25 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onVehicleTeleportedToLastRoad`

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/teleportToLastRoad.lua`.*
