# `telemetry_core.test`

*File: `lua/ge/extensions/telemetry/core.test.lua` · VM: Game Engine (GE) · 14 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_core.test`: `extensions.load("telemetry_core.test")`, then the global `telemetry_core.test`

Unit test of telemetry/core (extensions.testFramework_TestManager:runTestFiles("core")).

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_core.test.testTelemetryPlatformSupport(ctx)` | Checks that isPlatformSupported returns false for 'ps5' and 'ps5pro' and true for the PC platform (empty string). *(internal)* | 7 |

### Parameter details

#### `telemetry_core.test.testTelemetryPlatformSupport(ctx)`

Checks that isPlatformSupported returns false for 'ps5' and 'ps5pro' and true for the PC platform (empty string).

- `ctx` (*table*) : Test framework context.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/core.test.lua`.*
