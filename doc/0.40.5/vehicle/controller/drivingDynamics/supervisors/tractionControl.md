# `controller_drivingDynamics_supervisors_tractionControl`

*File: `lua/vehicle/controller/drivingDynamics/supervisors/tractionControl.lua` · VM: Vehicle · 264 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `drivingDynamics/supervisors/tractionControl` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Traction control (TCS) supervisor of the new drivingDynamics architecture (type "auxiliary", defaultOrder 65). It computes nothing itself: at every fixed step, for each wheel group (one group per motor listed in tractionControlledMotors) it asks the first slipProvider that succeeds for the slip, then calls actAsTractionControl of each registered component (motorTorqueControl, brakeControl, diffControl, etc.). It also drives the electrics.values.tcs/tcsActive light. The providers and components register themselves via registerSlipProvider/registerComponent; the CMU (drivingDynamics) calls registerCMU.

## Example

```lua
-- jbeam (keys read by the controller):
-- { "tractionControlledMotors": ["mainEngine"], "velocityOffsetThreshold": 10 }
local tc = controller.getControllerSafe('drivingDynamics/supervisors/tractionControl')
if tc then tc.setParameters({isEnabled = false}) end
```

## Notes

- jbeam keys: tractionControlledMotors (list of powertrain device names; all their child wheels form a group), velocityOffsetThreshold (default 10, in m/s: below this absolute speed, a speed offset is added to avoid dividing by ~0 in the slip computation).
- steeringCoef passed to the slip providers = linearScale(|steeringInput|, 0.3, 0.5, 1, 0.5): reduces sensitivity when steering hard.
- The light is smoothed (temporalSmoothing 10/5): tcsActive is only true when the smoothing reaches 1; electrics.values.tcs equals floor(smoothed)*CMU.warningLightPulse (blinking) and stays at a steady 1 if isEnabled is false.
- Components are sorted by componentOrderTractionControl (or order), providers by providerOrder (or order), in ascending order, in initLastStage.
- setConfig replaces the controlParameters table without recreating initialControlParameters; getConfig returns a deep copy.
- Requires registerCMU to have been called before updateGFX/updateFixedStep (CMU is nil otherwise).

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_drivingDynamics_supervisors_tractionControl.getConfig()` | Returns a copy of the current configuration. | 235 |
| `controller_drivingDynamics_supervisors_tractionControl.init(jbeamData)` | Clears the provider and component lists, reads velocityOffsetThreshold and sets isActive to true. *(internal)* | 137 |
| `controller_drivingDynamics_supervisors_tractionControl.initLastStage(jbeamData)` | Sorts slip providers and components by their order. *(internal)* | 190 |
| `controller_drivingDynamics_supervisors_tractionControl.initSecondStage(jbeamData)` | Builds the wheel groups from tractionControlledMotors (powertrain.getDevice / getChildWheels), initializes smoothing and slip per wheel, sets electrics.values.hasTCS to true and saves the initial parameters. *(internal)* | 148 |
| `controller_drivingDynamics_supervisors_tractionControl.registerCMU(cmu)` | Stores the reference to the CMU (access to virtualSensors, sensorHub, applyParameter, sendDebugPacket). *(internal)* | 112 |
| `controller_drivingDynamics_supervisors_tractionControl.registerComponent(component)` | Adds a component that must expose actAsTractionControl(wheelGroup, dt) and setParameters. *(internal)* | 116 |
| `controller_drivingDynamics_supervisors_tractionControl.registerSlipProvider(slipProvider)` | Adds a provider that must expose calculateSlipTractionControl(wheelGroup, steeringCoef, velocityOffset, dt) returning true if the slip was computed, and setParameters. *(internal)* | 121 |
| `controller_drivingDynamics_supervisors_tractionControl.reset()` | Resets the slip (slip, lastSlip, slipRange) and the smoothers of all wheels. *(internal)* | 126 |
| `controller_drivingDynamics_supervisors_tractionControl.sendConfigData()` | Sends the configuration to the CMU as a debug packet (packetType "config"). | 239 |
| `controller_drivingDynamics_supervisors_tractionControl.setConfig(configTable)` | Replaces the entire configuration (controlParameters) and propagates isEnabled. | 230 |
| `controller_drivingDynamics_supervisors_tractionControl.setDebugMode(debugEnabled)` | Enables/disables sending debug packets (wheel speed, slip, slipRange) to the CMU. | 106 |
| `controller_drivingDynamics_supervisors_tractionControl.setParameters(parameters)` | Changes velocityOffsetThreshold and/or isEnabled via CMU.applyParameter; a change of isEnabled is propagated to the providers and components under the key "tractionControl.isEnabled". | 223 |
| `controller_drivingDynamics_supervisors_tractionControl.shutdown()` | Disables the supervisor (isActive=false, updateGFX and update set to nil). | 208 |
| `controller_drivingDynamics_supervisors_tractionControl.updateFixedStep(dt)` | Fixed step: computes the slip per group via the providers then lets the components act; remembers whether at least one component intervened. *(internal)* | 42 |
| `controller_drivingDynamics_supervisors_tractionControl.updateGFX(dt)` | Updates the electrics values of the TCS light (replaced by a version with a debug packet if setDebugMode(true)). *(internal)* | 72 |

### Parameter details

#### `controller_drivingDynamics_supervisors_tractionControl.getConfig()`

Returns a copy of the current configuration.

- **returns**: table Copy of {isEnabled, velocityOffsetThreshold}.

#### `controller_drivingDynamics_supervisors_tractionControl.init(jbeamData)`

Clears the provider and component lists, reads velocityOffsetThreshold and sets isActive to true.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_drivingDynamics_supervisors_tractionControl.initLastStage(jbeamData)`

Sorts slip providers and components by their order.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_drivingDynamics_supervisors_tractionControl.initSecondStage(jbeamData)`

Builds the wheel groups from tractionControlledMotors (powertrain.getDevice / getChildWheels), initializes smoothing and slip per wheel, sets electrics.values.hasTCS to true and saves the initial parameters.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_drivingDynamics_supervisors_tractionControl.registerCMU(cmu)`

Stores the reference to the CMU (access to virtualSensors, sensorHub, applyParameter, sendDebugPacket).

- `cmu` (*table*) : CMU controller.

#### `controller_drivingDynamics_supervisors_tractionControl.registerComponent(component)`

Adds a component that must expose actAsTractionControl(wheelGroup, dt) and setParameters.

- `component` (*table*) : Control component.

#### `controller_drivingDynamics_supervisors_tractionControl.registerSlipProvider(slipProvider)`

Adds a provider that must expose calculateSlipTractionControl(wheelGroup, steeringCoef, velocityOffset, dt) returning true if the slip was computed, and setParameters.

- `slipProvider` (*table*) : Slip provider.

#### `controller_drivingDynamics_supervisors_tractionControl.setConfig(configTable)`

Replaces the entire configuration (controlParameters) and propagates isEnabled.

- `configTable` (*table*) : Table {isEnabled, velocityOffsetThreshold}.

#### `controller_drivingDynamics_supervisors_tractionControl.setDebugMode(debugEnabled)`

Enables/disables sending debug packets (wheel speed, slip, slipRange) to the CMU.

- `debugEnabled` (*boolean*) : True to enable.

#### `controller_drivingDynamics_supervisors_tractionControl.setParameters(parameters)`

Changes velocityOffsetThreshold and/or isEnabled via CMU.applyParameter; a change of isEnabled is propagated to the providers and components under the key "tractionControl.isEnabled".

- `parameters` (*table<string, any>*) : Parameters to apply, e.g. {isEnabled = false}.

#### `controller_drivingDynamics_supervisors_tractionControl.updateFixedStep(dt)`

Fixed step: computes the slip per group via the providers then lets the components act; remembers whether at least one component intervened.

- `dt` (*number*) : Time step (s).

#### `controller_drivingDynamics_supervisors_tractionControl.updateGFX(dt)`

Updates the electrics values of the TCS light (replaced by a version with a debug packet if setDebugMode(true)).

- `dt` (*number*) : Graphics time step (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `defaultOrder` | number | Default execution order (65). |
| `isActing` | boolean | True when the TCS intervenes continuously (smoothed flag >= 1). |
| `isActive` | boolean | True after init, false after shutdown. |
| `tractionControlledWheels` | table | List of {wheel = wheel's wd, wheelGroup = group}, filled at initSecondStage. |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/drivingDynamics/supervisors/tractionControl.lua`.*
