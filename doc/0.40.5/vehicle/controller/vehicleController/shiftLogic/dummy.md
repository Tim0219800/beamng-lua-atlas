# `controller_vehicleController_shiftLogic_dummy`

*File: `lua/vehicle/controller/vehicleController/shiftLogic/dummy.lua` · VM: Vehicle · 148 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `vehicleController/shiftLogic/dummy` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

"Neutral" gearbox logic module loaded by vehicleController when the vehicle has no "gearbox" device (or via jbeam shiftLogicName = "dummy"). It simply copies the driver's throttle/brake inputs, reads the speed of the "mainEngine" engine if it exists and fills in the values (temperatures, load, torques, engine state) that vehicleController publishes in electrics. No gear changes.

## Notes

- Contract common to all shiftLogic modules: before each frame vehicleController injects gearboxHandling, timer, timerConstants, inputValues, shiftPreventionData, shiftBehavior and smoothedValues (nil at module creation), then reads throttle, brake, clutchRatio, rpm, etc.
- gearboxBehaviorChanged, shiftUp, shiftDown and shiftToGearIndex are `nop` (engine global, not defined in this file): they do nothing.
- updateGearboxGFX also writes M.running and M.isShifting, which are not declared in the module's initial table (vehicleController does not read M.running; it reads isShifting).
- clutchRatio stays at 0 and the engine receives the raw throttle value (0 if engine disabled).

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_vehicleController_shiftLogic_dummy.areShiftLEDsInUse()` | Always false: no shift LEDs. *(internal)* | 55 |
| `controller_vehicleController_shiftLogic_dummy.getGearName()` | Displayed gear name: empty string. | 59 |
| `controller_vehicleController_shiftLogic_dummy.getGearPosition()` | Lever position for animation: 0, 0. | 63 |
| `controller_vehicleController_shiftLogic_dummy.init(jbeamData, sharedFunctionTable)` | Stores sharedFunctions, gets the mainEngine and gearbox devices, resets values to zero and reads the engine's maxRPM/idleRPM/energy. Called by vehicleController at init and reset. *(internal)* | 94 |
| `controller_vehicleController_shiftLogic_dummy.sendTorqueData()` | Asks the engine to send its torque curves to the UI (if an engine exists). *(internal)* | 88 |
| `controller_vehicleController_shiftLogic_dummy.updateGearboxGFX(dt)` | Every frame: copies the inputs and updates rpm, temperatures, load, torques, ignition and engine state. *(internal)* | 67 |

### Parameter details

#### `controller_vehicleController_shiftLogic_dummy.areShiftLEDsInUse()`

Always false: no shift LEDs.

- **returns**: boolean false

#### `controller_vehicleController_shiftLogic_dummy.getGearName()`

Displayed gear name: empty string.

- **returns**: string ""

#### `controller_vehicleController_shiftLogic_dummy.getGearPosition()`

Lever position for animation: 0, 0.

- **returns**: number gear_A
- **returns**: number gearModeIndex

#### `controller_vehicleController_shiftLogic_dummy.init(jbeamData, sharedFunctionTable)`

Stores sharedFunctions, gets the mainEngine and gearbox devices, resets values to zero and reads the engine's maxRPM/idleRPM/energy. Called by vehicleController at init and reset.

- `jbeamData` (*table*) : Jbeam data (unused).
- `sharedFunctionTable` (*table*) : sharedFunctions utilities of vehicleController.

#### `controller_vehicleController_shiftLogic_dummy.updateGearboxGFX(dt)`

Every frame: copies the inputs and updates rpm, temperatures, load, torques, ignition and engine state.

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `brake` | number | Copy of inputValues.brake. |
| `checkEngine` | boolean | True if the engine is disabled (isDisabled). |
| `clutchRatio` | number | Always 0. |
| `currentGearIndex` | integer | Always 0. |
| `energyStorages` | table<integer, string> | Engine tank names (sharedFunctions.getEnergyStorages). |
| `engineLoad` | number | Instantaneous engine load. |
| `engineThrottle` | number | Throttle sent to the engine (0 if engine disabled). |
| `engineTorque` | number | Engine combustion torque. |
| `flywheelTorque` | number | Engine output torque (outputTorque1). |
| `gearboxBehaviorChanged` | function | nop. |
| `gearboxHandling` | table|nil | Injected by vehicleController. |
| `gearboxTorque` | number | Gearbox device output torque. |
| `idleRPM` | number | Engine idle (RPM) read at init. |
| `ignition` | boolean | True if electrics.values.ignitionLevel > 1. |
| `inputValues` | table|nil | Injected: {throttle, clutch} bounded 0..1 (or electrics overrides). |
| `isArcadeSwitched` | boolean | Always false. |
| `isEngineRunning` | number | 1 if the engine is running (speed > 80% of starterMaxAV and starter disengaged) or if it has no starter, otherwise 0. |
| `isSportModeActive` | boolean | Always false. |
| `maxGearIndex` | integer | Always 0. |
| `maxRPM` | number | Engine max RPM read at init. |
| `minGearIndex` | integer | Always 0. |
| `oilTemp` | number | Engine oil temperature. |
| `rpm` | number | Engine speed in RPM (outputAV1 of the mainEngine). |
| `shiftBehavior` | table|nil | Injected by vehicleController. |
| `shiftDown` | function | nop. |
| `shiftPreventionData` | table|nil | Injected by vehicleController. |
| `shiftToGearIndex` | function | nop. |
| `shiftUp` | function | nop. |
| `shiftingAggression` | number | Always 0. |
| `smoothedAvgAVInput` | number | Angular velocity (rad/s) of the "gearbox" device output (0 if absent). |
| `smoothedValues` | table|nil | Injected by vehicleController. |
| `throttle` | number | Copy of inputValues.throttle. |
| `timer` | table|nil | Injected by vehicleController. |
| `timerConstants` | table|nil | Injected by vehicleController. |
| `waterTemp` | number | Coolant temperature (or oil temperature as a fallback). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/vehicleController/shiftLogic/dummy.lua`.*
