# `powertrain_turbocharger`

*File: `lua/vehicle/powertrain/turbocharger.lua` · VM: Vehicle · 554 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** powertrain device type `turbocharger` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`

Turbo supercharging subsystem, attached to an engine (it is not a device of the drivetrain chain: init(device, jbeamData) receives the engine). Simulates the turbo shaft speed (exhaust gas torque - back pressure - friction, inertia), the boost pressure via a pressure/turbo-RPM curve, a wastegate (regulated by a PID), an intake blow-off valve (BOV/flutter), antilag, the turbo temperature (damage) and the sounds (whine, spin, BOV). Writes the engine's forcedInductionCoef coefficient and several electrics values (turboRPM, turboSpin, turboBoost, turboBoostMax, turboRpmRatio).

## Example

```lua
-- jbeam (in the engine): "turbocharger":{"inertia":0.1, "pressurePSI":[[0,0],[40000,10],[100000,25]], "engineDef":[[0,0.4,0.2],[8000,1,1]], "wastegateStart":12}
local eng = powertrain.getDevice('mainEngine')
eng.turbocharger.setWastegateOffset(2)  -- +2 psi setpoint
eng.turbocharger.setAntilagCoef(1)
```

## Notes

- jbeam units: pressures in psi (converted to Pa internally), speeds in RPM (rpmToAV = 0.10471971768), inertia unitless (internal inertia = 0.000003 * inertia * 100 * 2.5). electrics values: turboRPM in RPM, turboBoost and turboBoostMax in psi (pressure relative to the atmosphere as the code defines it: no subtraction of 1 atm), turboRpmRatio = AV/AVmax*580 (used for sounds).
- jbeam keys (turbocharger table): pressurePSI (list of [turbo_rpm, psi], required), engineDef (list of [engine_rpm, efficiency, exhaust_factor], required; the 3rd is capped at 1; efficiency = share of pressure converted into power, factor = gas power), inertia, wastegateStart (psi, number or table per gearbox ratio), wastegateLimit (psi, number or table; default = start + 0.01 psi), wastegatePCoef (0.0001), wastegateICoef (0.0015), wastegateDCoef (0), maxExhaustPower (1), backPressureCoef (0.0005), frictionCoef (0.01), maxAntilagPower (0), damageThresholdTemperature (1000), deformGroupDamageScaleCoef (1), pressureRatePSI (30), bovEnabled (true; false = flutter instead of BOV), bovOpenThreshold (0.05), bovOpenChangeThreshold (0.3), electricsRPMName ('turboRPM'), electricsSpinName ('turboSpin'), electricsSpinCoef (0.1), sounds: hissLoopEvent, whineLoopEvent, bovSoundFileName, flutterSoundFileName, whinePitchPer10kRPM (0.05), whineVolumePer10kRPM (0.04), hissVolumePerPSI (0.04), turboSizeCoef (1), bovSoundVolumeCoef (0.3), flutterSoundVolumeCoef (0.3).
- The wastegateStart/Limit values are keyed by electrics gearIndex; if the gear has no entry, the last value read is used (maxWastegateStart/Range).
- The BOV only exists for non-diesel engines (needsBov = requiredEnergyType ~= 'diesel'). It opens when the load is low or drops sharply, outside rev limiter and ignition cut; the boost is then vented.
- updateFixedStep is called at each physics step and multiplies assignedEngine.forcedInductionCoef by (1 + 0.0000087 * pressure_Pa * efficiency(engine_rpm)) (about +6% power per psi). It must therefore be called after the engine resets forcedInductionCoef to 1.
- Damage: applyDeformGroupDamage increases friction and reduces exhaust power; a turbo temperature (exhaust + coolant + oil) above damageThresholdTemperature progressively increases friction. getPartCondition returns min(friction integrity, exhaust integrity).
- Bug/inconsistency: init() does `turbo = deepcopy(jbeamData)` then reads #turbo.pressurePSI and #turbo.engineDef BEFORE testing that they exist; if these tables are missing, the error is a Lua exception and not the 'No turbocharger.pressurePSI table found!' log. M.turboUpdate = nop is set when jbeamData is nil but is never used (the real field is updateGFX).
- Bug/inconsistency: the 'forcedInductionInfo' stream reads electrics.values.boost and electrics.values.boostMax, whereas this file writes turboBoost and turboBoostMax; boost/boostMax must come from elsewhere (engine), otherwise arithmetic on nil.
- Bug/inconsistency: `turbo.turboPressureCurve[floor(turboRPM)] * psiToPascal or turboPressure`: if the index is outside the table, the multiplication of nil raises an error before the `or` takes effect. The last valid index is floor(maxTurboAV in RPM).
- Bug/inconsistency: maxWastegateStart/maxWastegateLimit/maxWastegateRange take the last value iterated by pairs() (order not guaranteed if the per-gear tables are sparse).
- Bug/inconsistency: initSounds names the sound locations the wrong way round: setSoundLocation('turbochargerwhine', 'Turbo Hiss: ...') and ('turbochargerhiss', 'Turbo Whine: ...').

## Functions

| Function | Description | Line |
|---|---|---|
| `powertrain_turbocharger.applyDeformGroupDamage(damageAmount)` | Worsens friction and reduces exhaust power when a deform group of the turbo is damaged; reports 'inductionSystemDamaged' to the damage tracker. *(internal)* | 115 |
| `powertrain_turbocharger.getPartCondition()` | Returns the turbo integrity. *(internal)* | 136 |
| `powertrain_turbocharger.getTorqueCoefs()` | Estimates, for each RPM of the engine torque curve, the torque gain coefficient provided by the turbo (assuming the turbo at steady state and the wastegate at its average setpoint). Used by the power curve tools. | 507 |
| `powertrain_turbocharger.init(device, jbeamData)` | Initializes the turbo for a given engine: copies the jbeam, builds the pressure/exhaust/efficiency curves (createCurve), the per-gear wastegate tables, the smoothers, the coefficients and installs updateGFX/updateFixedStep/updateSounds. Called by the engine at initialization. *(internal)* | 324 |
| `powertrain_turbocharger.initSounds(jbeamData)` | Creates the hiss and whine audio sources on the engine node and reads the sound coefficients from the jbeam. *(internal)* | 482 |
| `powertrain_turbocharger.reset(jbeamData)` | Resets the turbo state (speed, pressures, BOV, wastegate PID, antilag, damage/wear coefficients) and the smoothers. Called on vehicle reset. *(internal)* | 290 |
| `powertrain_turbocharger.resetSounds(jbeamData)` | Does nothing (empty function), called on sound reset. *(internal)* | 504 |
| `powertrain_turbocharger.setAntilagCoef(coef)` | Sets the antilag level (spinning the turbo shaft back up during throttle lifts): antilag power = coef * maxAntilagPower. Also taken into account in the load computation for the BOV. | 533 |
| `powertrain_turbocharger.setPartCondition(odometer, integrity, visual)` | Applies wear (odometer) and integrity of a part loaded from a save. *(internal)* | 121 |
| `powertrain_turbocharger.setWastegateOffset(offset)` | Shifts the wastegate pressure setpoint (boost control). | 529 |
| `powertrain_turbocharger.updateFixedStep(dt)` | Physics step: wastegate PID, shaft torque balance (exhaust + antilag, back pressure, friction), turbo speed, raw then smoothed pressure, and application to the engine's forcedInductionCoef. Replaces the initial nop after init. (dynamically assigned) *(internal)* | dyn |
| `powertrain_turbocharger.updateGFX(dt)` | Graphics frame: turbo temperature and damage, BOV/flutter logic and its sounds, wastegate setpoint according to the gear, electrics values (turboRPM, turboSpin, turboRpmRatio, turboBoost) and 'forcedInductionInfo' stream to the UI. (dynamically assigned) *(internal)* | dyn |
| `powertrain_turbocharger.updateSounds(dt)` | Sets the volume/pitch of the pressure hiss and the rotation noise (whine) of the turbo. (dynamically assigned) *(internal)* | dyn |

### Parameter details

#### `powertrain_turbocharger.applyDeformGroupDamage(damageAmount)`

Worsens friction and reduces exhaust power when a deform group of the turbo is damaged; reports 'inductionSystemDamaged' to the damage tracker.

- `damageAmount` (*number*) : Damage amount.

#### `powertrain_turbocharger.getPartCondition()`

Returns the turbo integrity.

- **returns**: number Integrity 0..1.
- **returns**: table {damageFrictionCoef, damageExhaustPowerCoef}.

#### `powertrain_turbocharger.getTorqueCoefs()`

Estimates, for each RPM of the engine torque curve, the torque gain coefficient provided by the turbo (assuming the turbo at steady state and the wastegate at its average setpoint). Used by the power curve tools.

- **returns**: table<integer, number> Table keyed by rpm+1: coefficient (1 = no gain).

#### `powertrain_turbocharger.init(device, jbeamData)`

Initializes the turbo for a given engine: copies the jbeam, builds the pressure/exhaust/efficiency curves (createCurve), the per-gear wastegate tables, the smoothers, the coefficients and installs updateGFX/updateFixedStep/updateSounds. Called by the engine at initialization.

- `device` (*table*) : Engine device to which the turbo is attached.
- `jbeamData` (*table|nil*) : 'turbocharger' jbeam table (see notes). If nil, the turbo stays inactive.

#### `powertrain_turbocharger.initSounds(jbeamData)`

Creates the hiss and whine audio sources on the engine node and reads the sound coefficients from the jbeam.

- `jbeamData` (*table*) : Unused (the internal copy of the jbeam is used).

#### `powertrain_turbocharger.reset(jbeamData)`

Resets the turbo state (speed, pressures, BOV, wastegate PID, antilag, damage/wear coefficients) and the smoothers. Called on vehicle reset.

- `jbeamData` (*table*) : Not used.

#### `powertrain_turbocharger.resetSounds(jbeamData)`

Does nothing (empty function), called on sound reset.

- `jbeamData` (*table*) : Not used.

#### `powertrain_turbocharger.setAntilagCoef(coef)`

Sets the antilag level (spinning the turbo shaft back up during throttle lifts): antilag power = coef * maxAntilagPower. Also taken into account in the load computation for the BOV.

- `coef` (*number*) : Coefficient 0..1.

#### `powertrain_turbocharger.setPartCondition(odometer, integrity, visual)`

Applies wear (odometer) and integrity of a part loaded from a save.

- `odometer` (*number*) : Part odometer.
- `integrity` (*number|table*) : Integrity 0..1 or table {damageFrictionCoef, damageExhaustPowerCoef}.
- `visual` (*any*) : Not used.

#### `powertrain_turbocharger.setWastegateOffset(offset)`

Shifts the wastegate pressure setpoint (boost control).

- `offset` (*number*) : Offset in psi (added to the setpoint, can be negative).

#### `powertrain_turbocharger.updateFixedStep(dt)`

Physics step: wastegate PID, shaft torque balance (exhaust + antilag, back pressure, friction), turbo speed, raw then smoothed pressure, and application to the engine's forcedInductionCoef. Replaces the initial nop after init. (dynamically assigned)

- `dt` (*number*) : Physics step (s).

#### `powertrain_turbocharger.updateGFX(dt)`

Graphics frame: turbo temperature and damage, BOV/flutter logic and its sounds, wastegate setpoint according to the gear, electrics values (turboRPM, turboSpin, turboRpmRatio, turboBoost) and 'forcedInductionInfo' stream to the UI. (dynamically assigned)

- `dt` (*number*) : Frame time step (s).

#### `powertrain_turbocharger.updateSounds(dt)`

Sets the volume/pitch of the pressure hiss and the rotation noise (whine) of the turbo. (dynamically assigned)

- `dt` (*number*) : Time step (s). Unused.

## Fields

| Field | Type | Description |
|---|---|---|
| `isExisting` | boolean | Always true: lets the engine know that a turbo module exists. |
| `turboAV` | number|nil | Angular speed of the turbo shaft in rad/s; nil before init, updated at each physics step. |

## Calls into the engine (C++)

- `obj:` `createSFXSource`, `createSFXSource2`, `cutSFX`, `playSFX`, `setVolumePitch`, `setVolumePitchCT`, `stopSFX`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/powertrain/turbocharger.lua`.*
