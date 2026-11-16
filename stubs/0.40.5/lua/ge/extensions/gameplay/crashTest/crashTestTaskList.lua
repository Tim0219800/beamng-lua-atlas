---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crashTest/crashTestTaskList.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Feeds the UI's task list (SetTasklistHeader and SetTasklistTask events) for the crash test scenario. Each step becomes a 'goal'-type task identified by the player vehicle's id (plVehId); label and subtext are built from the objective, the impact speed and the damage conditions. The hooks mark the task as active, failed or completed.
--- Access: extension `gameplay_crashTest_crashTestTaskList`: `extensions.load("gameplay_crashTest_crashTestTaskList")`, then the global `gameplay_crashTest_crashTestTaskList`
---@class gameplay_crashTest_crashTestTaskList
gameplay_crashTest_crashTestTaskList = {}

--- Marks the step's task as completed (done = true).
---Source: lua/ge/extensions/gameplay/crashTest/crashTestTaskList.lua:134
---@param stepData table Step data.
function gameplay_crashTest_crashTestTaskList.finishedCurrentTask(stepData) end

--- Hook called when a step fails: marks the task as failed (fail = true). No effect if stepData is nil.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crashTest/crashTestTaskList.lua:118
---@param stepData table|nil Step data.
function gameplay_crashTest_crashTestTaskList.onCrashTestStepFailed(stepData) end

--- Hook called when the extension unloads: removes all tasks from the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crashTest/crashTestTaskList.lua:148
function gameplay_crashTest_crashTestTaskList.onExtensionUnloaded() end

--- Hook called at the start of a step: sends the corresponding task as active (neither completed nor failed).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crashTest/crashTestTaskList.lua:104
---@param stepData table Step data.
function gameplay_crashTest_crashTestTaskList.onNewCrashTestStep(stepData) end

--- Removes all tasks from the UI (clear = true for each step).
---Source: lua/ge/extensions/gameplay/crashTest/crashTestTaskList.lua:152
function gameplay_crashTest_crashTestTaskList.reset() end

--- Stores the step list, displays the "Crash analysis steps" header and creates the first task (inactive).
---Source: lua/ge/extensions/gameplay/crashTest/crashTestTaskList.lua:97
---@param crashTestData_ table<integer, table> List of the crash test's step data.
function gameplay_crashTest_crashTestTaskList.setCrashTestDataAndInit(crashTestData_) end

