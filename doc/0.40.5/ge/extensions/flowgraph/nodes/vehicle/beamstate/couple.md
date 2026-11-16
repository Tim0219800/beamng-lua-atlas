# `flowgraph_nodes_vehicle_beamstate_couple`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/beamstate/couple.lua` · VM: Game Engine (GE) · 67 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/beamstate/couple")` (file under extensions/ but not a regular extension)

Node "Toggle Coupling" (category `repeat_p_duration`, tags attach/detach/trailer/couple). Controls a vehicle's couplers according to the `data.mode` property: `toggle` (`beamstate.toggleCouplers()`), `activate` (`activateAutoCoupling()`, default), `disable` (`disableAutoCoupling()`), `detach` (`detachCouplers()`). Input pin: `vehId`. If `vehId` is not connected, the node takes the player vehicle (`getPlayerVehicle(0)`).

## Notes

- The mode is not a pin: it is `self.data.mode`, set in the editor. An unknown value displays "(!)" in the node and does nothing.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:drawMiddle(builder, style)` | ImGui display in the center of the node in the flowgraph editor; purely visual. | 52 |
| `C:init(mgr, ...)` | Constructor; sets `data.mode = "activate"` (parameters `mgr, ...` ignored). | 26 |
| `C:work()` | Sends the beamstate command matching `data.mode` to the vehicle. | 30 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/beamstate/couple.lua`.*
