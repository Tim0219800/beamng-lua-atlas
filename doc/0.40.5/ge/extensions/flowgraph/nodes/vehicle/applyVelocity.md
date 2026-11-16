# `flowgraph_nodes_vehicle_applyVelocity`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/applyVelocity.lua` · VM: Game Engine (GE) · 40 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/applyVelocity")` (file under extensions/ but not a regular extension)

Flowgraph node "Apply Velocity to Vehicle" (category `repeat_p_duration`, tags boost/thrust/move). Instantly gives a velocity to a vehicle by calling `thrusters.applyVelocity(vec)` in the vehicle VM. Input pins: `vehId` (number), `dirVec` (vec3, otherwise vehicle direction), `coefficient` (number, default 1, multiplier of the vector). No output. If `vehId` is not connected, the node takes the player vehicle (`getPlayerVehicle(0)`).

## Notes

- `work` runs every frame while the flow is active: the velocity is reapplied every frame.
- The vector is serialized as is into a Lua command; unit = m/s (inferred from the name of the thrusters function, not verified here).

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Finds the vehicle, builds the vector (dirVec or vehicle direction) multiplied by `coefficient`, then sends `thrusters.applyVelocity(...)` to the vehicle VM. | 26 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/applyVelocity.lua`.*
