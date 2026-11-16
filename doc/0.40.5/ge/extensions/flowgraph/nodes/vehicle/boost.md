# `flowgraph_nodes_vehicle_boost`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/boost.lua` · VM: Game Engine (GE) · 55 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/boost")` (file under extensions/ but not a regular extension)

Node "Boost Vehicle" (category `repeat_p_duration`, tags boost/thrust). Loads the vehicle extension `core_booster` then calls `core_booster.boost({power,0,0}, dtSim)` every frame. Input pins: `vehId`, `power` (number). Marked `obsolete` in the code ("unknown status, try Apply Velocity").

## Notes

- `C.todo`: the author does not know whether the node works. `C.obsolete` points to the Apply Velocity node.
- No `veh == nil` test: crashes if no vehicle is found (the player fallback can also give nil).
- The boost vector is {power, 0, 0}: the power is applied only on the X axis (presumed vehicle frame).

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Resets `loaded = false` to reload `core_booster` at the next start. | 34 |
| `C:init()` | Constructor; `loaded = false` (the extension is not yet loaded on the vehicle side). | 30 |
| `C:work()` | Loads `core_booster` in the vehicle VM the first time, then sends `core_booster.boost({power,0,0}, dtSim)` every frame. | 38 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/boost.lua`.*
