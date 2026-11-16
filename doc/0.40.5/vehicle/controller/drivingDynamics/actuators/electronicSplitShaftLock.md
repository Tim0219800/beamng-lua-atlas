# `controller_drivingDynamics_actuators_electronicSplitShaftLock`

*File: `lua/vehicle/controller/drivingDynamics/actuators/electronicSplitShaftLock.lua` · VM: Vehicle · 257 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `drivingDynamics/actuators/electronicSplitShaftLock` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Driving Dynamics Suite actuator: electronic locking of a split shaft (Haldex-type transfer clutch). At each intermediate physics step, it compares the input speed to that of the secondary output (`secondaryOutputAVName`); a PID sets the shaft's clutch ratio `clutchRatio` (0..1) to reduce the difference. The locking is cut when braking or without throttle (except left-foot braking), frozen during a gear change, with a possible minimum, and zero with the parking brake. Call order: `defaultOrder = 80`.

## Notes

- jbeam keys read by init: `avDiffThreshold` (4 rad/s), `avThreshold` (1 rad/s), `minimumLock` (0), `clutchPIDkP` (0.1), `clutchPIDkI` (1), `clutchPIDkD` (0), `applyMinimumLockOnlyWithThrottle` (true), `name`. Read by initSecondStage: `splitShaftName`.
- Internal thresholds: brake considered active above 0.1; throttle considered released at 0 or less.
- The final ratio is clamp(clutchRatio, overrideMin, overrideMax); the code comment states that depending on the powertrain layout, it is either the min or the max of the override that matters.
- Without a registered CMU, initSecondStage calls shutdown; if the shaft is not found, the system stays inactive. `electrics.values.brake`, `throttle`, `parkingbrake` are read without a default value.
- `shutdown` removes updateGFX and updateWheelsIntermediate (nil).

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_drivingDynamics_actuators_electronicSplitShaftLock.getConfig()` | Returns a copy of the parameters. | 229 |
| `controller_drivingDynamics_actuators_electronicSplitShaftLock.init(jbeamData)` | Reads the jbeam parameters and creates the clutch PID. *(internal)* | 146 |
| `controller_drivingDynamics_actuators_electronicSplitShaftLock.initSecondStage(jbeamData)` | Finds the split shaft (`splitShaftName`) and enables the system. *(internal)* | 175 |
| `controller_drivingDynamics_actuators_electronicSplitShaftLock.registerCMU(cmu)` | Called by the CMU to give it a reference to itself. *(internal)* | 203 |
| `controller_drivingDynamics_actuators_electronicSplitShaftLock.reset()` | Resets isActing and the override bounds to their initial value. *(internal)* | 140 |
| `controller_drivingDynamics_actuators_electronicSplitShaftLock.resetOverride()` | Resets the override bounds to 0 and 1. | 46 |
| `controller_drivingDynamics_actuators_electronicSplitShaftLock.sendConfigData()` | Sends the parameters to the CMU in a config debug packet. *(internal)* | 233 |
| `controller_drivingDynamics_actuators_electronicSplitShaftLock.setConfig(configTable)` | Replaces the whole parameter table. *(internal)* | 225 |
| `controller_drivingDynamics_actuators_electronicSplitShaftLock.setDebugMode(debugEnabled)` | Enables or disables sending debug packets. *(internal)* | 197 |
| `controller_drivingDynamics_actuators_electronicSplitShaftLock.setParameters(parameters)` | Changes avDiffThreshold, avThreshold, minimumLock, isEnabled and clutchPIDkP/kI/kD at runtime (via CMU.applyParameter). | 207 |
| `controller_drivingDynamics_actuators_electronicSplitShaftLock.shutdown()` | Stops the actuator. *(internal)* | 133 |
| `controller_drivingDynamics_actuators_electronicSplitShaftLock.updateGFX(dt)` | Every frame: nothing useful. Debug variant: sends the values to the CMU. *(internal)* | 106 |
| `controller_drivingDynamics_actuators_electronicSplitShaftLock.updateWheelsIntermediate(dt)` | Intermediate physics step: computes the clutch ratio (PID, driving conditions, override) and writes it to the split shaft's `clutchRatio`. *(internal)* | 51 |

### Parameter details

#### `controller_drivingDynamics_actuators_electronicSplitShaftLock.getConfig()`

Returns a copy of the parameters.

- **returns**: table Deep copy.

#### `controller_drivingDynamics_actuators_electronicSplitShaftLock.init(jbeamData)`

Reads the jbeam parameters and creates the clutch PID.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_drivingDynamics_actuators_electronicSplitShaftLock.initSecondStage(jbeamData)`

Finds the split shaft (`splitShaftName`) and enables the system.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_drivingDynamics_actuators_electronicSplitShaftLock.registerCMU(cmu)`

Called by the CMU to give it a reference to itself.

- `cmu` (*table*) : CMU module.

#### `controller_drivingDynamics_actuators_electronicSplitShaftLock.setConfig(configTable)`

Replaces the whole parameter table.

- `configTable` (*table*) : New parameters.

#### `controller_drivingDynamics_actuators_electronicSplitShaftLock.setDebugMode(debugEnabled)`

Enables or disables sending debug packets.

- `debugEnabled` (*boolean*) : true to send.

#### `controller_drivingDynamics_actuators_electronicSplitShaftLock.setParameters(parameters)`

Changes avDiffThreshold, avThreshold, minimumLock, isEnabled and clutchPIDkP/kI/kD at runtime (via CMU.applyParameter).

- `parameters` (*table*) : Table of parameters to change.

#### `controller_drivingDynamics_actuators_electronicSplitShaftLock.updateGFX(dt)`

Every frame: nothing useful. Debug variant: sends the values to the CMU.

- `dt` (*number*) : Time step in seconds.

#### `controller_drivingDynamics_actuators_electronicSplitShaftLock.updateWheelsIntermediate(dt)`

Intermediate physics step: computes the clutch ratio (PID, driving conditions, override) and writes it to the split shaft's `clutchRatio`.

- `dt` (*number*) : Step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `defaultOrder` | number | 80. |
| `isActing` | boolean | true if the clutch ratio exceeds 0.01. |
| `isActive` | boolean | true if the split shaft was found. |
| `overrideMax` | number | Upper bound of the clutch ratio (1 by default). |
| `overrideMin` | number | Lower bound of the clutch ratio (0 by default). |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/drivingDynamics/actuators/electronicSplitShaftLock.lua`.*
