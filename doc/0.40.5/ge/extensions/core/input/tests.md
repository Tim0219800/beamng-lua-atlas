# `core_input_tests`

*File: `lua/ge/extensions/core/input/tests.lua` · VM: Game Engine (GE) · 98 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_input_tests`: `extensions.load("core_input_tests")`, then the global `core_input_tests`

GE extension `core_input_tests`: orchestrates the input latency/frequency tests (system, engine, vehicle, oscillation) displayed in the UI. It unpauses the simulation, launches the `inputTests` extension on the vehicle side for each test in a queue, receives the statistics and pushes the state to the UI via `InputTestStateChanged`. Mainly intended for the diagnostic interface, of little use to a modder.

## Notes

- Declared tests: systemFrequencyTest, systemResolutionTest, systemLatencyTest (run 'systemTest'), engineLatencyTest ('simulationTest'), vehicleLatencyTest ('vehicleTest'), oscillationTest and vehicleFrequencyTest ('vehicleOscillationTest'). startTests receives runIds, not test ids.
- The previous simulation pause state is stored (simTimeAuthority.getPause) and restored at the end; the tests trigger simTimeAuthority.pause(false).
- Message displayed if the vehicle disappears: 'Vehicle lost while the test was running.'.
- M.updateUI and onVehicleSpawned/onVehicleSwitched are the same function (updateUI).

## Functions

| Function | Description | Line |
|---|---|---|
| `core_input_tests.onInputTestStats(stats)` | Hook called (from the vehicle) with a test's statistics: stores the message and stats on the test's row and refreshes the UI. *(internal)* *(hook)* | 78 |
| `core_input_tests.onInputTestStatus(testId)` | Hook called when a run ends: if it is the current run, moves on to the next one in the queue. *(internal)* *(hook)* | 85 |
| `core_input_tests.onVehicleDestroyed()` | Hook: if the player vehicle disappeared during a test, ends the tests with an error message; otherwise refreshes the UI. *(internal)* *(hook)* | 90 |
| `core_input_tests.onVehicleSpawned()` | Hook: alias of updateUI. (dynamically assigned) *(internal)* *(hook)* | dyn |
| `core_input_tests.onVehicleSwitched()` | Hook: alias of updateUI. (dynamically assigned) *(internal)* *(hook)* | dyn |
| `core_input_tests.startTests(runIds)` | Starts a queue of tests. Removes duplicates, clears the messages and stats of the tests concerned, unpauses the simulation then launches the first run on the player vehicle (extensions.load('inputTests'); inputTests.start(runId)). | 58 |
| `core_input_tests.updateUI()` | Updates state.hasVehicle (player vehicle 0 present) and sends the full state to the UI via guihooks InputTestStateChanged. | 33 |

### Parameter details

#### `core_input_tests.onInputTestStats(stats)`

Hook called (from the vehicle) with a test's statistics: stores the message and stats on the test's row and refreshes the UI.

- `stats` (*table*) : {testId, message?, sampleCount, …}.

#### `core_input_tests.onInputTestStatus(testId)`

Hook called when a run ends: if it is the current run, moves on to the next one in the queue.

- `testId` (*string*) : runId of the finished run.

#### `core_input_tests.startTests(runIds)`

Starts a queue of tests. Removes duplicates, clears the messages and stats of the tests concerned, unpauses the simulation then launches the first run on the player vehicle (extensions.load('inputTests'); inputTests.start(runId)).

- `runIds` (*string[]*) : List of runIds: 'systemTest', 'simulationTest', 'vehicleTest', 'vehicleOscillationTest'. Empty list: only refreshes the UI.

**UI events (guihooks.trigger):** `InputTestStateChanged`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/input/tests.lua`.*
