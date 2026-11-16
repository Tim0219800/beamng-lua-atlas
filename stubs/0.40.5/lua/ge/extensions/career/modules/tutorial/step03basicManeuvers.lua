---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/tutorial/step03basicManeuvers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Career tutorial step 3 ("basicManeuvers"): the player drives freely (message about changing camera) then must park the vehicle in the parking spot named simpleCourseStart (marker + ground decal). The objective is validated when the vehicle stays stationary in the spot for 1 s (gameplay_tutorial_markers.checkParkGoalWithStationaryTime); the next step is then activated after 1.5 s.
--- Access: extension `career_modules_tutorial_step03basicManeuvers`: `extensions.load("career_modules_tutorial_step03basicManeuvers")`, then the global `career_modules_tutorial_step03basicManeuvers`
---@class career_modules_tutorial_step03basicManeuvers
career_modules_tutorial_step03basicManeuvers = {}

--- Called at the end of the step: removes the out-of-bounds reset, clears the task list, deletes the marker and decal.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step03basicManeuvers.lua:125
function career_modules_tutorial_step03basicManeuvers.cleanup() end

--- Out-of-bounds hook: starts the step's out-of-bounds reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step03basicManeuvers.lua:107
function career_modules_tutorial_step03basicManeuvers.onCareerTutorialLeftBounds() end

--- Displays the objectives state and a "Skip Step 3" button (teleports the vehicle to the spot and advances).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step03basicManeuvers.lua:164
---@param im table ui_imgui table.
function career_modules_tutorial_step03basicManeuvers.onDebugMenu(im) end

--- Called every frame: tests the parking objective; once validated, moves to the next step after 1.5 s.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step03basicManeuvers.lua:112
---@param dtReal number Real time delta (s).
---@param dtSim number Simulation delta (s).
---@param dtRaw number Raw delta (s).
function career_modules_tutorial_step03basicManeuvers.onUpdate(dtReal, dtSim, dtRaw) end

--- Called on activation: resets the objective, activates the evalZone zone, installs the out-of-bounds reset, then directly starts the parking phase (unlocks the gears, unfreezes the vehicle, creates the marker).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step03basicManeuvers.lua:89
---@param stepData any Step data (unused).
function career_modules_tutorial_step03basicManeuvers.setup(stepData) end

