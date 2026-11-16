---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/hardwareChanges.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Unit tests of telemetry/hardwareChanges (runTestFiles("hardwareChanges")).
--- Access: extension `telemetry_hardwareChanges.test`: `extensions.load("telemetry_hardwareChanges.test")`, then the global `telemetry_hardwareChanges.test`
---@class telemetry_hardwareChanges.test
telemetry_hardwareChanges.test = {}

--- Checks that an added device and a removed one give two events, connection first.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/hardwareChanges.test.lua:30
---@param ctx table Test framework context.
function telemetry_hardwareChanges.test.testConnectionChangesContainAddedAndRemovedDevices(ctx) end

--- Checks that the snapshot only keeps wheel, joystick, gamepad and xinput (4 entries out of 8 devices).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/hardwareChanges.test.lua:11
---@param ctx table Test framework context.
function telemetry_hardwareChanges.test.testControllerSnapshotFiltersNonControllerDevices(ctx) end

--- Checks that only direct Window/Fullscreen transitions are tracked.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/hardwareChanges.test.lua:64
---@param ctx table Test framework context.
function telemetry_hardwareChanges.test.testOnlyDirectWindowFullscreenTransitionsAreTracked(ctx) end

--- Checks that a wheel replaced in the same slot reports the connection of the new one and the disconnection of the old one.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/hardwareChanges.test.lua:47
---@param ctx table Test framework context.
function telemetry_hardwareChanges.test.testReplacedDeviceSlotReportsBothTransitions(ctx) end

