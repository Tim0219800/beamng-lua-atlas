---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/tutorial/step08driveToGarage.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Career tutorial step 8 ("driveToGarage"): the player drives to the garage, parks in the garageExteriorPark spot (stationary 1 s, within 25 m to trigger the parking phase), then gets out of the vehicle (walking mode). Phases: driveToGarage, parkAtGarage, hopOut, waitArrivalPopups. Two arrival popups (v2/garageArrivalIntro1 and 2) conclude the step, then the guidance leads to the garageInteriorWalkStart point.
--- Access: extension `career_modules_tutorial_step08driveToGarage`: `extensions.load("career_modules_tutorial_step08driveToGarage")`, then the global `career_modules_tutorial_step08driveToGarage`
---@class career_modules_tutorial_step08driveToGarage
career_modules_tutorial_step08driveToGarage = {}

--- Removes the zone reset, unlocks walking, clears the tasks and deletes the parking visuals.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step08driveToGarage.lua:325
function career_modules_tutorial_step08driveToGarage.cleanup() end

--- Out-of-bounds hook: starts the step's out-of-bounds reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step08driveToGarage.lua:258
function career_modules_tutorial_step08driveToGarage.onCareerTutorialLeftBounds() end

--- Displays the phase and a "Skip Step 8" button (teleports to the garage, switches to walking mode, advances).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step08driveToGarage.lua:333
---@param im table ui_imgui table.
function career_modules_tutorial_step08driveToGarage.onDebugMenu(im) end

--- Popup close hook: when v2/garageArrivalIntro2 closes (waitArrivalPopups phase), draws the route to the garage interior and schedules the step advance after 1 s.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step08driveToGarage.lua:262
---@param id string Popup id.
function career_modules_tutorial_step08driveToGarage.onIntroPopupCareerClosed(id) end

--- Called every frame: updates the respawn checkpoint, handles the driving / parking / exiting the vehicle phases.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step08driveToGarage.lua:272
---@param dtReal number Real time delta (s).
---@param dtSim number Simulation delta (s).
---@param dtRaw number Raw delta (s).
function career_modules_tutorial_step08driveToGarage.onUpdate(dtReal, dtSim, dtRaw) end

--- Called on activation: stops the drag, finds the player vehicle, the garage spots and zones, installs zones and reset, allows walking and entering the vehicle, creates the marker and displays the objective.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step08driveToGarage.lua:181
---@param stepData any Step data (unused).
function career_modules_tutorial_step08driveToGarage.setup(stepData) end

