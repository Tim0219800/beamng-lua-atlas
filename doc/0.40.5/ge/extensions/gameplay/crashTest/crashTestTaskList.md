# `gameplay_crashTest_crashTestTaskList`

*File: `lua/ge/extensions/gameplay/crashTest/crashTestTaskList.lua` · VM: Game Engine (GE) · 165 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_crashTest_crashTestTaskList`: `extensions.load("gameplay_crashTest_crashTestTaskList")`, then the global `gameplay_crashTest_crashTestTaskList`

Feeds the UI's task list (SetTasklistHeader and SetTasklistTask events) for the crash test scenario. Each step becomes a 'goal'-type task identified by the player vehicle's id (plVehId); label and subtext are built from the objective, the impact speed and the damage conditions. The hooks mark the task as active, failed or completed.

## Notes

- The task id is stepData.plVehId: if several steps have the same player vehicle, they share the same id on the UI side.
- Label: 'Simple crash' -> "Crash into the marked target(s)"; 'Crash target vehicle into target area' -> "Redirect the target into the highlighted area"; other objective -> nil.
- Subtext: impact speed converted by translateVelocity (player's unit), followed by the damage text ("Minimize damage", "Maximize damage", "At least X damage", "Not more than X damage"). No space is inserted between the speed and the damage text.
- resetTasklist is defined but never called nor exported.
- clearTasklist and reset crash if setCrashTestDataAndInit has not been called (crashTestData nil).

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_crashTest_crashTestTaskList.finishedCurrentTask(stepData)` | Marks the step's task as completed (done = true). | 134 |
| `gameplay_crashTest_crashTestTaskList.onCrashTestStepFailed(stepData)` | Hook called when a step fails: marks the task as failed (fail = true). No effect if stepData is nil. *(internal)* *(hook)* | 118 |
| `gameplay_crashTest_crashTestTaskList.onExtensionUnloaded()` | Hook called when the extension unloads: removes all tasks from the UI. *(internal)* *(hook)* | 148 |
| `gameplay_crashTest_crashTestTaskList.onNewCrashTestStep(stepData)` | Hook called at the start of a step: sends the corresponding task as active (neither completed nor failed). *(internal)* *(hook)* | 104 |
| `gameplay_crashTest_crashTestTaskList.reset()` | Removes all tasks from the UI (clear = true for each step). | 152 |
| `gameplay_crashTest_crashTestTaskList.setCrashTestDataAndInit(crashTestData_)` | Stores the step list, displays the "Crash analysis steps" header and creates the first task (inactive). | 97 |

### Parameter details

#### `gameplay_crashTest_crashTestTaskList.finishedCurrentTask(stepData)`

Marks the step's task as completed (done = true).

- `stepData` (*table*) : Step data.

#### `gameplay_crashTest_crashTestTaskList.onCrashTestStepFailed(stepData)`

Hook called when a step fails: marks the task as failed (fail = true). No effect if stepData is nil.

- `stepData` (*table|nil*) : Step data.

#### `gameplay_crashTest_crashTestTaskList.onNewCrashTestStep(stepData)`

Hook called at the start of a step: sends the corresponding task as active (neither completed nor failed).

- `stepData` (*table*) : Step data.

#### `gameplay_crashTest_crashTestTaskList.setCrashTestDataAndInit(crashTestData_)`

Stores the step list, displays the "Crash analysis steps" header and creates the first task (inactive).

- `crashTestData_` (*table<integer, table>*) : List of the crash test's step data.

**UI events (guihooks.trigger):** `SetTasklistHeader`, `SetTasklistTask`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/crashTest/crashTestTaskList.lua`.*
