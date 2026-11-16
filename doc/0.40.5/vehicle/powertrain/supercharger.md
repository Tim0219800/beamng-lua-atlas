# `powertrain_supercharger`

*File: `lua/vehicle/powertrain/supercharger.lua` · VM: Vehicle · 354 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** powertrain device type `supercharger` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`

Mechanical supercharger subsystem attached to an engine: the supercharger is driven by the crankshaft (ratio gearRatio, with a progressive clutch between clutchEngageRPM and clutchDisengageRPM). Three types: 'roots', 'screws', 'centrifugal', each with its own efficiency curve and pulsation level. Computes the boost pressure (psi/1000 RPM, boostController curve according to throttle opening, blow-off valve), applies it to engine.forcedInductionCoef and takes a torque loss proportional to engine speed (crankLossPer1kRPM). Also generates the supercharger whine.

## Example

```lua
-- engine jbeam: "supercharger":{"type":"roots", "gearRatio":2, "pressurePSIPer1kRPM":1.2, "lobes":3, "boostController":[[0,0],[100,1]]}
local eng = powertrain.getDevice('mainEngine')
eng.supercharger.setBypassPressure(8) -- blow-off valve at 8 psi
```

## Notes

- jbeam units: pressures in psi, speeds in RPM (conversion rpmToAV 0.10471971768, avToRPM 9.5493). electrics values written: superchargerBoost (psi), superchargerBoostMax (= maximum pressure of the curve, in psi).
- jbeam keys: type ('roots', 'screws' or 'centrifugal', required; unknown type -> error log and init aborted), gearRatio (1), maxRPM (max supercharger speed; default ceil(engine maxRPM*gearRatio)), pressurePSIPer1kRPM (required, pressure slope), boostController (list of [throttle in %, coefficient], required: index 0..100 of the curve = throttle opening *100), lobes (2..4, default 3; screws forces at least 3; centrifugal forces 0), twistedLobes (roots), pulseCoefModifier, crankLossPer1kRPM (5 -> 0.005 loss per 1000 RPM), clutchEngageRPM (1000), clutchEngageRange, clutchDisengageRPM (2*engine maxRPM), clutchDisengageRange, pressureRatePSI (50 psi/s), sounds: whineLoopEvent, whinePitchPer10kRPM (0.65), whineVolumePerPSI (0.01), whineVolumePer10kRPM.
- Pulsations: pulseCoefModifier defaults to 0.98 for screws, 0.95 (twisted roots) or 0.9 (straight roots), 1 for centrifugal; frequency = number of lobes * supercharger speed.
- The curve pressure is computed as pressureCoef(relative rpm) * slope * rpm with a type-specific order-2 polynomial; the blow-off valve cuts the pressure beyond bypassConditions.maxPressure (very high by default, adjustable with setBypassPressure) and to 0 if the throttle is below 1%.
- Torque gain: forcedInductionCoef *= max(1 + 0.0000087*pressure_Pa - loss, 0), called in updateFixedStep at each physics step.
- Bug/inconsistency: setPartCondition builds integrityState with damageFrictionCoef and damageExhaustPowerCoef (copied from the turbo) then reads integrityState.damagePressureCoef: when integrity is a number, damagePressureCoef always comes back as 1 (the integrity is ignored).
- Bug/inconsistency: getPartCondition calls min(pressureIntegrityValue) with a single argument (equivalent to the value itself).
- Bug/inconsistency: maxPressure is a module-local variable never reset to 0 in init (accumulates the maximum across module reloads). applyDeformGroupDamage reports 'inductionSystemDamaged' but reset does not clear it (only 'superchargerDamaged' is cleared).
- Bug/inconsistency: the 'forcedInductionInfo' stream reads electrics.values.boost and electrics.values.boostMax, which this file does not write (it writes superchargerBoost / superchargerBoostMax); without an engine that defines boost/boostMax, arithmetic on nil is possible.
- After an early return from init (unknown type, missing boostController), updateGFX and updateFixedStep remain nop and the internal variables (pressureCurve...) are partially initialized.

## Functions

| Function | Description | Line |
|---|---|---|
| `powertrain_supercharger.applyDeformGroupDamage(damageAmount)` | Reduces the delivered pressure (damagePressureCoef, down to -0.1) when a deform group is damaged, and reports 'inductionSystemDamaged'. *(internal)* | 72 |
| `powertrain_supercharger.getPartCondition()` | Returns the supercharger integrity. *(internal)* | 91 |
| `powertrain_supercharger.getTorqueCoefs()` | Estimates the supercharger torque gain coefficient for each RPM of the engine torque curve (clutch and ratio taken into account). | 320 |
| `powertrain_supercharger.init(device, jbeamData)` | Initializes the supercharger for an engine: reads the jbeam, generates the pressure curve and the boostController curve, computes the maximum supercharger speed and installs updateGFX/updateFixedStep. If jbeamData is nil, disables updateGFX. *(internal)* | 209 |
| `powertrain_supercharger.initSounds(jbeamData)` | Creates the supercharger whine sound (soundObj) on the engine node and computes the volume and pitch coefficients. *(internal)* | 183 |
| `powertrain_supercharger.reset(jbeamData)` | Resets the pressure smoother and the damage and wear coefficients, and clears 'superchargerDamaged'. *(internal)* | 202 |
| `powertrain_supercharger.resetSounds(jbeamData)` | Does nothing (empty function). *(internal)* | 180 |
| `powertrain_supercharger.setBypassPressure(pressurePSI)` | Sets the pressure above which the blow-off valve limits the supercharger pressure. | 102 |
| `powertrain_supercharger.setPartCondition(odometer, integrity, visual)` | Applies wear (odometer: pressure down to 50% at 1e9) and integrity of a part loaded from a save. See the bug noted on damagePressureCoef. *(internal)* | 77 |
| `powertrain_supercharger.updateFixedStep(dt)` | Physics step: multiplies assignedEngine.forcedInductionCoef by the supercharger torque gain (pressure) minus the crankshaft loss. (dynamically assigned) *(internal)* | dyn |
| `powertrain_supercharger.updateGFX(dt)` | Graphics frame: progressive clutch state, supercharger speed and RPM, pulsations, pressure with blow-off valve and smoothing, torque loss, electrics.superchargerBoost and 'forcedInductionInfo' stream. (dynamically assigned) *(internal)* | dyn |
| `powertrain_supercharger.updateSounds(dt)` | Sets the whine volume and pitch according to the supercharger pressure and speed. *(internal)* | 106 |

### Parameter details

#### `powertrain_supercharger.applyDeformGroupDamage(damageAmount)`

Reduces the delivered pressure (damagePressureCoef, down to -0.1) when a deform group is damaged, and reports 'inductionSystemDamaged'.

- `damageAmount` (*number*) : Damage amount.

#### `powertrain_supercharger.getPartCondition()`

Returns the supercharger integrity.

- **returns**: number Integrity 0..1.
- **returns**: table {damagePressureCoef}.

#### `powertrain_supercharger.getTorqueCoefs()`

Estimates the supercharger torque gain coefficient for each RPM of the engine torque curve (clutch and ratio taken into account).

- **returns**: table<integer, number> Table keyed by rpm+1: coefficient (1 = no gain).

#### `powertrain_supercharger.init(device, jbeamData)`

Initializes the supercharger for an engine: reads the jbeam, generates the pressure curve and the boostController curve, computes the maximum supercharger speed and installs updateGFX/updateFixedStep. If jbeamData is nil, disables updateGFX.

- `device` (*table*) : Engine device.
- `jbeamData` (*table|nil*) : 'supercharger' jbeam table.

#### `powertrain_supercharger.initSounds(jbeamData)`

Creates the supercharger whine sound (soundObj) on the engine node and computes the volume and pitch coefficients.

- `jbeamData` (*table*) : 'supercharger' jbeam table.

#### `powertrain_supercharger.reset(jbeamData)`

Resets the pressure smoother and the damage and wear coefficients, and clears 'superchargerDamaged'.

- `jbeamData` (*table*) : Not used.

#### `powertrain_supercharger.resetSounds(jbeamData)`

Does nothing (empty function).

- `jbeamData` (*table*) : Not used.

#### `powertrain_supercharger.setBypassPressure(pressurePSI)`

Sets the pressure above which the blow-off valve limits the supercharger pressure.

- `pressurePSI` (*number*) : Blow-off pressure in psi.

#### `powertrain_supercharger.setPartCondition(odometer, integrity, visual)`

Applies wear (odometer: pressure down to 50% at 1e9) and integrity of a part loaded from a save. See the bug noted on damagePressureCoef.

- `odometer` (*number*) : Part odometer.
- `integrity` (*number|table*) : Integrity 0..1 or state table.
- `visual` (*any*) : Not used.

#### `powertrain_supercharger.updateFixedStep(dt)`

Physics step: multiplies assignedEngine.forcedInductionCoef by the supercharger torque gain (pressure) minus the crankshaft loss. (dynamically assigned)

- `dt` (*number*) : Physics step (s). Unused.

#### `powertrain_supercharger.updateGFX(dt)`

Graphics frame: progressive clutch state, supercharger speed and RPM, pulsations, pressure with blow-off valve and smoothing, torque loss, electrics.superchargerBoost and 'forcedInductionInfo' stream. (dynamically assigned)

- `dt` (*number*) : Frame time step (s).

#### `powertrain_supercharger.updateSounds(dt)`

Sets the whine volume and pitch according to the supercharger pressure and speed.

- `dt` (*number*) : Time step (s). Unused.

## Fields

| Field | Type | Description |
|---|---|---|
| `isExisting` | boolean | Always true: tells the engine that a supercharger exists. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/powertrain/supercharger.lua`.*
