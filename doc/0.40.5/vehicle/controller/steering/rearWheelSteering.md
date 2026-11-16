# `controller_steering_rearWheelSteering`

*File: `lua/vehicle/controller/steering/rearWheelSteering.lua` · VM: Vehicle · 64 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `steering/rearWheelSteering` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary rear wheel steering controller. In feedForward mode, it computes a rear steering output from a map (wheel speed, front steering) and publishes it in electrics.values.rws (configurable name) for a jbeam steering control to use. The closedLoop mode is not implemented.

## Notes

- jbeam keys read: mode ("feedForward" or "closedLoop", default feedForward), rearSteeringOutputElectricsName ("rws"), feedForwardMapData (interpolatedMap data: x = speed in m/s, y = front steering electrics steering_input -> output), required in feedForward.
- Reads electrics.values.steering_input and wheelspeed.
- closedLoop: log W "not implemented" and updateGFX does nothing.
- Invalid mode: log E but M.updateGFX receives nil.
- Without feedForwardMapData: log E, init returns, the map stays nil and updateGFX (already assigned) will fail on the call to feedForwardMap:get.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_steering_rearWheelSteering.init(jbeamData)` | Chooses the update function depending on the mode and loads the feedForward map. *(internal)* | 35 |
| `controller_steering_rearWheelSteering.reset(jbeamData)` | Resets the output electric to 0. *(internal)* | 31 |

### Parameter details

#### `controller_steering_rearWheelSteering.init(jbeamData)`

Chooses the update function depending on the mode and loads the feedForward map.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_steering_rearWheelSteering.reset(jbeamData)`

Resets the output electric to 0.

- `jbeamData` (*table*) : Jbeam data.

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |
| `updateGFX` | function|nil | Assigned in init depending on the mode. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/steering/rearWheelSteering.lua`.*
