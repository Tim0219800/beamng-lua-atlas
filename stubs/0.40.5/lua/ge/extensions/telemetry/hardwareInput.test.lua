---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/hardwareInput.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Unit tests of telemetry/hardwareInput (runTestFiles("hardwareInput")).
--- Access: extension `telemetry_hardwareInput.test`: `extensions.load("telemetry_hardwareInput.test")`, then the global `telemetry_hardwareInput.test`
---@class telemetry_hardwareInput.test
telemetry_hardwareInput.test = {}

--- Checks that the English name is read from /settings/inputmaps/<vidpid>.json when the file is official.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/hardwareInput.test.lua:69
---@param ctx table Test framework context.
function telemetry_hardwareInput.test.testEnglishNameComesOnlyFromOfficialInputMap(ctx) end

--- Checks that all the fields of a wheel (names, vidpid, productId/vendorId, GUID, FFB, revisions, controls, controlCounts) are carried over.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/hardwareInput.test.lua:34
---@param ctx table Test framework context.
function telemetry_hardwareInput.test.testMapsEveryAvailableWheelField(ctx) end

--- Checks that a device that is not a wheel only keeps type, productName, vidpid and forceFeedback.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/hardwareInput.test.lua:100
---@param ctx table Test framework context.
function telemetry_hardwareInput.test.testNonWheelsKeepOnlyCommonIdentity(ctx) end

--- Checks that a symbolic identifier (e.g. 'XIDevice') is not uppercased.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/hardwareInput.test.lua:117
---@param ctx table Test framework context.
function telemetry_hardwareInput.test.testSymbolicDeviceIdentityKeepsItsCase(ctx) end

--- Checks that without a valid FFB sampling period, neither the period nor maxRawFfbUpdateRateHz is set.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/hardwareInput.test.lua:61
---@param ctx table Test framework context.
function telemetry_hardwareInput.test.testUnknownDefaultUpdateRateStaysAbsent(ctx) end

--- Checks that an unofficial input table cannot provide a name.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/hardwareInput.test.lua:87
---@param ctx table Test framework context.
function telemetry_hardwareInput.test.testUnofficialInputMapCannotSupplyTelemetryName(ctx) end

