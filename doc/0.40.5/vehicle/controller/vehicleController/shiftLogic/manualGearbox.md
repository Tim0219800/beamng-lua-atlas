# `controller_vehicleController_shiftLogic_manualGearbox`

*File: `lua/vehicle/controller/vehicleController/shiftLogic/manualGearbox.lua` · VM: Vehicle · 714 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `vehicleController/shiftLogic/manualGearbox` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Manual gearbox logic (H-shifter or up/down keys) with automatic or manual clutch. Loaded by vehicleController when the "gearbox" device is of type manualGearbox. In arcade, the gearbox chooses the gear by itself (shift points, automatic reverse) and drives the clutch at launch; in realistic, the driver chooses the gear, the state machine handles clutch, neutral, synchronization (rev-match) and engagement.

## Example

```lua
controller.mainController.shiftToGearIndex(3) -- engages 3rd (realistic mode); in arcade switches to realistic first
```

## Notes

- jbeam keys read in init: clutchLaunchTargetRPM (3000), clutchLaunchStartRPM (2000), clutchInRate (25), clutchOutRate (25), revMatchThrottle (0.5).
- Gear change state machine (clutchHandling.shiftState): clutchIn -> neutral -> waitingForShift -> shift -> (gearGrind) -> clutchOut. In realistic the shift waits for the key release (shiftUpOnUp/shiftDownOnUp) or a shiftToGearIndex; waitingForShift is abandoned after 2 s in direct shift.
- gearboxSafety: a gear that would exceed engine.maxAV is refused (the previous gear is kept).
- autoClutch (user setting): otherwise the clutch directly follows 1 - inputValues.clutch. autoThrottle: allows automatic rev-match (throttle = revMatchThrottle).
- The module exposes M.shiftUpOnDown/shiftDownOnDown/shiftUpOnUp/shiftDownOnUp/shiftToGearIndex which are reassigned in gearboxBehaviorChanged depending on the mode; vehicleController therefore calls the version of the current mode.
- In arcade, shiftUp/Down display a warning; shiftToGearIndex switches to realistic.
- Common shiftLogic contract: gearboxHandling, timer, timerConstants, inputValues, shiftPreventionData, shiftBehavior, smoothedValues injected by vehicleController.
- M.running is written without being declared. init sets M.minGearIndex = abs(minGearIndex) but updateExposedData then rewrites it with the signed value.
- gearboxBehaviorChanged: switching to realistic without autoClutch with gear 1 or -1 engaged puts the gearbox back in neutral.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_vehicleController_shiftLogic_manualGearbox.areShiftLEDsInUse()` | True outside arcade. *(internal)* | 82 |
| `controller_vehicleController_shiftLogic_manualGearbox.gearboxBehaviorChanged(behavior)` | Selects the mode logic (arcade/realistic) and reassigns the shift functions. *(internal)* | 94 |
| `controller_vehicleController_shiftLogic_manualGearbox.getGearName()` | Returns the gearbox's numeric gear index (not a string). | 86 |
| `controller_vehicleController_shiftLogic_manualGearbox.getGearPosition()` | Always 0, 0 (unused for manual and sequential gearboxes). | 90 |
| `controller_vehicleController_shiftLogic_manualGearbox.getState()` | Saveable state: {grb_idx = current gear}. | 683 |
| `controller_vehicleController_shiftLogic_manualGearbox.init(jbeamData, sharedFunctionTable)` | Gets mainEngine and gearbox, builds the arcade/realistic logics, reads the clutch parameters (see notes). Called by vehicleController at init and reset. *(internal)* | 605 |
| `controller_vehicleController_shiftLogic_manualGearbox.sendTorqueData()` | Asks the engine to send its torque curves to the UI. *(internal)* | 599 |
| `controller_vehicleController_shiftLogic_manualGearbox.setState(data)` | Restores the gear via shiftToGearIndex(data.grb_idx). | 689 |
| `controller_vehicleController_shiftLogic_manualGearbox.shiftDownOnDown()` | Shift down press: requests the lower gear and starts the sequence. | 152 |
| `controller_vehicleController_shiftLogic_manualGearbox.shiftDownOnUp()` | Shift down release, same logic as shiftUpOnUp. | 176 |
| `controller_vehicleController_shiftLogic_manualGearbox.shiftToGearIndex(index)` | Directly requests a gear (bounded, over-rev safety); direct shift (H-shifter). Index 0 from gearGrind puts the gearbox back in neutral. | 185 |
| `controller_vehicleController_shiftLogic_manualGearbox.shiftUpOnDown()` | Shift up press: requests the next gear (bounded min/max, over-rev safety) and starts the shift sequence. | 119 |
| `controller_vehicleController_shiftLogic_manualGearbox.shiftUpOnUp()` | Shift up release: when waiting for shift, triggers engagement; otherwise records that the input is finished. | 143 |

### Parameter details

#### `controller_vehicleController_shiftLogic_manualGearbox.areShiftLEDsInUse()`

True outside arcade.

- **returns**: boolean Shift LEDs used?

#### `controller_vehicleController_shiftLogic_manualGearbox.gearboxBehaviorChanged(behavior)`

Selects the mode logic (arcade/realistic) and reassigns the shift functions.

- `behavior` (*string*) : "arcade" or "realistic".

#### `controller_vehicleController_shiftLogic_manualGearbox.getGearName()`

Returns the gearbox's numeric gear index (not a string).

- **returns**: integer gearbox.gearIndex

#### `controller_vehicleController_shiftLogic_manualGearbox.getGearPosition()`

Always 0, 0 (unused for manual and sequential gearboxes).

- **returns**: number 0
- **returns**: number 0

#### `controller_vehicleController_shiftLogic_manualGearbox.getState()`

Saveable state: {grb_idx = current gear}.

- **returns**: table|nil State.

#### `controller_vehicleController_shiftLogic_manualGearbox.init(jbeamData, sharedFunctionTable)`

Gets mainEngine and gearbox, builds the arcade/realistic logics, reads the clutch parameters (see notes). Called by vehicleController at init and reset.

- `jbeamData` (*table*) : Jbeam data.
- `sharedFunctionTable` (*table*) : sharedFunctions.

#### `controller_vehicleController_shiftLogic_manualGearbox.setState(data)`

Restores the gear via shiftToGearIndex(data.grb_idx).

- `data` (*table*) : Table produced by getState.

#### `controller_vehicleController_shiftLogic_manualGearbox.shiftToGearIndex(index)`

Directly requests a gear (bounded, over-rev safety); direct shift (H-shifter). Index 0 from gearGrind puts the gearbox back in neutral.

- `index` (*integer*) : Wanted gear.

## Fields

| Field | Type | Description |
|---|---|---|
| `brake` | number | Decided brake (0..1). |
| `checkEngine` | boolean | Engine disabled. |
| `clutchRatio` | number | Clutch ratio (1 = engaged). |
| `currentGearIndex` | integer | Current gearbox gear. |
| `energyStorages` | table<integer, string> | Engine tanks. |
| `engineLoad` | number | Engine load. |
| `engineThrottle` | number | Throttle applied to the engine. |
| `engineTorque` | number | Combustion torque. |
| `flywheelTorque` | number | Engine flywheel torque. |
| `gearboxHandling` | table|nil | Injected by vehicleController. |
| `gearboxTorque` | number | Gearbox output torque. |
| `idleRPM` | number | Idle RPM. |
| `ignition` | boolean | ignitionLevel > 1. |
| `inputValues` | table|nil | Injected. |
| `isArcadeSwitched` | boolean | Throttle/brake swapped (arcade reverse). |
| `isEngineRunning` | number | 1 if the engine is running. |
| `isShifting` | boolean | True during a gear change (excluding waiting for the driver). |
| `isSportModeActive` | boolean | Always false. |
| `maxGearIndex` | integer | Highest forward gear. |
| `maxRPM` | number | Maximum RPM. |
| `minGearIndex` | integer | Smallest index (reverse). |
| `oilTemp` | number | Oil temperature. |
| `rpm` | number | Engine speed (RPM). |
| `shiftBehavior` | table|nil | Injected. |
| `shiftPreventionData` | table|nil | Injected. |
| `shiftingAggression` | number | Shift speed coefficient 0.3..1 computed by calculateShiftAggression. |
| `smoothedAvgAVInput` | number | Gearbox output angular velocity (rad/s). |
| `smoothedValues` | table|nil | Injected. |
| `throttle` | number | Decided throttle (0..1), zero during a gear change beyond the 1st except rev-match. |
| `timer` | table|nil | Injected. |
| `timerConstants` | table|nil | Injected. |
| `updateGearboxGFX` | function | nop then inGear/whileShifting of the active mode. |
| `waterTemp` | number | Coolant temperature. |

## Calls into the engine (C++)

- `obj:` `getSimulationTimeScale`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/vehicleController/shiftLogic/manualGearbox.lua`.*
