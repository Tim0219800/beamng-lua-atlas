# `controller_vehicleController_shiftLogic_sequentialGearbox`

*File: `lua/vehicle/controller/vehicleController/shiftLogic/sequentialGearbox.lua` · VM: Vehicle · 512 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `vehicleController/shiftLogic/sequentialGearbox` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Sequential gearbox logic (one step at a time with up/down, no H-shifter) with ignition cut on upshift and optional automatic clutch. Loaded by vehicleController when the "gearbox" device is of type sequentialGearbox. In arcade the gearbox chooses the gear by itself according to shift points; in realistic the driver shifts gears and the change is almost instantaneous (ignition cut then setGearIndex).

## Notes

- jbeam keys read in init: ignitionCutTime (0.15 s), clutchLaunchTargetRPM (3000), clutchLaunchStartRPM (2000).
- Local constants: neutralRejectTime 0.75 s (refuses a shift to neutral right after a neutral request via H-shifter, useful for H-shifter -> sequential).
- gearboxSafety: a gear that would exceed engine.maxAV is refused.
- By default shiftToGearIndex limits the jump to +/-1 gear unless ignoreSequentialBounds is true (used by setState). Index 0 is ignored if the current gear has an absolute value > 1.
- In arcade, shiftUp/Down display a warning (warnCannotShiftSequential); shiftToGearIndex switches to realistic.
- Ignition cut (engine:cutIgnition) on an upshift with throttle > 0 on a forward gear.
- updateExposedData sets shiftingAggression to 1 permanently.
- Inconsistency: updateInGear reads engine.idleAVStartOffset without a nil check (unlike manualGearbox), error if the engine does not have this field. M.running is written without being declared; M.isShifting is declared afterwards (initial value in the file). init sets M.minGearIndex = abs(...) then updateExposedData rewrites it signed.
- Common shiftLogic contract: gearboxHandling, timer, timerConstants, inputValues, shiftPreventionData, shiftBehavior, smoothedValues injected by vehicleController.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_vehicleController_shiftLogic_sequentialGearbox.areShiftLEDsInUse()` | True outside arcade. *(internal)* | 74 |
| `controller_vehicleController_shiftLogic_sequentialGearbox.gearboxBehaviorChanged(behavior)` | Chooses the mode logic; switching to realistic without autoClutch with gear 1/-1 puts the gearbox back in neutral. *(internal)* | 86 |
| `controller_vehicleController_shiftLogic_sequentialGearbox.getGearName()` | Numeric gear index of the gearbox. | 78 |
| `controller_vehicleController_shiftLogic_sequentialGearbox.getGearPosition()` | Always 0, 0 (unused). | 82 |
| `controller_vehicleController_shiftLogic_sequentialGearbox.getState()` | Saveable state {grb_idx = current gear}. | 483 |
| `controller_vehicleController_shiftLogic_sequentialGearbox.init(jbeamData, sharedFunctionTable)` | Gets mainEngine and gearbox, builds the arcade/realistic logics, reads ignitionCutTime and the clutch launch parameters. Called by vehicleController (init and reset). *(internal)* | 418 |
| `controller_vehicleController_shiftLogic_sequentialGearbox.sendTorqueData()` | Asks the engine to send its torque curves to the UI. *(internal)* | 412 |
| `controller_vehicleController_shiftLogic_sequentialGearbox.setState(data)` | Restores the gear (free jump). | 489 |
| `controller_vehicleController_shiftLogic_sequentialGearbox.shiftDown()` | Previous gear (bounded, over-rev safety). | 116 |
| `controller_vehicleController_shiftLogic_sequentialGearbox.shiftToGearIndex(index, ignoreSequentialBounds)` | Requests a gear (by default limited to +/-1 from the current one). | 134 |
| `controller_vehicleController_shiftLogic_sequentialGearbox.shiftUp()` | Next gear (bounded, over-rev safety); will be executed in whileShifting. | 98 |

### Parameter details

#### `controller_vehicleController_shiftLogic_sequentialGearbox.areShiftLEDsInUse()`

True outside arcade.

- **returns**: boolean LEDs used?

#### `controller_vehicleController_shiftLogic_sequentialGearbox.gearboxBehaviorChanged(behavior)`

Chooses the mode logic; switching to realistic without autoClutch with gear 1/-1 puts the gearbox back in neutral.

- `behavior` (*string*) : "arcade" or "realistic".

#### `controller_vehicleController_shiftLogic_sequentialGearbox.getGearName()`

Numeric gear index of the gearbox.

- **returns**: integer gearbox.gearIndex

#### `controller_vehicleController_shiftLogic_sequentialGearbox.getGearPosition()`

Always 0, 0 (unused).

- **returns**: number 0
- **returns**: number 0

#### `controller_vehicleController_shiftLogic_sequentialGearbox.getState()`

Saveable state {grb_idx = current gear}.

- **returns**: table|nil State.

#### `controller_vehicleController_shiftLogic_sequentialGearbox.init(jbeamData, sharedFunctionTable)`

Gets mainEngine and gearbox, builds the arcade/realistic logics, reads ignitionCutTime and the clutch launch parameters. Called by vehicleController (init and reset).

- `jbeamData` (*table*) : Jbeam data.
- `sharedFunctionTable` (*table*) : sharedFunctions.

#### `controller_vehicleController_shiftLogic_sequentialGearbox.setState(data)`

Restores the gear (free jump).

- `data` (*table*) : Table produced by getState.

#### `controller_vehicleController_shiftLogic_sequentialGearbox.shiftToGearIndex(index, ignoreSequentialBounds)`

Requests a gear (by default limited to +/-1 from the current one).

- `index` (*integer*) : Wanted gear.
- `ignoreSequentialBounds` (*boolean|nil*) : If true, allows a jump of several gears.

## Fields

| Field | Type | Description |
|---|---|---|
| `brake` | number | Decided brake (0..1). |
| `checkEngine` | boolean | Engine disabled. |
| `clutchRatio` | number | Clutch ratio (1 = engaged). |
| `currentGearIndex` | integer | Current gear. |
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
| `isArcadeSwitched` | boolean | Throttle/brake swapped (arcade, reverse). |
| `isEngineRunning` | number | 1 if the engine is running. |
| `isSportModeActive` | boolean | Always false. |
| `maxGearIndex` | integer | Highest forward gear. |
| `maxRPM` | number | Max RPM. |
| `minGearIndex` | integer | Smallest index (reverse). |
| `oilTemp` | number | Oil temperature. |
| `rpm` | number | Engine speed (RPM). |
| `shiftBehavior` | table|nil | Injected. |
| `shiftPreventionData` | table|nil | Injected. |
| `shiftingAggression` | number | Always 1. |
| `smoothedAvgAVInput` | number | Gearbox output angular velocity (rad/s). |
| `smoothedValues` | table|nil | Injected. |
| `throttle` | number | Decided throttle (0..1). |
| `timer` | table|nil | Injected. |
| `timerConstants` | table|nil | Injected. |
| `updateGearboxGFX` | function | nop then inGear/whileShifting of the active mode. |
| `waterTemp` | number | Coolant temperature. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/vehicleController/shiftLogic/sequentialGearbox.lua`.*
