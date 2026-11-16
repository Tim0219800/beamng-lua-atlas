---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/tutorial/step06dragStripBasics.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Career tutorial step 6 ("dragStripBasics"): learning a drag race. The player lines up (staging), waits for the countdown, launches, reaches the finish line, then a timeslip popup concludes the step. Also handles disqualifications (false start or leaving the lane), coaching popups that pause the game (simTimeAuthority) and a slow motion at the end of the countdown. The hooks dragRaceStarted, dragRaceEndLineReached, onDragRacersSetup and onRacerPhaseTransition are emitted by gameplay_drag_*.
--- Access: extension `career_modules_tutorial_step06dragStripBasics`: `extensions.load("career_modules_tutorial_step06dragStripBasics")`, then the global `career_modules_tutorial_step06dragStripBasics`
---@class career_modules_tutorial_step06dragStripBasics
career_modules_tutorial_step06dragStripBasics = {}

--- Removes the zone reset, lifts the pause, resets simulation time to 1 and deletes markers, guidance and tasks.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step06dragStripBasics.lua:609
function career_modules_tutorial_step06dragStripBasics.cleanup() end

--- Hook emitted when the vehicle reaches the finish: starts the disqualification flow if the driver is disqualified, otherwise validates the finish objective and opens the timeslip popup after 2 s.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step06dragStripBasics.lua:506
---@param vehId integer Vehicle id.
function career_modules_tutorial_step06dragStripBasics.dragRaceEndLineReached(vehId) end

--- Hook emitted at the actual start of the race: validates the "line up" and "launch" objectives.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step06dragStripBasics.lua:493
---@param vehId integer Vehicle id.
function career_modules_tutorial_step06dragStripBasics.dragRaceStarted(vehId) end

--- Out-of-bounds hook: starts the step's out-of-bounds reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step06dragStripBasics.lua:412
function career_modules_tutorial_step06dragStripBasics.onCareerTutorialLeftBounds() end

--- Displays the phase and the objectives state; "Skip Step 6" button (marks everything as done and advances).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step06dragStripBasics.lua:626
---@param im table ui_imgui table.
function career_modules_tutorial_step06dragStripBasics.onDebugMenu(im) end

--- Hook emitted when the racers are put back in place for a new attempt: validates the "return to staging" objective after a false start and restarts the attempt after 1 s.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step06dragStripBasics.lua:594
---@param data table Setup data (unused).
function career_modules_tutorial_step06dragStripBasics.onDragRacersSetup(data) end

--- Popup close hook: advances the state machine (welcome done -> displays the objectives; disqualification popup -> reset or return to staging; timeslip -> advances to the next step; coaching -> resumes from pause and possible slow motion).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step06dragStripBasics.lua:416
---@param id string Id of the closed popup.
function career_modules_tutorial_step06dragStripBasics.onIntroPopupCareerClosed(id) end

--- gameplay_drag hook: at the countdown phase, validates the "line up" objective and opens the countdown coaching popup (once).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step06dragStripBasics.lua:477
---@param vehId integer Vehicle id.
---@param oldPhase integer Old phase.
---@param newPhase integer New phase (2 = countdown).
---@param newPhaseName string Name of the new phase ("countdown").
function career_modules_tutorial_step06dragStripBasics.onRacerPhaseTransition(vehId, oldPhase, newPhase, newPhaseName) end

--- Called every frame: handles the start slow motion, triggers the approach popup within 15 m of the start line, hides the line marker within 5 m, and detects disqualifications.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step06dragStripBasics.lua:543
---@param dtReal number Real time delta (s).
---@param dtSim number Simulation delta (s).
---@param dtRaw number Raw delta (s).
function career_modules_tutorial_step06dragStripBasics.onUpdate(dtReal, dtSim, dtRaw) end

--- Called on activation: resets the state, activates the drivingToDragBounds and dragStripBounds zones, finds the beforeDragStrip and dragStartLine spots, displays the v2/dragStripWelcome welcome popup, switches the prefabs and creates the direction markers (dragGuide1 to 3).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step06dragStripBasics.lua:359
---@param stepData any Step data (unused).
function career_modules_tutorial_step06dragStripBasics.setup(stepData) end

