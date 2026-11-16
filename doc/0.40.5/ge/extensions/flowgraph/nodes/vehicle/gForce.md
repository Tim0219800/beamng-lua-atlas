# `flowgraph_nodes_vehicle_gForce`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/gForce.lua` · VM: Game Engine (GE) · 71 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/gForce")` (file under extensions/ but not a regular extension)

Node "Gravity Force" (category `repeat_p_duration`, tags gravity/force/gforce). Computes the g-forces experienced by the vehicle from the vehicle's smoothed accelerations `accXSmooth/accYSmooth/accZSmooth` (read via `core_vehicleBridge`) and the gravity from `core_environment`. Outputs: `gx` (lateral), `gy` (longitudinal), `gz` (vertical, gravity removed), `gForce` (total) and `gForceZ0` (without vertical component, hidden pin). Input pin: `vehId` (default: player).

## Notes

- The values are stored in a local table shared by all gForce nodes of the file (`values`).
- The pin descriptions say gx = lateral, gy = longitudinal (conventions from the code).
- The gravity is clamped to |g| >= 0.01 with its sign; `accZSmooth == 0` is replaced by the gravity for the first frame.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Called by the manager when the flowgraph project execution starts; resets the internal state to zero. | 33 |
| `C:_executionStopped()` | Called by the manager when the project execution stops; cleans up the internal state. | 37 |
| `C:init()` | Node constructor, called at its creation by the flowgraph editor/manager; initializes the internal state. | 29 |
| `C:onNodeReset()` | Empty function (the initialization code is commented out). | 41 |
| `C:work()` | Reads the smoothed accelerations (subscribes to the values on the first call), divides them by gravity and fills the outputs in g. | 45 |

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`
- `core_environment.` `getGravity`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/gForce.lua`.*
