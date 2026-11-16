---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/tutorial/runtime.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Generic tutorial engine: it chains "steps" that are each a separate Lua extension (prefix + step identifier). It loads/unloads the current step's extension, stores progress (completed steps, current step) and relays onUpdate/onPreRender to the active step, to damage tracking, to the markers and to the zone bounds system. A modder uses it by calling configure() then start().
--- Access: extension `gameplay_tutorial_runtime`: `extensions.load("gameplay_tutorial_runtime")`, then the global `gameplay_tutorial_runtime`
---@class gameplay_tutorial_runtime
---@field dependencies string[] Extensions loaded before this one: gameplay_tutorial_setup, _markers, _damageTracker and _bounds.
---@field sharedTutorialData table Shared empty table that steps can use to exchange data.
gameplay_tutorial_runtime = {}

--- Cleans up and unloads the previous step, loads the new step's extension, updates progress and calls its setup({}).
---Source: lua/ge/extensions/gameplay/tutorial/runtime.lua:150
---@param stepId string|integer Step identifier present in stepOrder.
---@return boolean  false if inactive, invalid id or extension not found.
function gameplay_tutorial_runtime.activateStep(stepId) end

--- Completes the current step then activates the next one; if there are none left, calls endTutorial().
---Source: lua/ge/extensions/gameplay/tutorial/runtime.lua:200
---@return boolean  false if inactive or if the current step is not in stepOrder.
function gameplay_tutorial_runtime.advanceToNextStep() end

--- Marks a step as completed in completedSteps.
---Source: lua/ge/extensions/gameplay/tutorial/runtime.lua:192
---@param stepId string Step identifier.
---@return boolean  false if the tutorial is not active.
function gameplay_tutorial_runtime.completeStep(stepId) end

--- Sets the configuration: step order, step extension prefix, initial prefabs, loading of sites and blocked actions at start, onStarted/onEnded callbacks. Also wires the getters of the bounds and markers modules (tutorial vehicle).
---Source: lua/ge/extensions/gameplay/tutorial/runtime.lua:57
---@param opts table Optional fields: stepOrder (list of ids), stepExtensionPrefix, initialPrefabs, loadSitesOnStart, setupBlockedActionsOnStart, onStarted, onEnded.
function gameplay_tutorial_runtime.configure(opts) end

--- Normal end: cleanup of the step, markers, damage tracking, bounds and setup; sets isCompleted to true, clears the UI task list (ClearTasklist) and calls onEnded.
---Source: lua/ge/extensions/gameplay/tutorial/runtime.lua:227
---@return boolean  false if the tutorial was not active.
function gameplay_tutorial_runtime.endTutorial() end

--- Identifier of the current step.
---Source: lua/ge/extensions/gameplay/tutorial/runtime.lua:103
---@return string|nil  nil if no step is active.
function gameplay_tutorial_runtime.getCurrentStep() end

--- Returns the internal progress table (not a copy).
---Source: lua/ge/extensions/gameplay/tutorial/runtime.lua:95
---@return table  {currentStepId, completedSteps, isCompleted}
function gameplay_tutorial_runtime.getProgressData() end

--- Step identifier at a given position in the configured order.
---Source: lua/ge/extensions/gameplay/tutorial/runtime.lua:111
---@param index integer Position starting at 1.
---@return string|nil  nil if out of bounds.
function gameplay_tutorial_runtime.getStepIdByIndex(index) end

--- Returns the configured ordered list of step identifiers.
---Source: lua/ge/extensions/gameplay/tutorial/runtime.lua:107
---@return string[]  List of ids.
function gameplay_tutorial_runtime.getStepOrder() end

--- Indicates whether the tutorial is in progress.
---Source: lua/ge/extensions/gameplay/tutorial/runtime.lua:99
---@return boolean  true between start() and endTutorial()/stop().
function gameplay_tutorial_runtime.isActive() end

--- Hook called before rendering: relays to the active step (dtReal, dtSim only) and to the bounds module.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/tutorial/runtime.lua:293
---@param dtReal number Real time delta (s).
---@param dtSim number Simulated time delta (s).
---@param dtRaw number Raw time delta (s).
function gameplay_tutorial_runtime.onPreRender(dtReal, dtSim, dtRaw) end

--- Hook called every frame by the extension engine: passes the tutorial vehicle id to the damageTracker, relays to the active step, updates damage, markers and bounds.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/tutorial/runtime.lua:277
---@param dtReal number Real time delta (s).
---@param dtSim number Simulated time delta (s).
---@param dtRaw number Raw time delta (s).
function gameplay_tutorial_runtime.onUpdate(dtReal, dtSim, dtRaw) end

--- Replaces the progress (current step, completed steps, completed flag), typically after loading a save.
---Source: lua/ge/extensions/gameplay/tutorial/runtime.lua:88
---@param data table Table with currentStepId, completedSteps (table id -> true) and isCompleted.
function gameplay_tutorial_runtime.setProgressData(data) end

--- Starts the tutorial: activates the initial prefabs, loads the sites, installs the blocked actions, then activates the stored step (or the first one if invalid). Calls onStarted on success.
---Source: lua/ge/extensions/gameplay/tutorial/runtime.lua:115
---@return boolean  false if already active, if stepOrder is empty or if the step could not be activated.
function gameplay_tutorial_runtime.start() end

--- Unloads the active step without marking the tutorial as completed and without cleaning up the other modules.
---Source: lua/ge/extensions/gameplay/tutorial/runtime.lua:262
function gameplay_tutorial_runtime.stop() end

