# `controller_vehicleController_shiftLogic_dctGearbox`

*File: `lua/vehicle/controller/vehicleController/shiftLogic/dctGearbox.lua` · VM: Vehicle · 899 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `vehicleController/shiftLogic/dctGearbox` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Dual-clutch gearbox (DCT) logic with automatic modes P R N D S 1 2 M. Loaded by vehicleController when the "gearbox" device is of type dctGearbox. Two shafts (access1/access2: gearIndex1/2, clutchRatio1/2, setGearIndex1/2) alternate: the primary shaft is engaged, the secondary pre-selects the next gear (dctPredictNextGear) and the change crosses the two clutches. Handles rev-match on downshift, launch and the arcade/realistic modes.

## Notes

- jbeam keys read in init: clutchLaunchTargetRPM (3000), clutchLaunchStartRPM (2000), revMatchThrottle (0.5), automaticModes ("PRNDS21M"), defaultAutomaticMode ("N"), autoDownShiftInM (true), dctClutchTime (0.05), defaultForwardMode ("D").
- The downshift rev-match sets electrics.values.clutchRatio1/clutchRatio2 to 0 and forces the throttle to revMatchThrottle until the engine speed reaches the target (500 RPM margin) or revMatchExpired (timerConstants) is exceeded.
- The next gear is chosen on the secondary shaft; if the wanted gear is not on the same shaft (parity), an "auxiliary" gear is engaged first.
- In arcade shiftUp/shiftDown display a warning; shiftToGearIndex switches to realistic (actual: sharedFunctions.switchToRealisticBehavior).
- getGearName/getGearPosition follow the same principle as automaticGearbox (mode name, S/M prefixes).
- init sets M.minGearIndex = abs(...) but updateExposedData rewrites it signed. M.running is written without declaration.
- Common shiftLogic contract: gearboxHandling, timer, timerConstants, inputValues, shiftPreventionData, shiftBehavior, smoothedValues injected by vehicleController.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_vehicleController_shiftLogic_dctGearbox.areShiftLEDsInUse()` | True outside arcade in manual M mode. *(internal)* | 98 |
| `controller_vehicleController_shiftLogic_dctGearbox.gearboxBehaviorChanged(behavior)` | Selects the arcade/realistic logic. *(internal)* | 142 |
| `controller_vehicleController_shiftLogic_dctGearbox.getGearName()` | Displayed gear name (mode, or S/M + gear). | 102 |
| `controller_vehicleController_shiftLogic_dctGearbox.getGearPosition()` | Normalized lever position and mode index. | 116 |
| `controller_vehicleController_shiftLogic_dctGearbox.getState()` | Saveable state {grb_mde = mode}. | 866 |
| `controller_vehicleController_shiftLogic_dctGearbox.init(jbeamData, sharedFunctionTable)` | Gets mainEngine and gearbox, builds modes, arcade/realistic logics, clutch and DCT parameters, applies the default forward mode then the current mode. Called by vehicleController (init and reset). *(internal)* | 750 |
| `controller_vehicleController_shiftLogic_dctGearbox.sendTorqueData()` | Asks the engine to send its torque curves to the UI. *(internal)* | 744 |
| `controller_vehicleController_shiftLogic_dctGearbox.setDefaultForwardMode(mode)` | Sets the default forward mode (D, S, M1...) and applies it if already moving forward. | 197 |
| `controller_vehicleController_shiftLogic_dctGearbox.setState(data)` | Restores the mode from data.grb_mde. | 872 |
| `controller_vehicleController_shiftLogic_dctGearbox.shiftDown()` | Realistic: previous mode / lower gear in M. | 244 |
| `controller_vehicleController_shiftLogic_dctGearbox.shiftToGearIndex(index)` | Realistic: selects the mode matching the lever position. | 278 |
| `controller_vehicleController_shiftLogic_dctGearbox.shiftUp()` | Realistic: next mode in the list; in manual M shifts up one gear (with over-rev safety if gearboxSafety). | 211 |

### Parameter details

#### `controller_vehicleController_shiftLogic_dctGearbox.areShiftLEDsInUse()`

True outside arcade in manual M mode.

- **returns**: boolean LEDs used?

#### `controller_vehicleController_shiftLogic_dctGearbox.gearboxBehaviorChanged(behavior)`

Selects the arcade/realistic logic.

- `behavior` (*string*) : "arcade" or "realistic".

#### `controller_vehicleController_shiftLogic_dctGearbox.getGearName()`

Displayed gear name (mode, or S/M + gear).

- **returns**: string Displayed name.

#### `controller_vehicleController_shiftLogic_dctGearbox.getGearPosition()`

Normalized lever position and mode index.

- **returns**: number Position 0..1.
- **returns**: integer Mode index.

#### `controller_vehicleController_shiftLogic_dctGearbox.getState()`

Saveable state {grb_mde = mode}.

- **returns**: table|nil State.

#### `controller_vehicleController_shiftLogic_dctGearbox.init(jbeamData, sharedFunctionTable)`

Gets mainEngine and gearbox, builds modes, arcade/realistic logics, clutch and DCT parameters, applies the default forward mode then the current mode. Called by vehicleController (init and reset).

- `jbeamData` (*table*) : Jbeam data.
- `sharedFunctionTable` (*table*) : sharedFunctions.

#### `controller_vehicleController_shiftLogic_dctGearbox.setDefaultForwardMode(mode)`

Sets the default forward mode (D, S, M1...) and applies it if already moving forward.

- `mode` (*string*) : Mode name.

#### `controller_vehicleController_shiftLogic_dctGearbox.setState(data)`

Restores the mode from data.grb_mde.

- `data` (*table*) : Table produced by getState.

#### `controller_vehicleController_shiftLogic_dctGearbox.shiftToGearIndex(index)`

Realistic: selects the mode matching the lever position.

- `index` (*integer*) : Lever position.

## Fields

| Field | Type | Description |
|---|---|---|
| `brake` | number | Decided brake (0..1). |
| `checkEngine` | boolean | Engine disabled. |
| `clutchRatio` | number | Overall clutch ratio (per-shaft ratios are in electrics clutchRatio1/2). |
| `currentGearIndex` | integer | Current gear or target gear during a change. |
| `energyStorages` | table<integer, string> | Engine tanks. |
| `engineLoad` | number | Engine load. |
| `engineThrottle` | number | Throttle applied to the engine. |
| `engineTorque` | number | Combustion torque. |
| `flywheelTorque` | number | Engine torque. |
| `gearboxHandling` | table|nil | Injected by vehicleController. |
| `gearboxTorque` | number | Gearbox output torque. |
| `idleRPM` | number | Idle. |
| `ignition` | boolean | ignitionLevel > 1. |
| `inputValues` | table|nil | Injected. |
| `isArcadeSwitched` | boolean | Throttle/brake swapped. |
| `isEngineRunning` | number | 1 if the engine is running. |
| `isManualModeActive` | boolean | True in M modes. |
| `isSportModeActive` | boolean | True in S mode. |
| `maxGearIndex` | integer | Highest forward gear. |
| `maxRPM` | number | Max RPM. |
| `minGearIndex` | integer | Smallest index (reverse). |
| `oilTemp` | number | Oil temperature. |
| `rpm` | number | Engine speed (RPM). |
| `shiftBehavior` | table|nil | Injected. |
| `shiftPreventionData` | table|nil | Injected. |
| `shiftingAggression` | number | Gear shift aggression. |
| `smoothedAvgAVInput` | number | Gearbox output angular velocity (rad/s). |
| `smoothedValues` | table|nil | Injected. |
| `throttle` | number | Decided throttle (0..1); kept on upshift, cut on downshift except rev-match. |
| `timer` | table|nil | Injected. |
| `timerConstants` | table|nil | Injected. |
| `updateGearboxGFX` | function | nop then inGear/whileShifting of the active mode. |
| `waterTemp` | number | Coolant temperature. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/vehicleController/shiftLogic/dctGearbox.lua`.*
