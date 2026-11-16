---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/tutorial.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Career tutorial, in 9 steps (01enterVehicle to 09spmSignup). This module is a thin layer over gameplay_tutorial_runtime: it provides the step order, the step extension prefix (career_modules_tutorial_step<id>), the initial prefabs and the end action, and it saves progress in <profile>/career/tutorialState.json.
--- Access: extension `career_modules_tutorial`: `extensions.load("career_modules_tutorial")`, then the global `career_modules_tutorial`
---@class career_modules_tutorial
---@field dependencies string[] gameplay_tutorial_runtime, _setup, _markers, _damageTracker, _bounds.
---@field sharedTutorialData table Data shared between steps, from gameplay_tutorial_runtime.
career_modules_tutorial = {}

--- Directly activates a step.
---Source: lua/ge/extensions/career/modules/tutorial.lua:164
---@param stepId string Step id.
---@return boolean  Success.
function career_modules_tutorial.activateStep(stepId) end

--- Moves to the next step.
---Source: lua/ge/extensions/career/modules/tutorial.lua:180
---@return boolean  Success.
function career_modules_tutorial.advanceToNextStep() end

--- Marks a step as completed.
---Source: lua/ge/extensions/career/modules/tutorial.lua:172
---@param stepId string Step id.
---@return boolean  Success.
function career_modules_tutorial.completeStep(stepId) end

--- Ends the tutorial (triggers the configured end action).
---Source: lua/ge/extensions/career/modules/tutorial.lua:188
---@return boolean  Success.
function career_modules_tutorial.endTutorial() end

--- Returns the completed steps.
---Source: lua/ge/extensions/career/modules/tutorial.lua:204
---@return table  completedSteps from the runtime (empty if none).
function career_modules_tutorial.getCompletedSteps() end

--- Returns the id of the current step.
---Source: lua/ge/extensions/career/modules/tutorial.lua:144
---@return string|nil  E.g. "03basicManeuvers".
function career_modules_tutorial.getCurrentStep() end

--- Returns the step id at a given index (starting from 1).
---Source: lua/ge/extensions/career/modules/tutorial.lua:152
---@param index integer Index in the step order.
---@return string|nil  Step id.
function career_modules_tutorial.getStepIdByIndex(index) end

--- Returns the ordered list of step ids.
---Source: lua/ge/extensions/career/modules/tutorial.lua:148
---@return string[]  The 9 steps.
function career_modules_tutorial.getStepOrder() end

--- Indicates whether the tutorial is in progress.
---Source: lua/ge/extensions/career/modules/tutorial.lua:140
---@return boolean  Runtime result.
function career_modules_tutorial.isActive() end

--- Hook called when the career becomes active; starts the tutorial if enabled.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial.lua:132
---@return boolean|nil  false if the tutorial is disabled.
function career_modules_tutorial.onCareerActive() end

--- Load hook: configures the runtime, reads tutorialState.json of the current profile and sends the progress to the runtime.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial.lua:94
function career_modules_tutorial.onExtensionLoaded() end

--- Unload hook: stops the runtime.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial.lua:120
function career_modules_tutorial.onExtensionUnloaded() end

--- During the tutorial, adds the "garage" point (tutorial_apm_parking) to the POI list on the garageExteriorPark parking spot, with icon, name and big map thumbnail.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial.lua:209
---@param elements table POI list to fill (table.insert).
function career_modules_tutorial.onGetRawPoiListForTutorial(elements) end

--- Pre-render hook: relays to the runtime.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial.lua:200
---@param dtReal number Real time delta (s).
---@param dtSim number Simulation time delta (s).
---@param dtRaw number Raw delta (s).
function career_modules_tutorial.onPreRender(dtReal, dtSim, dtRaw) end

--- Profile save hook: writes the progress to tutorialState.json.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial.lua:126
---@param currentSavePath string Profile save folder.
function career_modules_tutorial.onSaveCurrentProfile(currentSavePath) end

--- Update hook: relays to the runtime.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial.lua:196
---@param dtReal number Real time delta (s).
---@param dtSim number Simulation time delta (s).
---@param dtRaw number Raw delta (s).
function career_modules_tutorial.onUpdate(dtReal, dtSim, dtRaw) end

--- Starts the tutorial via the runtime.
---Source: lua/ge/extensions/career/modules/tutorial.lua:156
---@return boolean  Success.
function career_modules_tutorial.start() end

