# `controller_drivingDynamics_actuators_activeCenterDiffLock`

*File: `lua/vehicle/controller/drivingDynamics/actuators/activeCenterDiffLock.lua` · VM: Vehicle · 260 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `drivingDynamics/actuators/activeCenterDiffLock` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Driving Dynamics Suite actuator: active locking of the center differential (electronically controlled clutch). At each intermediate physics step, it reads the center differential's output speeds, measures the speed difference between axles and sets, via a PID, a locking coefficient 0..1 written into `relevantDiff.activeLockCoef`. The locking is cut when braking, without throttle or with the parking brake, frozen during a gear change, and can have a minimum. The CMU's supervisors can limit it with `overrideMin`/`overrideMax`. Call order: `defaultOrder = 80`.

## Notes

- Jbeam keys read by init: `avDiffThreshold` (4 rad/s), `avThreshold` (1 rad/s: minimum average speed), `minimumLock` (0), `clutchPIDkP` (0.15), `clutchPIDkI` (0.001), `clutchPIDkD` (0), `applyMinimumLockOnlyWithThrottle` (true), `name` (used for the debug source). Read by initSecondStage: `centerDiffName` (name of the center differential in the powertrain).
- The final coefficient = clamp(lockCoef, overrideMin, overrideMax); the code comment specifies that depending on the powertrain layout it is the min or the max of the override that is used.
- Without a registered CMU (registerCMU not called), initSecondStage calls shutdown; if the differential is not found, the actuator stays inactive (isActive = false).
- The `isESCActive` test is a constant false in the code (never activated). `electrics.values.brake`, `parkingbrake`, `throttle` are read without a default value.
- The debug packets carry the type "electronicCenterDiffLock" (old name of the system); `configPacket.sourceName` is not defined.
- `shutdown` sets `isActive` and `isActing` to false and removes `updateGFX` and `updateWheelsIntermediate` (nil).

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_drivingDynamics_actuators_activeCenterDiffLock.getConfig()` | Returns a copy of the parameters. | 232 |
| `controller_drivingDynamics_actuators_activeCenterDiffLock.init(jbeamData)` | Reads the jbeam parameters and creates the locking PID. *(internal)* | 147 |
| `controller_drivingDynamics_actuators_activeCenterDiffLock.initSecondStage(jbeamData)` | Finds the center differential (`centerDiffName`) and enables the system; stops if the CMU is missing. *(internal)* | 176 |
| `controller_drivingDynamics_actuators_activeCenterDiffLock.registerCMU(cmu)` | Called by the CMU to give it a reference to itself. *(internal)* | 206 |
| `controller_drivingDynamics_actuators_activeCenterDiffLock.reset()` | Resets the states, smoothed speeds, override and `activeLockCoef` to zero. *(internal)* | 132 |
| `controller_drivingDynamics_actuators_activeCenterDiffLock.resetOverride()` | Resets the override bounds to 0 and 1. | 43 |
| `controller_drivingDynamics_actuators_activeCenterDiffLock.sendConfigData()` | Sends the parameters to the CMU in a debug packet of type config. *(internal)* | 236 |
| `controller_drivingDynamics_actuators_activeCenterDiffLock.setConfig(configTable)` | Replaces the whole parameter table (used by the debug tool). *(internal)* | 228 |
| `controller_drivingDynamics_actuators_activeCenterDiffLock.setDebugMode(debugEnabled)` | Enables or disables sending debug packets every frame. *(internal)* | 200 |
| `controller_drivingDynamics_actuators_activeCenterDiffLock.setParameters(parameters)` | Changes the parameters at runtime (avDiffThreshold, avThreshold, minimumLock, isEnabled, clutchPIDkP/kI/kD) via CMU.applyParameter; the value "default" restores the initial one. | 210 |
| `controller_drivingDynamics_actuators_activeCenterDiffLock.shutdown()` | Stops the actuator (called by the CMU in case of an incomplete system). *(internal)* | 125 |
| `controller_drivingDynamics_actuators_activeCenterDiffLock.updateGFX(dt)` | Every frame: does nothing useful (returns if disabled). Debug variant: sends the values to the CMU. *(internal)* | 98 |
| `controller_drivingDynamics_actuators_activeCenterDiffLock.updateWheelsIntermediate(dt)` | Intermediate physics step: computes the locking coefficient (PID on the speed difference between outputs, brake, throttle, gear and parking brake conditions), applies the override and writes it into the differential's `activeLockCoef`. *(internal)* | 48 |

### Parameter details

#### `controller_drivingDynamics_actuators_activeCenterDiffLock.getConfig()`

Returns a copy of the parameters.

- **returns**: table Deep copy of the parameters.

#### `controller_drivingDynamics_actuators_activeCenterDiffLock.init(jbeamData)`

Reads the jbeam parameters and creates the locking PID.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_drivingDynamics_actuators_activeCenterDiffLock.initSecondStage(jbeamData)`

Finds the center differential (`centerDiffName`) and enables the system; stops if the CMU is missing.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_drivingDynamics_actuators_activeCenterDiffLock.registerCMU(cmu)`

Called by the CMU to give it a reference to itself.

- `cmu` (*table*) : CMU module.

#### `controller_drivingDynamics_actuators_activeCenterDiffLock.setConfig(configTable)`

Replaces the whole parameter table (used by the debug tool).

- `configTable` (*table*) : New parameters.

#### `controller_drivingDynamics_actuators_activeCenterDiffLock.setDebugMode(debugEnabled)`

Enables or disables sending debug packets every frame.

- `debugEnabled` (*boolean*) : true to send.

#### `controller_drivingDynamics_actuators_activeCenterDiffLock.setParameters(parameters)`

Changes the parameters at runtime (avDiffThreshold, avThreshold, minimumLock, isEnabled, clutchPIDkP/kI/kD) via CMU.applyParameter; the value "default" restores the initial one.

- `parameters` (*table*) : Table of parameters to change.

#### `controller_drivingDynamics_actuators_activeCenterDiffLock.updateGFX(dt)`

Every frame: does nothing useful (returns if disabled). Debug variant: sends the values to the CMU.

- `dt` (*number*) : Time step in seconds.

#### `controller_drivingDynamics_actuators_activeCenterDiffLock.updateWheelsIntermediate(dt)`

Intermediate physics step: computes the locking coefficient (PID on the speed difference between outputs, brake, throttle, gear and parking brake conditions), applies the override and writes it into the differential's `activeLockCoef`.

- `dt` (*number*) : Step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `defaultOrder` | number | 80. |
| `isActing` | boolean | true if the locking coefficient exceeds 0.01. |
| `isActive` | boolean | true if the system found its differential and its CMU. |
| `overrideMax` | number | Upper bound imposed by a supervisor (1 by default). |
| `overrideMin` | number | Lower bound imposed by a supervisor (0 by default). |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/drivingDynamics/actuators/activeCenterDiffLock.lua`.*
