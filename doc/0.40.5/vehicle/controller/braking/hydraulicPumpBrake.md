# `controller_braking_hydraulicPumpBrake`

*File: `lua/vehicle/controller/braking/hydraulicPumpBrake.lua` · VM: Vehicle · 197 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `braking/hydraulicPumpBrake` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary controller for hydraulic braking powered by the engine's pump (heavy or old vehicles). The front and rear brakes (`brakeF`, `brakeR`) only work with the engine running; without pressure or if damage beams are broken, the parking brake is applied automatically. Offers a hill assist (residual rear brake without throttle) and a front brake lockout. Call order: `defaultOrder = 50` (early).

## Notes

- Jbeam keys read by init: `relevantEngineName` ("mainEngine"), `frontDamageBeamTag`, `rearDamageBeamTag` (beam tags from `beamstate.tagBeamMap`; breaking one cuts the front or rear brake).
- The engine is considered running if `outputAV1` > 10 rad/s; the coefficient is smoothed.
- Electrics written: brakeF, brakeR, frontBrakeLockOut (1/0), hillAssist (0..1). Reads electrics throttle and brake.
- Hill assist: as long as the coefficient is > 0 and the throttle is <= 0, adds up to 0.8 to the rear brake.
- The parking brake is applied via `controller.mainController.smartParkingBrake` if it exists, otherwise via `input.event("parkingbrake", 1, FILTER_KBD)`.
- Warning: updateGFX assumes the jbeam tags are defined; with a nil tag, `beamstate.tagBeamMap[nil]` is read (returns nil, hence an empty table).

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_braking_hydraulicPumpBrake.beamBroken(id, energy)` | Beam break hook: if the beam is in the front or rear damage tags, disables the corresponding brake until reset. *(internal)* | 75 |
| `controller_braking_hydraulicPumpBrake.changeHillAssistCoef(change)` | Adds a change to the hill assist coefficient. | 111 |
| `controller_braking_hydraulicPumpBrake.getState()` | Returns the hill assist and the front lockout for the state save. | 159 |
| `controller_braking_hydraulicPumpBrake.init(jbeamData)` | Finds the engine and the damage beam lists (via the jbeam tags). *(internal)* | 140 |
| `controller_braking_hydraulicPumpBrake.reset(jbeamData)` | Reinitializes the engine smoother, the damage coefficients and the automatic parking brake. *(internal)* | 133 |
| `controller_braking_hydraulicPumpBrake.setFrontLockOutEnabled(enabled, silent)` | Enables or disables the front brake lockout (the front brake is cut when active). | 115 |
| `controller_braking_hydraulicPumpBrake.setHillAssistCoef(coef, silent)` | Sets the hill assist coefficient (0 to 1, reset to 0 if <= 0.01) and displays a UI message unless silent. | 94 |
| `controller_braking_hydraulicPumpBrake.setState(data)` | Restores these two values (silently). | 165 |
| `controller_braking_hydraulicPumpBrake.toggleFrontLockOutEnabled()` | Toggles the front brake lockout state. | 129 |
| `controller_braking_hydraulicPumpBrake.updateGFX(dt)` | Every frame: computes brakeF/brakeR taking into account the running engine, hill assist, front lockout and broken beams; handles the automatic parking brake and publishes the electrics. *(internal)* | 31 |

### Parameter details

#### `controller_braking_hydraulicPumpBrake.beamBroken(id, energy)`

Beam break hook: if the beam is in the front or rear damage tags, disables the corresponding brake until reset.

- `id` (*integer*) : cid of the beam.
- `energy` (*number*) : Break energy (unused).

#### `controller_braking_hydraulicPumpBrake.changeHillAssistCoef(change)`

Adds a change to the hill assist coefficient.

- `change` (*number*) : Change (can be negative).

#### `controller_braking_hydraulicPumpBrake.getState()`

Returns the hill assist and the front lockout for the state save.

- **returns**: table Keys `<name>_hillAssistCoef` and `<name>_frontLockOutEnabled`.

#### `controller_braking_hydraulicPumpBrake.init(jbeamData)`

Finds the engine and the damage beam lists (via the jbeam tags).

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_braking_hydraulicPumpBrake.reset(jbeamData)`

Reinitializes the engine smoother, the damage coefficients and the automatic parking brake.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_braking_hydraulicPumpBrake.setFrontLockOutEnabled(enabled, silent)`

Enables or disables the front brake lockout (the front brake is cut when active).

- `enabled` (*boolean*) : true to cut the front brake.
- `silent` (*boolean|nil*) : true to not display a message.

#### `controller_braking_hydraulicPumpBrake.setHillAssistCoef(coef, silent)`

Sets the hill assist coefficient (0 to 1, reset to 0 if <= 0.01) and displays a UI message unless silent.

- `coef` (*number*) : Coefficient 0 to 1.
- `silent` (*boolean|nil*) : true to not display a message.

#### `controller_braking_hydraulicPumpBrake.setState(data)`

Restores these two values (silently).

- `data` (*table|nil*) : State table.

#### `controller_braking_hydraulicPumpBrake.updateGFX(dt)`

Every frame: computes brakeF/brakeR taking into account the running engine, hill assist, front lockout and broken beams; handles the automatic parking brake and publishes the electrics.

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `defaultOrder` | number | 50: default call rank, early in the sorted list. |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/braking/hydraulicPumpBrake.lua`.*
