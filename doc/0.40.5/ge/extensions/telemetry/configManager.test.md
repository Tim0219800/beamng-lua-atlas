# `telemetry_configManager.test`

*File: `lua/ge/extensions/telemetry/configManager.test.lua` · VM: Game Engine (GE) · 17 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_configManager.test`: `extensions.load("telemetry_configManager.test")`, then the global `telemetry_configManager.test`

Unit test of telemetry/configManager (extensions.testFramework_TestManager:runTestFiles("configManager")).

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_configManager.test.testMissingTrackerConfigIsDisabledAndAllocationFree(ctx)` | Checks that an unknown tracker is disabled by default and that getModuleConfig returns the same table on each call (no allocation). *(internal)* | 7 |

### Parameter details

#### `telemetry_configManager.test.testMissingTrackerConfigIsDisabledAndAllocationFree(ctx)`

Checks that an unknown tracker is disabled by default and that getModuleConfig returns the same table on each call (no allocation).

- `ctx` (*table*) : Test framework context.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/configManager.test.lua`.*
