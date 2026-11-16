# `flowgraph_nodes_vehicle_spawnVehicle`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/spawnVehicle.lua` · VM: Game Engine (GE) · 244 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/spawnVehicle")` (file under extensions/ but not a regular extension)

Node "Spawn Vehicle": creates a vehicle (`core_vehicles.spawnNewVehicle` or `replaceVehicle` if `replacePlayer`), waits until it is ready then exposes its id. Input pins: `flow`, `reset` (pulse, deletes and resets), `model` (default 'pickup'), `config` (string or table, default 'vehicles/pickup/d15_4wd_A.pc'), `pos` (vec3), `rot` (quat), and hidden `licenseText`, `color` (color or paint name), `randomColor`, `name`, `replacePlayer`, `keepCamera`, `keepVehicle`, `keepOnReset`. Outputs: `flow` (once loaded), `loaded` (pulse), `vehId`. State machine `state`: 1 spawn, 2 wait for `ready`, 3 output, 4 hold, 5 failure.

## Notes

- Spawn failure: retries every second for 10 s, then E log, goes to state 5 and, if the flowgraph is linked to an activity, aborts the mission with a fade.
- The provided rotation is multiplied by `quat(0,0,1,0)` (180°).
- Random color disabled for Police or Service type configs.
- `autoEnterVehicle` = not `keepCamera`.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets the state and the outputs at start. | 93 |
| `C:_executionStopped()` | Resets the state and the vehicle reference. | 85 |
| `C:drawMiddle(builder, style)` | Central display of the node, empty. | 237 |
| `C:getCmd(action)` | Builds a Lua command to call `buttonPushed(action)` on this node from another VM (inferred from code). | 233 |
| `C:init()` | Constructor; state 1, `flow` output false. | 55 |
| `C:onSpawnFailed()` | Called when the spawn fails: schedules a new attempt (1 s) or gives up after 10 s. | 62 |
| `C:postInit()` | Marks the `color` pin with `colorSetup = {vehicleColor = true}`. | 79 |
| `C:resetSpawnRetry()` | Resets the timer and the accumulated spawn failure time to zero. | 50 |
| `C:work()` | Spawn state machine (see module); also handles `reset`. | 103 |

## Calls into the engine (C++)

- `obj:` `delete`, `getId`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/spawnVehicle.lua`.*
