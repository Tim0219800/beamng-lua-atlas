---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/tutorial/step05driveToDragStrip.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Career tutorial step 5 ("driveToDragStrip"): the player drives to the drag strip, with ground guidance and a marker, then parks the vehicle in the beforeDragStrip spot (stationary 1 s). Phases: waitPopup, driveToStrip, parkInStaging (triggered within 25 m of the spot). Then step 06dragStripBasics is activated. Activates the drivingToDragBounds and parkingBounds zones.
--- Access: extension `career_modules_tutorial_step05driveToDragStrip`: `extensions.load("career_modules_tutorial_step05driveToDragStrip")`, then the global `career_modules_tutorial_step05driveToDragStrip`
---@class career_modules_tutorial_step05driveToDragStrip
career_modules_tutorial_step05driveToDragStrip = {}

--- Removes the zone reset, the guidance, the task list and the parking spot visuals.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step05driveToDragStrip.lua:230
function career_modules_tutorial_step05driveToDragStrip.cleanup() end

--- Out-of-bounds hook: starts the step's out-of-bounds reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step05driveToDragStrip.lua:192
function career_modules_tutorial_step05driveToDragStrip.onCareerTutorialLeftBounds() end

--- Displays the phase and a "Skip Step 5" button (teleports the vehicle to beforeDragStrip then activates step 6).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step05driveToDragStrip.lua:237
---@param im table ui_imgui table.
function career_modules_tutorial_step05driveToDragStrip.onDebugMenu(im) end

--- Popup close hook: when v2/driveToDragStrip closes, moves to the driveToStrip phase and displays the objective.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step05driveToDragStrip.lua:180
---@param id string Popup id.
function career_modules_tutorial_step05driveToDragStrip.onIntroPopupCareerClosed(id) end

--- Called every frame: tracks the distance traveled and the distance to the spot, moves to the parking phase and validates the parking objective before activating 06dragStripBasics (after 1 s).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step05driveToDragStrip.lua:196
---@param dtReal number Real time delta (s).
---@param dtSim number Simulation delta (s).
---@param dtRaw number Raw delta (s).
function career_modules_tutorial_step05driveToDragStrip.onUpdate(dtReal, dtSim, dtRaw) end

--- Called on activation: restores traffic, activates the zones, installs the out-of-bounds reset (return to simpleTimeTrialFinish), prepares the vehicle (ignition, unfreeze, player in the driver's seat), draws the guidance, creates the marker, displays the v2/driveToDragStrip popup and switches the prefabs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step05driveToDragStrip.lua:114
---@param stepData any Step data (unused).
function career_modules_tutorial_step05driveToDragStrip.setup(stepData) end

