# `telemetry_hardwareChanges.test`

*File: `lua/ge/extensions/telemetry/hardwareChanges.test.lua` · VM: Game Engine (GE) · 73 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_hardwareChanges.test`: `extensions.load("telemetry_hardwareChanges.test")`, then the global `telemetry_hardwareChanges.test`

Unit tests of telemetry/hardwareChanges (runTestFiles("hardwareChanges")).

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_hardwareChanges.test.testConnectionChangesContainAddedAndRemovedDevices(ctx)` | Checks that an added device and a removed one give two events, connection first. *(internal)* | 30 |
| `telemetry_hardwareChanges.test.testControllerSnapshotFiltersNonControllerDevices(ctx)` | Checks that the snapshot only keeps wheel, joystick, gamepad and xinput (4 entries out of 8 devices). *(internal)* | 11 |
| `telemetry_hardwareChanges.test.testOnlyDirectWindowFullscreenTransitionsAreTracked(ctx)` | Checks that only direct Window/Fullscreen transitions are tracked. *(internal)* | 64 |
| `telemetry_hardwareChanges.test.testReplacedDeviceSlotReportsBothTransitions(ctx)` | Checks that a wheel replaced in the same slot reports the connection of the new one and the disconnection of the old one. *(internal)* | 47 |

### Parameter details

#### `telemetry_hardwareChanges.test.testConnectionChangesContainAddedAndRemovedDevices(ctx)`

Checks that an added device and a removed one give two events, connection first.

- `ctx` (*table*) : Test framework context.

#### `telemetry_hardwareChanges.test.testControllerSnapshotFiltersNonControllerDevices(ctx)`

Checks that the snapshot only keeps wheel, joystick, gamepad and xinput (4 entries out of 8 devices).

- `ctx` (*table*) : Test framework context.

#### `telemetry_hardwareChanges.test.testOnlyDirectWindowFullscreenTransitionsAreTracked(ctx)`

Checks that only direct Window/Fullscreen transitions are tracked.

- `ctx` (*table*) : Test framework context.

#### `telemetry_hardwareChanges.test.testReplacedDeviceSlotReportsBothTransitions(ctx)`

Checks that a wheel replaced in the same slot reports the connection of the new one and the disconnection of the old one.

- `ctx` (*table*) : Test framework context.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/hardwareChanges.test.lua`.*
