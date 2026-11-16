# `flowgraph_nodes_vehicle_moveTo`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/moveTo.lua` · VM: Game Engine (GE) · 70 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/moveTo")` (file under extensions/ but not a regular extension)

Node "Move Vehicle To" (category `repeat_instant`, tags rotation/position/teleport/move). Moves a vehicle. Input pins: `vehId`, `pos` (vec3), `rot` (quat), and hidden pins `safeTeleport`, `centerVehicle`, `repairVehicle` (default true if nil). Then triggers the `trackVehReset` hook.

## Notes

- With `repairVehicle` true/nil: `safeTeleport` -> `spawn.safeTeleport` (rotation corrected by `* quat(0,0,-1,0)`), otherwise `vehicleSetPositionRotation` (not centered, raw quaternion). With `repairVehicle` false: always `safeTeleport` without repair.
- Called every frame while the flow is active: the vehicle is repositioned every frame.
- Exits without doing anything if `pos` does not have 3 components.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Empty constructor. | 31 |
| `C:resetVehicle()` | Moves the vehicle according to `pos`/`rot` and the options, then `extensions.hook('trackVehReset')`. | 39 |
| `C:work()` | Calls `resetVehicle`. | 35 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `trackVehReset`

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/moveTo.lua`.*
