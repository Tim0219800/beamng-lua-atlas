# `controller_drivingDynamics_CMU`

*File: `lua/vehicle/controller/drivingDynamics/CMU.lua` · VM: Vehicle · 528 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `drivingDynamics/CMU` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

CMU (driving dynamics management center, Driving Dynamics Suite): controller that orchestrates the sub-controllers of the `drivingDynamics/` folder (`sensors/` sensors, `supervisors/` supervisors, `actuators/` actuators). It finds and registers them (`registerCMU`), exposes accessors (getSensor, getSupervisor, getActuator...), detects rollover and crash, manages the global system state (normal, degraded, offline), the blinking warning light, calibration callbacks, and a UDP debug channel (by default 127.0.0.1:54812) for an external tool. Call order: `defaultOrder = 50`.

## Example

```lua
local cmu = controller.getControllerSafe("drivingDynamics/CMU")
local hub = cmu.getSensor("sensorHub")
for _, a in ipairs(cmu.getActuators()) do print(a.name) end
```

## Notes

- Jbeam keys read by init: `debugSettings.peerIP` ("127.0.0.1"), `debugSettings.peerPort` (54812), `indicateUI`.
- Bug: `indicateUI = jbeamData.indicateUI == nil and true or false` gives true only if the key is absent; if the jbeam explicitly sets `indicateUI` to true, the value becomes false.
- `enableDebugHeartbeat` is always true (`true or not shippingBuild`): the UDP "BNGDSE" heartbeat is sent at 1 Hz and the received commands are read, if the UDP socket connected.
- Recognized UDP commands (format `type->controllerName[->json]`): RequestConfig, EnableDebugMode, SetConfig, SetProperty. EnableDebugMode does not check that the recipient exists (error if unknown name).
- Electrics written: `dseCrashStopped`, `dseRollOverStopped`, `dseRollingOver` (1 or nil), `dseWarningPulse` (warning light; fixed 1 if the system is not normal), `isYCBrakeActive` and `isTCBrakeActive` (0 at init). Reads `postCrashBrakeTriggered`.
- The light blinks at 0.15 s when the `yawControl` or `tractionControl` supervisor is acting (`isActing`).
- initLastStage: if a sub-controller does not have `isActive`, all systems are shut down (`shutdown`) and the state goes to offline.
- `systemDegradationDetected` marks the damage `drivingDynamics/systemStateDegraded` in damageTracker.
- No supervisor or sensor is defined in this batch; only the actuators and sensorHub of the batch are documented.
- The fields updateCalibrationCallback, updateFixedStepCalibrationCallback and updateGFXCalibrationCallback are `nop` (empty function) as long as no callback is registered; sensorHub, vehicleData and virtualSensors are nil until initSecondStage.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_drivingDynamics_CMU.applyParameter(currentParameters, initialParameters, changedParameters, name)` | Modifies a parameter of a configuration table identified by a dotted path (e.g. "uiDisplayData.simplePowertrainApp.activeColor"). The value "default" restores the initial value. Never creates a new parameter. | 440 |
| `controller_drivingDynamics_CMU.disableSystemsForCalibration()` | Disables all supervisors (`setParameters({isEnabled = false})`) to allow a calibration. | 74 |
| `controller_drivingDynamics_CMU.getActuator(actuatorName)` | Finds an actuator by its file name in `drivingDynamics/actuators/`. | 424 |
| `controller_drivingDynamics_CMU.getActuators()` | Lists all loaded actuators. | 436 |
| `controller_drivingDynamics_CMU.getConfig()` | Returns a copy of the CMU configuration. | 488 |
| `controller_drivingDynamics_CMU.getSensor(sensorName)` | Finds a sensor by its file name in `drivingDynamics/sensors/`. | 416 |
| `controller_drivingDynamics_CMU.getSensors()` | Lists all loaded sensors. | 432 |
| `controller_drivingDynamics_CMU.getSupervisor(supervisorName)` | Finds a supervisor by its file name in `drivingDynamics/supervisors/` (e.g. yawControl, tractionControl). | 420 |
| `controller_drivingDynamics_CMU.getSupervisors()` | Lists all loaded supervisors. | 428 |
| `controller_drivingDynamics_CMU.init(jbeamData)` | Opens the debug UDP socket, prepares the control parameters (UI display) and clears the crash electrics. *(internal)* | 301 |
| `controller_drivingDynamics_CMU.initLastStage()` | Checks that all sub-controllers are active (otherwise shuts them down), puts the state back to normal and sends an init debug packet. *(internal)* | 365 |
| `controller_drivingDynamics_CMU.initSecondStage()` | Lists the sub-controllers of the drivingDynamics/ folder, registers them with the CMU (`registerCMU`), finds the base sensors and disables debug mode. *(internal)* | 335 |
| `controller_drivingDynamics_CMU.logDebugMessage(source, message)` | Adds a debug message (`systemDebugMessage` packet) to the queue sent over UDP. | 248 |
| `controller_drivingDynamics_CMU.registerCalibrationCallback(callback, callbackType)` | Registers a function called at each step (update, updateFixedStep or updateGFX) during a calibration. | 81 |
| `controller_drivingDynamics_CMU.reset(jbeamData)` | Clears the debug packets, the crash electrics and the smoothers, and puts the state back to normal. *(internal)* | 290 |
| `controller_drivingDynamics_CMU.sendDebugPacket(packet)` | Adds a packet to the debug queue (writing `vehicleID` into it). | 95 |
| `controller_drivingDynamics_CMU.setConfig(configTable)` | Replaces the entire CMU configuration. | 484 |
| `controller_drivingDynamics_CMU.setDebugMode(debugEnabled)` | Enables or disables the CMU's debug mode (choice of the updateGFX variant) and propagates it to all sub-controllers having `setDebugMode`, then rebuilds the caches. | 279 |
| `controller_drivingDynamics_CMU.setParameters(parameters)` | Modifies the CMU's display parameters (uiDisplayData.simplePowertrainApp.activeColor, offColor, doUpdate) and `notifySystemStateDegraded`; updates the "DSE" button of the driveModes controller if present. | 471 |
| `controller_drivingDynamics_CMU.systemDegradationDetected(reason)` | Puts the system in degraded state, logs the reason in the debug and marks the damage `systemStateDegraded`. | 253 |
| `controller_drivingDynamics_CMU.systemDegradationResolved()` | Puts the system back to normal state and clears the damage `systemStateDegraded`. | 263 |
| `controller_drivingDynamics_CMU.update(dt)` | Physics step: runs the update-type calibration callbacks. *(internal)* | 244 |
| `controller_drivingDynamics_CMU.updateFixedStep(dt)` | Fixed step (100 Hz): runs the updateFixedStep-type calibration callbacks. *(internal)* | 240 |
| `controller_drivingDynamics_CMU.updateGFX(dt)` | Every frame: detects rollover and crash, animates the warning light, runs the GFX calibration callbacks and (depending on debug mode) exchanges the UDP packets. Replaced by a debug variant via setDebugMode. *(internal)* | 188 |

### Parameter details

#### `controller_drivingDynamics_CMU.applyParameter(currentParameters, initialParameters, changedParameters, name)`

Modifies a parameter of a configuration table identified by a dotted path (e.g. "uiDisplayData.simplePowertrainApp.activeColor"). The value "default" restores the initial value. Never creates a new parameter.

- `currentParameters` (*table*) : Current (modified) configuration.
- `initialParameters` (*table*) : Initial configuration (for "default").
- `changedParameters` (*table*) : Table of changes, keyed by dotted path.
- `name` (*string*) : Dotted path of the parameter.
- **returns**: boolean true if a parameter was modified.

#### `controller_drivingDynamics_CMU.getActuator(actuatorName)`

Finds an actuator by its file name in `drivingDynamics/actuators/`.

- `actuatorName` (*string*) : Name of the actuator type.
- **returns**: table|nil The sub-controller.

#### `controller_drivingDynamics_CMU.getActuators()`

Lists all loaded actuators.

- **returns**: table[] Sub-controllers of the actuators folder.

#### `controller_drivingDynamics_CMU.getConfig()`

Returns a copy of the CMU configuration.

- **returns**: table Deep copy of the control parameters.

#### `controller_drivingDynamics_CMU.getSensor(sensorName)`

Finds a sensor by its file name in `drivingDynamics/sensors/`.

- `sensorName` (*string*) : Name of the sensor type (e.g. "sensorHub").
- **returns**: table|nil The sub-controller.

#### `controller_drivingDynamics_CMU.getSensors()`

Lists all loaded sensors.

- **returns**: table[] Sub-controllers of the sensors folder.

#### `controller_drivingDynamics_CMU.getSupervisor(supervisorName)`

Finds a supervisor by its file name in `drivingDynamics/supervisors/` (e.g. yawControl, tractionControl).

- `supervisorName` (*string*) : Name of the supervisor type.
- **returns**: table|nil The sub-controller.

#### `controller_drivingDynamics_CMU.getSupervisors()`

Lists all loaded supervisors.

- **returns**: table[] Sub-controllers of the supervisors folder.

#### `controller_drivingDynamics_CMU.init(jbeamData)`

Opens the debug UDP socket, prepares the control parameters (UI display) and clears the crash electrics.

- `jbeamData` (*table*) : CMU jbeam data.

#### `controller_drivingDynamics_CMU.logDebugMessage(source, message)`

Adds a debug message (`systemDebugMessage` packet) to the queue sent over UDP.

- `source` (*string*) : Origin of the message.
- `message` (*string*) : Text.

#### `controller_drivingDynamics_CMU.registerCalibrationCallback(callback, callbackType)`

Registers a function called at each step (update, updateFixedStep or updateGFX) during a calibration.

- `callback` (*function*) : Function called with dt.
- `callbackType` (*string*) : "update", "updateFixedStep" or "updateGFX".

#### `controller_drivingDynamics_CMU.reset(jbeamData)`

Clears the debug packets, the crash electrics and the smoothers, and puts the state back to normal.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_drivingDynamics_CMU.sendDebugPacket(packet)`

Adds a packet to the debug queue (writing `vehicleID` into it).

- `packet` (*table*) : Debug packet (sourceType, packetType, ...).

#### `controller_drivingDynamics_CMU.setConfig(configTable)`

Replaces the entire CMU configuration.

- `configTable` (*table*) : New configuration.

#### `controller_drivingDynamics_CMU.setDebugMode(debugEnabled)`

Enables or disables the CMU's debug mode (choice of the updateGFX variant) and propagates it to all sub-controllers having `setDebugMode`, then rebuilds the caches.

- `debugEnabled` (*boolean*) : true to send the debug data at 30 Hz.

#### `controller_drivingDynamics_CMU.setParameters(parameters)`

Modifies the CMU's display parameters (uiDisplayData.simplePowertrainApp.activeColor, offColor, doUpdate) and `notifySystemStateDegraded`; updates the "DSE" button of the driveModes controller if present.

- `parameters` (*table*) : Table keyed by dotted paths.

#### `controller_drivingDynamics_CMU.systemDegradationDetected(reason)`

Puts the system in degraded state, logs the reason in the debug and marks the damage `systemStateDegraded`.

- `reason` (*string*) : Reason for the degradation.

#### `controller_drivingDynamics_CMU.update(dt)`

Physics step: runs the update-type calibration callbacks.

- `dt` (*number*) : Physics step in seconds.

#### `controller_drivingDynamics_CMU.updateFixedStep(dt)`

Fixed step (100 Hz): runs the updateFixedStep-type calibration callbacks.

- `dt` (*number*) : Step in seconds.

#### `controller_drivingDynamics_CMU.updateGFX(dt)`

Every frame: detects rollover and crash, animates the warning light, runs the GFX calibration callbacks and (depending on debug mode) exchanges the UDP packets. Replaced by a debug variant via setDebugMode.

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `defaultOrder` | number | 50. |
| `sensorHub` | table|nil | Sub-controller `drivingDynamics/sensors/sensorHub` (filled by initSecondStage). |
| `systemState` | string | Global system state: "normal", "degraded" or "offline". |
| `systemStates` | table<string, string> | Constants: normal, degraded, offline. |
| `type` | string | "auxiliary". |
| `updateCalibrationCallback` | function | nop or function that runs the update-type calibration callbacks. |
| `updateFixedStepCalibrationCallback` | function | nop or function that runs the updateFixedStep-type callbacks. |
| `updateGFXCalibrationCallback` | function | nop or function that runs the updateGFX-type callbacks. |
| `vehicleData` | table|nil | Sub-controller `sensors/vehicleData` (filled by initSecondStage). |
| `virtualSensors` | table|nil | Sub-controller `sensors/virtualSensors` (filled by initSecondStage). |
| `warningLightPulse` | integer | 0 or 1, toggles every 0.15 s for the warning light blinking. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/drivingDynamics/CMU.lua`.*
