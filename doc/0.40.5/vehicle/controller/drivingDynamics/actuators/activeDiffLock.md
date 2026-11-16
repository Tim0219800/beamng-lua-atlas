# `controller_drivingDynamics_actuators_activeDiffLock`

*File: `lua/vehicle/controller/drivingDynamics/actuators/activeDiffLock.lua` · VM: Vehicle · 245 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `drivingDynamics/actuators/activeDiffLock` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Driving Dynamics Suite actuator: active locking of an axle differential. At 100 Hz (updateFixedStep) it compares the speeds of the two outputs corrected for the turning radius (`CMU.vehicleData.turningCircleSpeedRatios`); under throttle, a PID sets a locking coefficient 0..1 that rises when the speed difference exceeds `avDiffThreshold`. The coefficient is written to `relevantDifferential.activeLockCoef`. Supervisors can bound it with `overrideMin`/`overrideMax`. Call order: `defaultOrder = 80`.

## Notes

- jbeam keys read by init: `avDiffThreshold` (3 rad/s), `lockingPIDkP` (0.5), `lockingPIDkI` (0.5), `lockingPIDkD` (0), `name`. Read by initSecondStage: `differentialName`.
- Without throttle (`electrics.values.throttle` <= 0), the locking is 0 and the PID and the smoother are reset to zero.
- An output speed with the opposite sign to the input is set to 0 before computing the difference.
- Requires `CMU.vehicleData`; without a registered CMU, initSecondStage calls shutdown.
- `reset` does not reset `overrideMin`/`overrideMax` (call resetOverride) nor the internal coefficient.
- `shutdown` sets isActive/isActing to false and removes updateGFX and updateFixedStep.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_drivingDynamics_actuators_activeDiffLock.getConfig()` | Returns a copy of the parameters. | 217 |
| `controller_drivingDynamics_actuators_activeDiffLock.init(jbeamData)` | Reads the jbeam parameters and creates the PID. *(internal)* | 132 |
| `controller_drivingDynamics_actuators_activeDiffLock.initSecondStage(jbeamData)` | Finds the differential (`differentialName`) and the wheels of each output; enables the system. *(internal)* | 154 |
| `controller_drivingDynamics_actuators_activeDiffLock.registerCMU(cmu)` | Called by the CMU to give it a reference to itself. *(internal)* | 192 |
| `controller_drivingDynamics_actuators_activeDiffLock.reset()` | Sets isActing to false. *(internal)* | 128 |
| `controller_drivingDynamics_actuators_activeDiffLock.resetOverride()` | Resets the override bounds to 0 and 1. | 46 |
| `controller_drivingDynamics_actuators_activeDiffLock.sendConfigData()` | Sends the parameters to the CMU in a config debug packet. *(internal)* | 221 |
| `controller_drivingDynamics_actuators_activeDiffLock.setConfig(configTable)` | Replaces the whole parameter table. *(internal)* | 213 |
| `controller_drivingDynamics_actuators_activeDiffLock.setDebugMode(debugEnabled)` | Enables or disables sending debug packets. *(internal)* | 186 |
| `controller_drivingDynamics_actuators_activeDiffLock.setParameters(parameters)` | Changes avDiffThreshold, isEnabled and lockingPIDkP/kI/kD at runtime (via CMU.applyParameter). | 196 |
| `controller_drivingDynamics_actuators_activeDiffLock.shutdown()` | Stops the actuator. *(internal)* | 121 |
| `controller_drivingDynamics_actuators_activeDiffLock.updateFixedStep(dt)` | Fixed step (100 Hz): computes the corrected speed difference and the locking coefficient (smoothed PID, bounded by the override) and writes it to the differential's `activeLockCoef`. *(internal)* | 51 |
| `controller_drivingDynamics_actuators_activeDiffLock.updateGFX(dt)` | Every frame: nothing useful. Debug variant: sends the values to the CMU. *(internal)* | 93 |

### Parameter details

#### `controller_drivingDynamics_actuators_activeDiffLock.getConfig()`

Returns a copy of the parameters.

- **returns**: table Deep copy.

#### `controller_drivingDynamics_actuators_activeDiffLock.init(jbeamData)`

Reads the jbeam parameters and creates the PID.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_drivingDynamics_actuators_activeDiffLock.initSecondStage(jbeamData)`

Finds the differential (`differentialName`) and the wheels of each output; enables the system.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_drivingDynamics_actuators_activeDiffLock.registerCMU(cmu)`

Called by the CMU to give it a reference to itself.

- `cmu` (*table*) : CMU module.

#### `controller_drivingDynamics_actuators_activeDiffLock.setConfig(configTable)`

Replaces the whole parameter table.

- `configTable` (*table*) : New parameters.

#### `controller_drivingDynamics_actuators_activeDiffLock.setDebugMode(debugEnabled)`

Enables or disables sending debug packets.

- `debugEnabled` (*boolean*) : true to send.

#### `controller_drivingDynamics_actuators_activeDiffLock.setParameters(parameters)`

Changes avDiffThreshold, isEnabled and lockingPIDkP/kI/kD at runtime (via CMU.applyParameter).

- `parameters` (*table*) : Table of parameters to change.

#### `controller_drivingDynamics_actuators_activeDiffLock.updateFixedStep(dt)`

Fixed step (100 Hz): computes the corrected speed difference and the locking coefficient (smoothed PID, bounded by the override) and writes it to the differential's `activeLockCoef`.

- `dt` (*number*) : Step in seconds.

#### `controller_drivingDynamics_actuators_activeDiffLock.updateGFX(dt)`

Every frame: nothing useful. Debug variant: sends the values to the CMU.

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `defaultOrder` | number | 80. |
| `isActing` | boolean | true if the locking coefficient is > 0. |
| `isActive` | boolean | true if the differential and its wheels were found. |
| `overrideMax` | number | Upper bound of the locking (1 by default). |
| `overrideMin` | number | Lower bound of the locking (0 by default). |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/drivingDynamics/actuators/activeDiffLock.lua`.*
