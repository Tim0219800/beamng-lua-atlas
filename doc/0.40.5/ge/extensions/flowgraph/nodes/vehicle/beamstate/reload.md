# `flowgraph_nodes_vehicle_beamstate_reload`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/beamstate/reload.lua` · VM: Game Engine (GE) · 39 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/beamstate/reload")` (file under extensions/ but not a regular extension)

Node "Reload Vehicle" (category `repeat_p_duration`, tag reset). Reloads the vehicle (`veh:reload()`), i.e. a full reload of the vehicle object. Input pin: `vehId`. If `vehId` is not connected, the node takes the player vehicle (`getPlayerVehicle(0)`).

## Notes

- Called every frame while the flow is active: connect it to a pulse to reload only once.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Calls `veh:reload()` on the found vehicle. | 25 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/beamstate/reload.lua`.*
