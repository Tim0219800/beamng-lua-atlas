# `flowgraph_nodes_vehicle_beamstate_reset`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/beamstate/reset.lua` · VM: Game Engine (GE) · 41 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/beamstate/reset")` (file under extensions/ but not a regular extension)

Node "Reset Vehicle" (category `repeat_p_duration`, tag reset). Resets the vehicle to its initial state: `veh:requestReset(RESET_PHYSICS)` then `veh:resetBrokenFlexMesh()`. Input pin: `vehId`. If `vehId` is not connected, the node takes the player vehicle (`getPlayerVehicle(0)`).

## Notes

- Called every frame while the flow is active: use a pulse for a single reset.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Requests a physics reset of the vehicle and resets its broken flexmeshes to zero. | 26 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/beamstate/reset.lua`.*
