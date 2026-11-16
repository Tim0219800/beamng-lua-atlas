---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/tutorial/step02moveOff.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Career tutorial step 2 ("moveOff"): learning to move off according to the gearbox mode set in step 1. Three modes (inferred from the gearboxMode setting and autoClutch): arcade, realistic_clutch (engage 1st gear then accelerate) and realistic_no_clutch (manual clutch, with recovery on engine stall). The step ends when the vehicle has moved at least 3 m, then activates 03basicManeuvers after 1 s.
--- Access: extension `career_modules_tutorial_step02moveOff`: `extensions.load("career_modules_tutorial_step02moveOff")`, then the global `career_modules_tutorial_step02moveOff`
---@class career_modules_tutorial_step02moveOff
career_modules_tutorial_step02moveOff = {}

--- Removes the out-of-bounds handler, unregisters the vehicle notifications and clears the task list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step02moveOff.lua:229
function career_modules_tutorial_step02moveOff.cleanup() end

--- Out-of-bounds hook: starts the step's out-of-bounds reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step02moveOff.lua:149
function career_modules_tutorial_step02moveOff.onCareerTutorialLeftBounds() end

--- Displays the current mode and a button to skip the step (activates 03basicManeuvers).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step02moveOff.lua:252
---@param im table ui_imgui table.
function career_modules_tutorial_step02moveOff.onDebugMenu(im) end

--- Called every frame: reads the cached vehicle inputs, handles stalling, validates the objectives and advances to step 03 when the 3 m distance is reached.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step02moveOff.lua:153
---@param dtReal number Real time delta (s).
---@param dtSim number Simulation delta (s).
---@param dtRaw number Raw delta (s).
function career_modules_tutorial_step02moveOff.onUpdate(dtReal, dtSim, dtRaw) end

--- Called on activation: resets the state, activates the evalZone zone, registers the throttle_input, clutch, gearIndex, ignitionLevel notifications, reads the gearbox behavior (mainController/gearboxMode), chooses the mode, unlocks the gear change actions, unfreezes the vehicle and builds the task list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step02moveOff.lua:93
---@param stepData any Step data (unused).
function career_modules_tutorial_step02moveOff.setup(stepData) end

