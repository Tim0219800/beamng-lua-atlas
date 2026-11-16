# `controller_drivingDynamics_actuators_electronicDiffLock`

*File: `lua/vehicle/controller/drivingDynamics/actuators/electronicDiffLock.lua` · VM: Vehicle · 269 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `drivingDynamics/actuators/electronicDiffLock` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Driving Dynamics Suite actuator: electronic brake-based locking differential (EDL, "brake-based": the slipping wheel is braked to transfer torque). At each intermediate physics step, it compares the speeds of the two outputs corrected for the turning radius (`CMU.vehicleData.turningCircleSpeedRatios`); if the difference exceeds `avDiffThreshold` under throttle (> 0.05), a PID computes a braking coefficient applied as `desiredBrakingTorque` to the wheels on the faster side. Call order: `defaultOrder = 80`.

## Notes

- jbeam keys read by init: `avDiffThreshold` (5 rad/s), `avThreshold` (1 rad/s: minimum sum of the output speeds), `brakingPIDkP` (0), `brakingPIDkI` (0.1), `brakingPIDkD` (0), `name`. Read by initSecondStage: `differentialName`.
- The maximum braking is bounded by `overrideMax` (1 by default) and by each wheel's `brakeTorque`; a wheel that is `isBroken` is not braked.
- Quirk: `overrideMin` is never defined or used in this file before a call to resetOverride (which sets it to 0); only `overrideMax` actually bounds the braking.
- Requires `CMU.vehicleData`; without a registered CMU, initSecondStage calls shutdown. `shutdown` removes updateGFX and updateWheelsIntermediate (nil).
- `reset` sets `overrideMax` back to 1 but does not touch the smoothers or the PID.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_drivingDynamics_actuators_electronicDiffLock.getConfig()` | Returns a copy of the parameters. | 241 |
| `controller_drivingDynamics_actuators_electronicDiffLock.init(jbeamData)` | Reads the jbeam parameters and creates the braking PID. *(internal)* | 152 |
| `controller_drivingDynamics_actuators_electronicDiffLock.initSecondStage(jbeamData)` | Finds the differential (`differentialName`) and the wheels of each output; enables the system. *(internal)* | 175 |
| `controller_drivingDynamics_actuators_electronicDiffLock.registerCMU(cmu)` | Called by the CMU to give it a reference to itself. *(internal)* | 215 |
| `controller_drivingDynamics_actuators_electronicDiffLock.reset()` | Sets isActing to false and overrideMax to 1. *(internal)* | 147 |
| `controller_drivingDynamics_actuators_electronicDiffLock.resetOverride()` | Resets the override bounds: overrideMin = 0, overrideMax = 1. | 48 |
| `controller_drivingDynamics_actuators_electronicDiffLock.sendConfigData()` | Sends the parameters to the CMU in a config debug packet. *(internal)* | 245 |
| `controller_drivingDynamics_actuators_electronicDiffLock.setConfig(configTable)` | Replaces the whole parameter table. *(internal)* | 237 |
| `controller_drivingDynamics_actuators_electronicDiffLock.setDebugMode(debugEnabled)` | Enables or disables sending debug packets. *(internal)* | 209 |
| `controller_drivingDynamics_actuators_electronicDiffLock.setParameters(parameters)` | Changes avDiffThreshold, avThreshold, isEnabled and brakingPIDkP/kI/kD at runtime (via CMU.applyParameter). | 219 |
| `controller_drivingDynamics_actuators_electronicDiffLock.shutdown()` | Stops the actuator. *(internal)* | 140 |
| `controller_drivingDynamics_actuators_electronicDiffLock.updateGFX(dt)` | Every frame: nothing useful. Debug variant: sends the values to the CMU. *(internal)* | 110 |
| `controller_drivingDynamics_actuators_electronicDiffLock.updateWheelsIntermediate(dt)` | Intermediate physics step: computes the corrected output speeds, the braking coefficient (PID) and adds the braking torque to the wheels on the slipping side. *(internal)* | 53 |

### Parameter details

#### `controller_drivingDynamics_actuators_electronicDiffLock.getConfig()`

Returns a copy of the parameters.

- **returns**: table Deep copy.

#### `controller_drivingDynamics_actuators_electronicDiffLock.init(jbeamData)`

Reads the jbeam parameters and creates the braking PID.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_drivingDynamics_actuators_electronicDiffLock.initSecondStage(jbeamData)`

Finds the differential (`differentialName`) and the wheels of each output; enables the system.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_drivingDynamics_actuators_electronicDiffLock.registerCMU(cmu)`

Called by the CMU to give it a reference to itself.

- `cmu` (*table*) : CMU module.

#### `controller_drivingDynamics_actuators_electronicDiffLock.setConfig(configTable)`

Replaces the whole parameter table.

- `configTable` (*table*) : New parameters.

#### `controller_drivingDynamics_actuators_electronicDiffLock.setDebugMode(debugEnabled)`

Enables or disables sending debug packets.

- `debugEnabled` (*boolean*) : true to send.

#### `controller_drivingDynamics_actuators_electronicDiffLock.setParameters(parameters)`

Changes avDiffThreshold, avThreshold, isEnabled and brakingPIDkP/kI/kD at runtime (via CMU.applyParameter).

- `parameters` (*table*) : Table of parameters to change.

#### `controller_drivingDynamics_actuators_electronicDiffLock.updateGFX(dt)`

Every frame: nothing useful. Debug variant: sends the values to the CMU.

- `dt` (*number*) : Time step in seconds.

#### `controller_drivingDynamics_actuators_electronicDiffLock.updateWheelsIntermediate(dt)`

Intermediate physics step: computes the corrected output speeds, the braking coefficient (PID) and adds the braking torque to the wheels on the slipping side.

- `dt` (*number*) : Step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `defaultOrder` | number | 80. |
| `isActing` | boolean | true if the speed difference justifies braking. |
| `isActive` | boolean | true if the differential and its wheels were found. |
| `overrideMax` | number | Ceiling of the braking coefficient imposed by a supervisor (1 by default). |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/drivingDynamics/actuators/electronicDiffLock.lua`.*
