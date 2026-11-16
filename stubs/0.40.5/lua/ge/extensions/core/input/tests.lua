---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/input/tests.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_input_tests`: orchestrates the input latency/frequency tests (system, engine, vehicle, oscillation) displayed in the UI. It unpauses the simulation, launches the `inputTests` extension on the vehicle side for each test in a queue, receives the statistics and pushes the state to the UI via `InputTestStateChanged`. Mainly intended for the diagnostic interface, of little use to a modder.
--- Access: extension `core_input_tests`: `extensions.load("core_input_tests")`, then the global `core_input_tests`
---@class core_input_tests
core_input_tests = {}

--- Hook called (from the vehicle) with a test's statistics: stores the message and stats on the test's row and refreshes the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/input/tests.lua:78
---@param stats table {testId, message?, sampleCount, …}.
function core_input_tests.onInputTestStats(stats) end

--- Hook called when a run ends: if it is the current run, moves on to the next one in the queue.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/input/tests.lua:85
---@param testId string runId of the finished run.
function core_input_tests.onInputTestStatus(testId) end

--- Hook: if the player vehicle disappeared during a test, ends the tests with an error message; otherwise refreshes the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/input/tests.lua:90
function core_input_tests.onVehicleDestroyed() end

--- Hook: alias of updateUI. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/input/tests.lua:dyn
function core_input_tests.onVehicleSpawned() end

--- Hook: alias of updateUI. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/input/tests.lua:dyn
function core_input_tests.onVehicleSwitched() end

--- Starts a queue of tests. Removes duplicates, clears the messages and stats of the tests concerned, unpauses the simulation then launches the first run on the player vehicle (extensions.load('inputTests'); inputTests.start(runId)).
---Source: lua/ge/extensions/core/input/tests.lua:58
---@param runIds string[] List of runIds: 'systemTest', 'simulationTest', 'vehicleTest', 'vehicleOscillationTest'. Empty list: only refreshes the UI.
function core_input_tests.startTests(runIds) end

--- Updates state.hasVehicle (player vehicle 0 present) and sends the full state to the UI via guihooks InputTestStateChanged.
---Source: lua/ge/extensions/core/input/tests.lua:33
function core_input_tests.updateUI() end

