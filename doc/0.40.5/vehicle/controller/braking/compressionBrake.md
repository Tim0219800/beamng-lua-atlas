# `controller_braking_compressionBrake`

*File: `lua/vehicle/controller/braking/compressionBrake.lua` · VM: Vehicle · 146 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `braking/compressionBrake` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary compression engine brake controller (truck "Jake brake"). It maintains a coefficient from 0 to 1 and preset levels, passes `setCompressionBrakeCoef` to the engine when the throttle is released, and publishes four electrics (setting, actual value, enabled, level index). It also forces the main controller's driving aggression to 1 while the brake is active.

## Example

```lua
local cb = controller.getControllerSafe("compressionBrake")
cb.changeCompressionBrakeLevel(1)
cb.toggleCompressionBrakeState()
```

## Notes

- Jbeam keys read by init: `controlledEngine` ("mainEngine"), `electricsNameActual`, `electricsNameSetting`, `electricsNameIsEnabled`, `electricsNameLevelIndex` (by default `<engine>_compressionBrake_actual|setting|isEnabled|levelIndex`), `compressionBrakeLevels` ({0.33, 0.66, 1.0}), `clutchDisableElectricsName` ("clutchRatio").
- Actual value = coefficient × (1 - sign(requestedThrottle)): 0 as soon as the throttle is requested; also forced to 0 if the clutch electrics is below 1.
- If the engine is not found, init logs an error and replaces `updateGFX` with `nop`.
- At startup, the active level is the last (strongest) and the coefficient is 0 (brake off).
- This controller is relocated: the old name `compressionBrake` is redirected to `braking/compressionBrake`.
- State saved under the keys `<name>Coef` and `<name>LevelIndex`.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_braking_compressionBrake.changeCompressionBrakeLevel(indexChange)` | Goes up or down by a number of levels (clamped) and applies the level's coefficient. | 33 |
| `controller_braking_compressionBrake.getState()` | Returns the coefficient and the level index for the state save. | 79 |
| `controller_braking_compressionBrake.init(jbeamData)` | Finds the controlled engine, the electrics names and the levels from the jbeam. *(internal)* | 106 |
| `controller_braking_compressionBrake.reset(jbeamData)` | Forces the next transmission of the coefficient to the engine. *(internal)* | 74 |
| `controller_braking_compressionBrake.setCompressionBrakeCoef(coef, silent)` | Directly sets the engine brake coefficient (clamped to 0..1) and displays a UI message unless silent. | 26 |
| `controller_braking_compressionBrake.setCompressionBrakeLevel(level, silent)` | Chooses a level by its index (clamped to 1..number of levels) and applies its coefficient. | 38 |
| `controller_braking_compressionBrake.setState(data)` | Restores the level index and the coefficient (validated values, silently). | 87 |
| `controller_braking_compressionBrake.toggleCompressionBrakeState()` | Turns the brake off if it is active, otherwise activates it at the stored level. | 43 |
| `controller_braking_compressionBrake.updateGFX(dt)` | Every frame: computes the actual coefficient, passes it to the engine when it changes, handles the main controller's aggression override and updates the electrics. *(internal)* | 51 |

### Parameter details

#### `controller_braking_compressionBrake.changeCompressionBrakeLevel(indexChange)`

Goes up or down by a number of levels (clamped) and applies the level's coefficient.

- `indexChange` (*integer*) : Index change (+1, -1...).

#### `controller_braking_compressionBrake.getState()`

Returns the coefficient and the level index for the state save.

- **returns**: table State table (keys `<name>Coef`, `<name>LevelIndex`).

#### `controller_braking_compressionBrake.init(jbeamData)`

Finds the controlled engine, the electrics names and the levels from the jbeam.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_braking_compressionBrake.reset(jbeamData)`

Forces the next transmission of the coefficient to the engine.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_braking_compressionBrake.setCompressionBrakeCoef(coef, silent)`

Directly sets the engine brake coefficient (clamped to 0..1) and displays a UI message unless silent.

- `coef` (*number*) : Coefficient 0 to 1.
- `silent` (*boolean|nil*) : true to not display a message.

#### `controller_braking_compressionBrake.setCompressionBrakeLevel(level, silent)`

Chooses a level by its index (clamped to 1..number of levels) and applies its coefficient.

- `level` (*integer*) : Level index (1 = first).
- `silent` (*boolean|nil*) : true to not display a message.

#### `controller_braking_compressionBrake.setState(data)`

Restores the level index and the coefficient (validated values, silently).

- `data` (*table|nil*) : State table.

#### `controller_braking_compressionBrake.updateGFX(dt)`

Every frame: computes the actual coefficient, passes it to the engine when it changes, handles the main controller's aggression override and updates the electrics.

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/braking/compressionBrake.lua`.*
