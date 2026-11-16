---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/hardwareAudio.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Unit tests of telemetry/hardwareAudio (runTestFiles("hardwareAudio")).
--- Access: extension `telemetry_hardwareAudio.test`: `extensions.load("telemetry_hardwareAudio.test")`, then the global `telemetry_hardwareAudio.test`
---@class telemetry_hardwareAudio.test
telemetry_hardwareAudio.test = {}

--- Checks the classification of headphones, display/TV, speakers and virtual device from typical names.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/hardwareAudio.test.lua:25
---@param ctx table Test framework context.
function telemetry_hardwareAudio.test.testClassifiesKnownOutputTypes(ctx) end

--- Checks that fromDeviceInfo(nil) returns nil.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/hardwareAudio.test.lua:50
---@param ctx table Test framework context.
function telemetry_hardwareAudio.test.testMissingDeviceIsNotReported(ctx) end

--- Checks that the raw name and the diagnostic fields do not enter the telemetry, while sampleRateHz, speakerMode and channels are kept.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/hardwareAudio.test.lua:36
---@param ctx table Test framework context.
function telemetry_hardwareAudio.test.testRawDeviceNameIsRemoved(ctx) end

--- Checks that a name without a keyword (e.g. 'WH-1000XM5') gives the category 'unknown'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/hardwareAudio.test.lua:32
---@param ctx table Test framework context.
function telemetry_hardwareAudio.test.testUnknownNamesStayUnknown(ctx) end

