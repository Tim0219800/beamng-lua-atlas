---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/configManager.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Unit test of telemetry/configManager (extensions.testFramework_TestManager:runTestFiles("configManager")).
--- Access: extension `telemetry_configManager.test`: `extensions.load("telemetry_configManager.test")`, then the global `telemetry_configManager.test`
---@class telemetry_configManager.test
telemetry_configManager.test = {}

--- Checks that an unknown tracker is disabled by default and that getModuleConfig returns the same table on each call (no allocation).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/configManager.test.lua:7
---@param ctx table Test framework context.
function telemetry_configManager.test.testMissingTrackerConfigIsDisabledAndAllocationFree(ctx) end

