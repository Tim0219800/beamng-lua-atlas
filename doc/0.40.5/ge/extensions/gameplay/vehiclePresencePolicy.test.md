# `gameplay_vehiclePresencePolicy.test`

*File: `lua/ge/extensions/gameplay/vehiclePresencePolicy.test.lua` · VM: Game Engine (GE) · 35 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_vehiclePresencePolicy.test`: `extensions.load("gameplay_vehiclePresencePolicy.test")`, then the global `gameplay_vehiclePresencePolicy.test`

Unit tests for gameplay/vehiclePresencePolicy. Each testXxx function receives a test context `ctx` (with assert and assertEqual) provided by the game's test runner; this is not a gameplay extension to load.

## Notes

- The tests cover mode validation/normalization, the default unseated mode depending on context, and action map permissions.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_vehiclePresencePolicy.test.testActionMapPermissions(ctx)` | Checks allowsActionMap: driver only on "driving", passenger never, unrestricted always. *(internal)* | 25 |
| `gameplay_vehiclePresencePolicy.test.testDefaultUnseatedMode(ctx)` | Checks defaultUnseatedMode: unrestricted only in freeroam without multiseat, passenger in all other cases (multiplayer, career, nil). *(internal)* | 17 |
| `gameplay_vehiclePresencePolicy.test.testModeValidationAndNormalization(ctx)` | Checks isValidMode (driver, passenger, unrestricted valid; observer invalid) and normalizeMode (fallback, default value "passenger"). *(internal)* | 7 |

### Parameter details

#### `gameplay_vehiclePresencePolicy.test.testActionMapPermissions(ctx)`

Checks allowsActionMap: driver only on "driving", passenger never, unrestricted always.

- `ctx` (*table*) : Test context.

#### `gameplay_vehiclePresencePolicy.test.testDefaultUnseatedMode(ctx)`

Checks defaultUnseatedMode: unrestricted only in freeroam without multiseat, passenger in all other cases (multiplayer, career, nil).

- `ctx` (*table*) : Test context.

#### `gameplay_vehiclePresencePolicy.test.testModeValidationAndNormalization(ctx)`

Checks isValidMode (driver, passenger, unrestricted valid; observer invalid) and normalizeMode (fallback, default value "passenger").

- `ctx` (*table*) : Test context with assert and assertEqual.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/vehiclePresencePolicy.test.lua`.*
