---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/inputTests.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Test bench for latency and accuracy of steering wheel force feedback (FFB): measures USB hardware latency, wheel resolution and update frequency, simulation engine latency and vehicle latency, as well as steering oscillations. The tests run in a coroutine called by hydros via hydros.testHook; the results (statistics, 30-bucket histograms) are sent to the GE by the onInputTestStats hook, and the end by onInputTestStatus.
--- Access: extension `inputTests`: `extensions.load (vehicle VM)("inputTests")`, then the global `inputTests`
---@class inputTests
inputTests = {}

--- Called on unload: removes hydros.testHook.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/inputTests.lua:478
function inputTests.onExtensionUnloaded() end

--- Starts a test: fetches the FFB id, creates the coroutine and installs M.update in hydros.testHook.
---Source: lua/vehicle/extensions/inputTests.lua:463
---@param testId string 'systemTest', 'simulationTest', 'vehicleTest' or 'vehicleOscillationTest'.
function inputTests.start(testId) end

--- Called by hydros at each FFB step via testHook: resumes the test coroutine with the real dt (wall clock) and the simulated and hardware wheel positions. Returns whether the normal FFB computation must run and the next hardware position.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/inputTests.lua:34
---@param dtSim number Simulation time step (used only on the first call).
---@param simWheelPos number Simulated wheel position (normalized, -1 to 1 inferred from code).
---@param hydroPos number Target position of the hardware wheel.
---@return boolean  true to run the vehicle FFB computation this step.
---@return number  Hardware position to apply next.
function inputTests.update(dtSim, simWheelPos, hydroPos) end

