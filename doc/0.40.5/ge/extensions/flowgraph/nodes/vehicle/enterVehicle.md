# `flowgraph_nodes_vehicle_enterVehicle`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/enterVehicle.lua` · VM: Game Engine (GE) · 54 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/enterVehicle")` (file under extensions/ but not a regular extension)

Node "Enter Vehicle" (category `dynamic_instant`, depends on `gameplay_walk`). Makes the player enter a vehicle (`gameplay_walk.getInVehicle(veh)`) then restores the game camera (`commands.setGameCamera()`). Input pin: `vehId`. If `vehId` is not connected, the node takes the player vehicle (`getPlayerVehicle(0)`).

## Notes

- Dynamic category: in `repeat` mode, `work` repeats the entry every frame; otherwise only `workOnce` acts.

**Dependencies (loaded first):** `gameplay_walk`

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:enterVehicle()` | Finds the vehicle (`vehId` or player), calls `gameplay_walk.getInVehicle` and `commands.setGameCamera`. | 37 |
| `C:work()` | If `dynamicMode == 'repeat'`, repeats the entry into the vehicle every frame. | 31 |
| `C:workOnce()` | Makes the player enter the vehicle once. | 27 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/enterVehicle.lua`.*
