---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Career tutorial step 4 ("timeTrial"): an intro popup launches the time trial mission west_coast_usa/timeTrial/tutorialSimple, with ground guidance (core_groundMarkers) built from the course's next pathnodes. At the end, a popup offers an optional challenge (tutorialAdvanced) or moving on; the step advances at the end of the advanced mission or if the player chooses something else. Phases: waitIntro, simpleMission, waitChoicePopup, waitPostSimplePopupClose, waitChoiceSelection, advancedMission. Activates the timeTrialBounds bounds zone.
--- Access: extension `career_modules_tutorial_step04timeTrial`: `extensions.load("career_modules_tutorial_step04timeTrial")`, then the global `career_modules_tutorial_step04timeTrial`
---@class career_modules_tutorial_step04timeTrial
career_modules_tutorial_step04timeTrial = {}

--- Called at the end of the step: removes the zone reset, clears the guidance and stops the tutorial mission if it is in the foreground.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua:280
function career_modules_tutorial_step04timeTrial.cleanup() end

--- Hook emitted by the mission manager. On "started" of the simple mission, remembers the race; on "stopped", moves to the assessment popup (simple mission) or advances the step (advanced mission).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua:185
---@param state string Mission state ("started", "stopped"...).
---@param mission table Mission concerned (id, race).
function career_modules_tutorial_step04timeTrial.onAnyMissionChanged(state, mission) end

--- Called from OptionalChallengeSelect.vue when the player chooses: "advancedTimeTrial" starts the advanced mission, any other choice deactivates the vehicle and moves to the next step.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua:257
---@param choice string Player's choice ("advancedTimeTrial" or other).
function career_modules_tutorial_step04timeTrial.onCareerTutorialAdvancedOrDragSelection(choice) end

--- Out-of-bounds hook: starts the step's out-of-bounds reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua:276
function career_modules_tutorial_step04timeTrial.onCareerTutorialLeftBounds() end

--- Hook emitted when the player has stayed out of the zone too long: displays a warning and restarts the current mission.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua:211
function career_modules_tutorial_step04timeTrial.onCareerTutorialOutOfBoundsTimedOut() end

--- "Skip Step 4" button: stops the mission, deactivates the vehicle and advances.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua:298
---@param im table ui_imgui table.
function career_modules_tutorial_step04timeTrial.onDebugMenu(im) end

--- Popup close hook. v2/simpleTimeTrial: starts the simple mission and, after 0.5 s, switches the track prefabs (tutorialTrackOpen). v2/timeTrialAssessmentComplete: opens the optional challenge choice popup.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua:146
---@param id string Popup id.
function career_modules_tutorial_step04timeTrial.onIntroPopupCareerClosed(id) end

--- Hook emitted at each pathnode reached: updates the guidance for the simple tutorial race.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua:234
---@param data table Table with the race field.
function career_modules_tutorial_step04timeTrial.onRacePathnodeReached(data) end

--- Race start hook: if it is the simple tutorial race, remembers it and draws the guidance.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua:224
---@param data table Table with the race field.
function career_modules_tutorial_step04timeTrial.onRaceStarted(data) end

--- Screen fade hook: when the state is 3 during waitChoicePopup, restores the "career" game state and opens the assessment or choice popup.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua:242
---@param state integer Fade state (3 = handled here).
function career_modules_tutorial_step04timeTrial.onScreenFadeState(state) end

--- Called every frame: during the simple mission, updates the guidance path toward the next pathnodes (or toward the finish).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua:171
---@param dtReal number Real time delta (s).
---@param dtSim number Simulation delta (s).
---@param dtRaw number Raw delta (s).
function career_modules_tutorial_step04timeTrial.onUpdate(dtReal, dtSim, dtRaw) end

--- Called on activation: activates the timeTrialBounds zone, resets the states, finds the simpleTimeTrialFinish spot, puts the player back in the tutorial vehicle and opens the v2/simpleTimeTrial popup.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua:124
---@param stepData any Step data (unused).
function career_modules_tutorial_step04timeTrial.setup(stepData) end

