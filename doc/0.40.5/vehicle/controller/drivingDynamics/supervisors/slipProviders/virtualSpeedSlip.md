# `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip`

*File: `lua/vehicle/controller/drivingDynamics/supervisors/slipProviders/virtualSpeedSlip.lua` · VM: Vehicle · 173 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `drivingDynamics/supervisors/slipProviders/virtualSpeedSlip` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Slip provider (type "auxiliary", defaultOrder 70, providerOrder 10) that compares each wheel's speed to the vehicle's virtual speed (virtualSensors.virtual.speed) to estimate slip. It registers with the tractionControl and absControl supervisors (if present) and answers them via calculateSlipTractionControl and calculateSlipABSControl. The results are written into the supervisor's wheel structures (wheelData.slip, wheelGroup.maxSlip/minSlip/slipRange).

## Notes

- Traction slip = clamp((wheelSpeed + offset) / (virtualSpeed + offset) - 1, 0, 0.5) * coefficient, smoothed by wheelData.slipSmoother. The coefficient is the minimum of: torque coefficient (motor throttle, 0..0.01 -> 0..1), the supervisor's steeringCoef, and the virtualSpeed confidence (0.5..0.8 -> 0..1). The wheel speed is corrected by vehicleData.turningCircleSpeedRatios.
- ABS slip = absolute value of (ratio - 1) bounded to 0.5, multiplied by the speed confidence, also smoothed.
- Modifiable parameters: tractionControl.isEnabled, absControl.isEnabled. When traction control is disabled, the slips are reset to 0 and calculateSlipTractionControl returns false (the next provider is then tried).
- No jbeam key is read. The provider depends on CMU.virtualSensors and CMU.vehicleData.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.calculateSlipABSControl(wheelData, velocityOffset, dt)` | Computes the slip (as an absolute value) of a single wheel for the ABS. Called by the absControl supervisor. | 65 |
| `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.calculateSlipTractionControl(wheelGroup, steeringCoef, velocityOffset, dt)` | Computes the slip of each wheel of a powered group and the group's extremes. Called by tractionControl. | 27 |
| `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.getConfig()` | Returns a copy of the configuration. | 144 |
| `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.init(jbeamData)` | Sets isActive to true. *(internal)* | 109 |
| `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.initLastStage(jbeamData)` | Saves the initial parameters. *(internal)* | 125 |
| `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.initSecondStage(jbeamData)` | Registers as a slip provider with tractionControl and absControl. *(internal)* | 113 |
| `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.registerCMU(cmu)` | Stores the reference to the CMU. *(internal)* | 102 |
| `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.reset()` | Does nothing. *(internal)* | 106 |
| `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.sendConfigData()` | Sends the configuration to the CMU. | 148 |
| `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.setConfig(configTable)` | Replaces the configuration. | 140 |
| `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.setDebugMode(debugEnabled)` | Enables/disables debug packets. | 96 |
| `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.setParameters(parameters)` | Applies tractionControl.isEnabled and absControl.isEnabled. | 135 |
| `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.shutdown()` | Disables the provider. | 129 |
| `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.updateGFX(dt)` | Empty (debug version: sends the enabled state). *(internal)* | 84 |

### Parameter details

#### `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.calculateSlipABSControl(wheelData, velocityOffset, dt)`

Computes the slip (as an absolute value) of a single wheel for the ABS. Called by the absControl supervisor.

- `wheelData` (*table*) : Wheel data {wd, slip, slipSmoother}.
- `velocityOffset` (*number*) : Speed offset (m/s).
- `dt` (*number*) : Time step (s), unused.
- **returns**: boolean True if the slip was computed, false if disabled.

#### `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.calculateSlipTractionControl(wheelGroup, steeringCoef, velocityOffset, dt)`

Computes the slip of each wheel of a powered group and the group's extremes. Called by tractionControl.

- `wheelGroup` (*table*) : Wheel group {motor, wheels, wheelCount, maxSlip, minSlip, slipRange}.
- `steeringCoef` (*number*) : 0.5..1 factor tied to steering.
- `velocityOffset` (*number*) : Speed offset (m/s) avoiding division by ~0 at low speed.
- `dt` (*number*) : Time step (s), unused.
- **returns**: boolean True if the slip was computed, false if disabled.

#### `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.getConfig()`

Returns a copy of the configuration.

- **returns**: table Copy.

#### `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.init(jbeamData)`

Sets isActive to true.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.initLastStage(jbeamData)`

Saves the initial parameters.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.initSecondStage(jbeamData)`

Registers as a slip provider with tractionControl and absControl.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.registerCMU(cmu)`

Stores the reference to the CMU.

- `cmu` (*table*) : CMU controller.

#### `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.setConfig(configTable)`

Replaces the configuration.

- `configTable` (*table*) : Table {tractionControl = {isEnabled}, absControl = {isEnabled}}.

#### `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.setDebugMode(debugEnabled)`

Enables/disables debug packets.

- `debugEnabled` (*boolean*) : True to enable.

#### `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.setParameters(parameters)`

Applies tractionControl.isEnabled and absControl.isEnabled.

- `parameters` (*table<string, any>*) : Parameters to apply.

#### `controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.updateGFX(dt)`

Empty (debug version: sends the enabled state).

- `dt` (*number*) : Graphics time step (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `defaultOrder` | number | Default execution order (70). |
| `isActive` | boolean | True after init. |
| `providerOrder` | number | Priority order among the providers (10, lower = tried first). |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/drivingDynamics/supervisors/slipProviders/virtualSpeedSlip.lua`.*
