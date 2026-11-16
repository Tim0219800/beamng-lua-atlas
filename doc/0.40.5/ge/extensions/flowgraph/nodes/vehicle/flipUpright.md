# `flowgraph_nodes_vehicle_flipUpright`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/flipUpright.lua` · VM: Game Engine (GE) · 50 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/flipUpright")` (file under extensions/ but not a regular extension)

Node "Flip Upright" (category `repeat_instant`, tags rotation/position/recover/move). Sets the vehicle upright without repairing it: `spawn.safeTeleport` at the same position with a rotation recomputed by `quatFromDir(direction)`, then triggers the `onVehicleFlippedUpright(vehId)` hook. Input pin: `vehId`. If `vehId` is not connected, the node takes the player vehicle (`getPlayerVehicle(0)`).

## Notes

- Called every frame while the flow is active.
- The last argument `false` of safeTeleport disables repair.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Empty constructor. | 24 |
| `C:resetVehicle()` | Teleports the vehicle in place, upright, and calls `extensions.hook('onVehicleFlippedUpright', vehId)`. | 33 |
| `C:work()` | Calls `resetVehicle` and copies the input flow to the output. | 28 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onVehicleFlippedUpright` — listened to by 1 module(s)

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/flipUpright.lua`.*
