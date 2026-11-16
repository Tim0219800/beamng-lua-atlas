---@meta
-- tim19Atlas stub generated from lua/ge/extensions/remoteControl/remoteControl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Example/prototype of an HTTP remote control: on load, starts a small HTTP server (utils/simpleHttpServer) on 0.0.0.0:8081 that serves the files in /lua/ge/extensions/remoteControl/ and a few API routes, and registers a virtual input device "httpcontrollerv1" (1 axis, 2 buttons declared) with the virtual input manager. It serves as a basis for controlling the game from a phone or a browser.
--- Access: extension `remoteControl_remoteControl`: `extensions.load("remoteControl_remoteControl")`, then the global `remoteControl_remoteControl`
---@class remoteControl_remoteControl
---@field _unittests table Unit test table (testExampleSuccess, testExampleFailure_shouldFail) for the game's test runner.
---@field onFirstUpdate nil Reference to an undefined local variable: equals nil.
remoteControl_remoteControl = {}

--- Hook called when the extension loads: starts the HTTP server and declares the routes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/remoteControl/remoteControl.lua:17
function remoteControl_remoteControl.onExtensionLoaded() end

--- Hook called on unload: unregisters the virtual device (the HTTP server is not explicitly stopped).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/remoteControl/remoteControl.lua:62
function remoteControl_remoteControl.onExtensionUnloaded() end

--- Hook called every frame: processes HTTP requests and emits the virtual device's events (registers it on the first frame).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/remoteControl/remoteControl.lua:46
---@param dtReal number Real time delta (s).
---@param dtSim number Simulated time delta (s).
---@param dtRaw number Raw time delta (s).
function remoteControl_remoteControl.onUpdate(dtReal, dtSim, dtRaw) end

--- Example tests exposed by _unittests; the functions must start with "test".
---@class remoteControl_remoteControl_tests
local remoteControl_remoteControl_tests = {}

--- Example test that fails on purpose.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/remoteControl/remoteControl.lua:83
---@param context table Test context.
function remoteControl_remoteControl_tests.testExampleFailure_shouldFail(context) end

--- Example test that succeeds (42 == 42).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/remoteControl/remoteControl.lua:72
---@param context table Test context with success() and fail().
function remoteControl_remoteControl_tests.testExampleSuccess(context) end

