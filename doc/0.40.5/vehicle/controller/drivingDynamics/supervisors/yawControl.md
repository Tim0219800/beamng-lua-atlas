# `controller_drivingDynamics_supervisors_yawControl`

*File: `lua/vehicle/controller/drivingDynamics/supervisors/yawControl.lua` · VM: Vehicle · 230 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `drivingDynamics/supervisors/yawControl` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Yaw control supervisor (modern ESC, type "auxiliary", defaultOrder 60) of the drivingDynamics architecture. At every fixed step it asks the first yawProvider that answers (e.g. STMEstimate) for the expected yaw, compares it to the measured yaw (sensorHub.yawAVSmooth), computes the difference and the front/rear slip angles, then calls actAsYawControl of each registered component (brakeControl, motorTorqueControl, awdControl...). It drives the electrics.values.esc/escActive light.

## Example

```lua
local yc = controller.getControllerSafe('drivingDynamics/supervisors/yawControl')
if yc then yc.setParameters({isEnabled = false}) end
```

## Notes

- Signature called on each component: actAsYawControl(measuredYaw, expectedYaw, yawDifferenceAdjusted, bodySlipAngleAdjusted, frontSlipAngle, rearSlipAngle, dt); must return true if the component intervened.
- Yaw providers must expose calculateExpectedYaw(speed, dt) (returns nil if they cannot answer) and setParameters. Yaw is in rad/s, slip angles in rad, speed in m/s.
- If the measured yaw and the expected yaw have opposite signs (countersteering), the expected yaw is inverted. yawDifferenceRaw = (measured - expected) * sign(measured): positive = oversteer, negative = understeer.
- bodySlipAngleAdjusted = body slip angle * confidence coefficient (linearScale 0.5..0.8 of trustWorthiness.bodySlipAngle) * low-speed coefficient (goes to zero below 8..10 m/s). The front/rear angles are only computed if the speed used exceeds 1 m/s, otherwise 0.
- The light is smoothed; electrics.values.esc stays at a steady 1 if isEnabled is false. Unlike tractionControl, shutdown also sets updateFixedStep to nil.
- init replaces controlParameters with {isEnabled = true}. No jbeam key is read in this file (the supervisor does not use jbeamData).
- Components are sorted by componentOrderYawControl (or order), providers by providerOrder (or order).

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_drivingDynamics_supervisors_yawControl.getConfig()` | Returns a copy of the configuration. | 201 |
| `controller_drivingDynamics_supervisors_yawControl.init(jbeamData)` | Resets parameters, providers and components and sets isActive to true. *(internal)* | 139 |
| `controller_drivingDynamics_supervisors_yawControl.initLastStage(jbeamData)` | Sorts providers and components by their order. *(internal)* | 156 |
| `controller_drivingDynamics_supervisors_yawControl.initSecondStage(jbeamData)` | Sets electrics.values.hasESC to true and saves the initial parameters. *(internal)* | 150 |
| `controller_drivingDynamics_supervisors_yawControl.registerCMU(cmu)` | Stores the reference to the CMU (virtualSensors, vehicleData, sensorHub, sendDebugPacket, applyParameter, warningLightPulse). *(internal)* | 122 |
| `controller_drivingDynamics_supervisors_yawControl.registerComponent(component)` | Adds a component exposing actAsYawControl. *(internal)* | 131 |
| `controller_drivingDynamics_supervisors_yawControl.registerYawProvider(yawProvider)` | Adds an expected yaw provider. *(internal)* | 126 |
| `controller_drivingDynamics_supervisors_yawControl.reset()` | Does nothing. *(internal)* | 136 |
| `controller_drivingDynamics_supervisors_yawControl.sendConfigData()` | Sends the configuration to the CMU ("config" debug packet). | 205 |
| `controller_drivingDynamics_supervisors_yawControl.setConfig(configTable)` | Replaces the configuration and propagates isEnabled. | 196 |
| `controller_drivingDynamics_supervisors_yawControl.setDebugMode(debugEnabled)` | Enables/disables sending debug packets (yaw differences, slip angles, speed used) to the CMU. | 116 |
| `controller_drivingDynamics_supervisors_yawControl.setParameters(parameters)` | Changes isEnabled via CMU.applyParameter; propagated to the providers (key "isEnabled") and to the components (key "yawControl.isEnabled"). | 190 |
| `controller_drivingDynamics_supervisors_yawControl.shutdown()` | Disables the supervisor (isActive=false, updateGFX, update and updateFixedStep set to nil). | 174 |
| `controller_drivingDynamics_supervisors_yawControl.updateFixedStep(dt)` | Fixed step: computes the expected yaw, the difference, the slip angles, then calls the components. *(internal)* | 43 |
| `controller_drivingDynamics_supervisors_yawControl.updateGFX(dt)` | Updates electrics.values.esc and escActive from the smoothed state (replaced by a version with a debug packet if setDebugMode(true)). *(internal)* | 91 |

### Parameter details

#### `controller_drivingDynamics_supervisors_yawControl.getConfig()`

Returns a copy of the configuration.

- **returns**: table Copy of {isEnabled}.

#### `controller_drivingDynamics_supervisors_yawControl.init(jbeamData)`

Resets parameters, providers and components and sets isActive to true.

- `jbeamData` (*table*) : jbeam data (unused).

#### `controller_drivingDynamics_supervisors_yawControl.initLastStage(jbeamData)`

Sorts providers and components by their order.

- `jbeamData` (*table*) : jbeam data (unused).

#### `controller_drivingDynamics_supervisors_yawControl.initSecondStage(jbeamData)`

Sets electrics.values.hasESC to true and saves the initial parameters.

- `jbeamData` (*table*) : jbeam data (unused).

#### `controller_drivingDynamics_supervisors_yawControl.registerCMU(cmu)`

Stores the reference to the CMU (virtualSensors, vehicleData, sensorHub, sendDebugPacket, applyParameter, warningLightPulse).

- `cmu` (*table*) : CMU controller.

#### `controller_drivingDynamics_supervisors_yawControl.registerComponent(component)`

Adds a component exposing actAsYawControl.

- `component` (*table*) : Control component.

#### `controller_drivingDynamics_supervisors_yawControl.registerYawProvider(yawProvider)`

Adds an expected yaw provider.

- `yawProvider` (*table*) : Provider exposing calculateExpectedYaw.

#### `controller_drivingDynamics_supervisors_yawControl.setConfig(configTable)`

Replaces the configuration and propagates isEnabled.

- `configTable` (*table*) : Table {isEnabled}.

#### `controller_drivingDynamics_supervisors_yawControl.setDebugMode(debugEnabled)`

Enables/disables sending debug packets (yaw differences, slip angles, speed used) to the CMU.

- `debugEnabled` (*boolean*) : True to enable.

#### `controller_drivingDynamics_supervisors_yawControl.setParameters(parameters)`

Changes isEnabled via CMU.applyParameter; propagated to the providers (key "isEnabled") and to the components (key "yawControl.isEnabled").

- `parameters` (*table<string, any>*) : E.g. {isEnabled = false}.

#### `controller_drivingDynamics_supervisors_yawControl.updateFixedStep(dt)`

Fixed step: computes the expected yaw, the difference, the slip angles, then calls the components.

- `dt` (*number*) : Time step (s).

#### `controller_drivingDynamics_supervisors_yawControl.updateGFX(dt)`

Updates electrics.values.esc and escActive from the smoothed state (replaced by a version with a debug packet if setDebugMode(true)).

- `dt` (*number*) : Graphics time step (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `defaultOrder` | number | Default execution order (60). |
| `isActing` | boolean | True when the yaw control intervenes continuously (smoothed flag >= 1). |
| `isActive` | boolean | True after init, false after shutdown. |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/drivingDynamics/supervisors/yawControl.lua`.*
