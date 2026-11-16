# `telemetry_hardwareInput.test`

*File: `lua/ge/extensions/telemetry/hardwareInput.test.lua` · VM: Game Engine (GE) · 128 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_hardwareInput.test`: `extensions.load("telemetry_hardwareInput.test")`, then the global `telemetry_hardwareInput.test`

Unit tests of telemetry/hardwareInput (runTestFiles("hardwareInput")).

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_hardwareInput.test.testEnglishNameComesOnlyFromOfficialInputMap(ctx)` | Checks that the English name is read from /settings/inputmaps/<vidpid>.json when the file is official. *(internal)* | 69 |
| `telemetry_hardwareInput.test.testMapsEveryAvailableWheelField(ctx)` | Checks that all the fields of a wheel (names, vidpid, productId/vendorId, GUID, FFB, revisions, controls, controlCounts) are carried over. *(internal)* | 34 |
| `telemetry_hardwareInput.test.testNonWheelsKeepOnlyCommonIdentity(ctx)` | Checks that a device that is not a wheel only keeps type, productName, vidpid and forceFeedback. *(internal)* | 100 |
| `telemetry_hardwareInput.test.testSymbolicDeviceIdentityKeepsItsCase(ctx)` | Checks that a symbolic identifier (e.g. 'XIDevice') is not uppercased. *(internal)* | 117 |
| `telemetry_hardwareInput.test.testUnknownDefaultUpdateRateStaysAbsent(ctx)` | Checks that without a valid FFB sampling period, neither the period nor maxRawFfbUpdateRateHz is set. *(internal)* | 61 |
| `telemetry_hardwareInput.test.testUnofficialInputMapCannotSupplyTelemetryName(ctx)` | Checks that an unofficial input table cannot provide a name. *(internal)* | 87 |

### Parameter details

#### `telemetry_hardwareInput.test.testEnglishNameComesOnlyFromOfficialInputMap(ctx)`

Checks that the English name is read from /settings/inputmaps/<vidpid>.json when the file is official.

- `ctx` (*table*) : Test framework context.

#### `telemetry_hardwareInput.test.testMapsEveryAvailableWheelField(ctx)`

Checks that all the fields of a wheel (names, vidpid, productId/vendorId, GUID, FFB, revisions, controls, controlCounts) are carried over.

- `ctx` (*table*) : Test framework context.

#### `telemetry_hardwareInput.test.testNonWheelsKeepOnlyCommonIdentity(ctx)`

Checks that a device that is not a wheel only keeps type, productName, vidpid and forceFeedback.

- `ctx` (*table*) : Test framework context.

#### `telemetry_hardwareInput.test.testSymbolicDeviceIdentityKeepsItsCase(ctx)`

Checks that a symbolic identifier (e.g. 'XIDevice') is not uppercased.

- `ctx` (*table*) : Test framework context.

#### `telemetry_hardwareInput.test.testUnknownDefaultUpdateRateStaysAbsent(ctx)`

Checks that without a valid FFB sampling period, neither the period nor maxRawFfbUpdateRateHz is set.

- `ctx` (*table*) : Test framework context.

#### `telemetry_hardwareInput.test.testUnofficialInputMapCannotSupplyTelemetryName(ctx)`

Checks that an unofficial input table cannot provide a name.

- `ctx` (*table*) : Test framework context.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/hardwareInput.test.lua`.*
