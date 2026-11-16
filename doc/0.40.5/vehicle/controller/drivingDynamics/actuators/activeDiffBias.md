# `controller_drivingDynamics_actuators_activeDiffBias`

*File: `lua/vehicle/controller/drivingDynamics/actuators/activeDiffBias.lua` · VM: Vehicle · 308 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `drivingDynamics/actuators/activeDiffBias` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Driving Dynamics Suite actuator: active torque split between the two outputs of a differential (torque vectoring). It compares the left and right wheel speeds corrected for the turning radius (`CMU.vehicleData.turningCircleSpeedRatios`) and, under throttle, uses a PID to compute a split offset (plus a term depending on the steering wheel, the longitudinal g and the throttle). The result sets the differential's `diffTorqueSplitA` and `diffTorqueSplitB` around 0.5/0.5. Call order: `defaultOrder = 80`.

## Notes

- jbeam keys read by init: `avDiffThreshold` (5), `brakingPIDkP` (0), `brakingPIDkI` (0.1), `brakingPIDkD` (0), `maxBiasOffset` (0.2), `name`. Read by initSecondStage: `differentialName`.
- The final offset `biasOffset` is limited by `overrideMin` and `overrideMax` (default -1 and 1), then: split A = 0.5 - biasOffset, split B = 1 - A.
- The wheels of each output are obtained through `powertrain.getChildWheels`; `wheelSides` indicates which output (-1 or 1) corresponds to the left or right side, computed by dot product with the vehicle's reference nodes.
- Requires `CMU.vehicleData` and `CMU.sensorHub`; without a registered CMU, initSecondStage calls shutdown.
- setParameters also tries the key `avThreshold`, which does not exist in this system's parameters (no effect, debug entry only).
- `shutdown` sets isActive/isActing to false and removes `updateGFX` and `updateFixedStep`. There is no `update` or `updateWheelsIntermediate`: the computation runs at 100 Hz in updateFixedStep.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_drivingDynamics_actuators_activeDiffBias.getConfig()` | Returns a copy of the parameters. | 280 |
| `controller_drivingDynamics_actuators_activeDiffBias.init(jbeamData)` | Reads the jbeam parameters and creates the split PID. *(internal)* | 156 |
| `controller_drivingDynamics_actuators_activeDiffBias.initSecondStage(jbeamData)` | Finds the differential (`differentialName`), its wheels per output and the left/right side; enables the system. *(internal)* | 180 |
| `controller_drivingDynamics_actuators_activeDiffBias.registerCMU(cmu)` | Called by the CMU to give it a reference to itself. *(internal)* | 253 |
| `controller_drivingDynamics_actuators_activeDiffBias.reset()` | Resets isActing and the override bounds to their initial value. *(internal)* | 150 |
| `controller_drivingDynamics_actuators_activeDiffBias.resetOverride()` | Resets the override bounds to -1 and 1. | 51 |
| `controller_drivingDynamics_actuators_activeDiffBias.sendConfigData()` | Sends the parameters to the CMU in a config debug packet. *(internal)* | 284 |
| `controller_drivingDynamics_actuators_activeDiffBias.setConfig(configTable)` | Replaces the whole parameter table. *(internal)* | 276 |
| `controller_drivingDynamics_actuators_activeDiffBias.setDebugMode(debugEnabled)` | Enables or disables sending debug packets. *(internal)* | 247 |
| `controller_drivingDynamics_actuators_activeDiffBias.setParameters(parameters)` | Changes avDiffThreshold, isEnabled, maxBiasOffset and brakingPIDkP/kI/kD at runtime (via CMU.applyParameter). | 257 |
| `controller_drivingDynamics_actuators_activeDiffBias.shutdown()` | Stops the actuator. *(internal)* | 143 |
| `controller_drivingDynamics_actuators_activeDiffBias.updateFixedStep(dt)` | Fixed step (100 Hz): computes the corrected speeds and the split offset (PID + steering wheel term) and sets the differential's torque split. *(internal)* | 56 |
| `controller_drivingDynamics_actuators_activeDiffBias.updateGFX(dt)` | Every frame: nothing useful (returns if disabled). Debug variant: sends the values to the CMU. *(internal)* | 112 |

### Parameter details

#### `controller_drivingDynamics_actuators_activeDiffBias.getConfig()`

Returns a copy of the parameters.

- **returns**: table Deep copy.

#### `controller_drivingDynamics_actuators_activeDiffBias.init(jbeamData)`

Reads the jbeam parameters and creates the split PID.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_drivingDynamics_actuators_activeDiffBias.initSecondStage(jbeamData)`

Finds the differential (`differentialName`), its wheels per output and the left/right side; enables the system.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_drivingDynamics_actuators_activeDiffBias.registerCMU(cmu)`

Called by the CMU to give it a reference to itself.

- `cmu` (*table*) : CMU module.

#### `controller_drivingDynamics_actuators_activeDiffBias.setConfig(configTable)`

Replaces the whole parameter table.

- `configTable` (*table*) : New parameters.

#### `controller_drivingDynamics_actuators_activeDiffBias.setDebugMode(debugEnabled)`

Enables or disables sending debug packets.

- `debugEnabled` (*boolean*) : true to send.

#### `controller_drivingDynamics_actuators_activeDiffBias.setParameters(parameters)`

Changes avDiffThreshold, isEnabled, maxBiasOffset and brakingPIDkP/kI/kD at runtime (via CMU.applyParameter).

- `parameters` (*table*) : Table of parameters to change.

#### `controller_drivingDynamics_actuators_activeDiffBias.updateFixedStep(dt)`

Fixed step (100 Hz): computes the corrected speeds and the split offset (PID + steering wheel term) and sets the differential's torque split.

- `dt` (*number*) : Step in seconds.

#### `controller_drivingDynamics_actuators_activeDiffBias.updateGFX(dt)`

Every frame: nothing useful (returns if disabled). Debug variant: sends the values to the CMU.

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `defaultOrder` | number | 80. |
| `isActing` | boolean | true if the split offset is non-zero. |
| `isActive` | boolean | true if the differential and the wheels were found. |
| `overrideMax` | number | Upper bound of the offset (1 by default). |
| `overrideMin` | number | Lower bound of the offset imposed by a supervisor (-1 by default). |
| `type` | string | "auxiliary". |
| `wheelSides` | table<string, integer> | {left = -1\|1, right = -1\|1}: indicates which differential output feeds the left or right side (filled by initSecondStage). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/drivingDynamics/actuators/activeDiffBias.lua`.*
