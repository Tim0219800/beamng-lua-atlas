---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/tutorial/step01enterVehicle.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Career tutorial step 1 ("enterVehicle"): the player gets into the tutorial vehicle, learns the basic controls (accelerate, brake, steer, objectives validated at 0.75 / 0.75 / 0.5 of the input value), chooses their gearbox mode via a driving aids popup, then step 02moveOff is activated. Works in phases: waitVehicleSetup, getInCar, waitBasicControlsPopup, controls, shiftMode, waitBeginFirstChallenge. Extension loaded by gameplay_tutorial_runtime (prefix career_modules_tutorial_step).
--- Access: extension `career_modules_tutorial_step01enterVehicle`: `extensions.load("career_modules_tutorial_step01enterVehicle")`, then the global `career_modules_tutorial_step01enterVehicle`
---@class career_modules_tutorial_step01enterVehicle
career_modules_tutorial_step01enterVehicle = {}

--- Called at the end of the step or the tutorial: removes the out-of-bounds handler and the marker above the vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step01enterVehicle.lua:131
function career_modules_tutorial_step01enterVehicle.cleanup() end

--- Hook emitted when the player leaves the allowed zone: instant position reset only once at the start, then the step's standard reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step01enterVehicle.lua:59
function career_modules_tutorial_step01enterVehicle.onCareerTutorialLeftBounds() end

--- Adds a "Skip Step 1" button to the debug menu (puts the player in the driver's seat, starts the engine, moves to the next step).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step01enterVehicle.lua:226
---@param im table ui_imgui table.
function career_modules_tutorial_step01enterVehicle.onDebugMenu(im) end

--- Hook emitted when an intro popup closes. Depending on the id: v2/approachVehicle displays the "get in the car" objective and a marker; v2/basicControls enables input tracking and starts the engine; v2/beginFirstChallenge activates step 02moveOff.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step01enterVehicle.lua:142
---@param id string Popup id (e.g. "v2/basicControls").
function career_modules_tutorial_step01enterVehicle.onIntroPopupCareerClosed(id) end

--- Called from GearboxSelect.vue when the player confirms the gearbox mode (shiftMode phase): applies setGearboxMode on the vehicle then displays the beginFirstChallenge popup.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step01enterVehicle.lua:183
---@param data table Table with the mode field (chosen gearbox mode).
function career_modules_tutorial_step01enterVehicle.onShiftModeSelectedViaPopup(data) end

--- Called every frame during the step. Handles the phases: launches the introduction popups, detects that the player got in (gameplay_walk), then validates the throttle/brake/steer objectives and opens the driving aids popup.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step01enterVehicle.lua:70
---@param dtReal number Real time delta (s).
---@param dtSim number Simulation delta (s).
---@param dtRaw number Raw delta (s).
function career_modules_tutorial_step01enterVehicle.onUpdate(dtReal, dtSim, dtRaw) end

--- Called when the step is activated: resets the objectives, enters the waitVehicleSetup phase, installs the out-of-bounds handler (return to the parking start), activates the evalZone zone, damage tracking, the tutorial's recovery settings and displays the tasks app.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step01enterVehicle.lua:36
---@param stepData any Step data provided by the runtime (unused).
function career_modules_tutorial_step01enterVehicle.setup(stepData) end

