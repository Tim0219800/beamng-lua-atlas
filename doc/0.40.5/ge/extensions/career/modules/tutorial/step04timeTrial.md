# `career_modules_tutorial_step04timeTrial`

*File: `lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua` · VM: Game Engine (GE) · 315 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_tutorial_step04timeTrial`: `extensions.load("career_modules_tutorial_step04timeTrial")`, then the global `career_modules_tutorial_step04timeTrial`

Career tutorial step 4 ("timeTrial"): an intro popup launches the time trial mission west_coast_usa/timeTrial/tutorialSimple, with ground guidance (core_groundMarkers) built from the course's next pathnodes. At the end, a popup offers an optional challenge (tutorialAdvanced) or moving on; the step advances at the end of the advanced mission or if the player chooses something else. Phases: waitIntro, simpleMission, waitChoicePopup, waitPostSimplePopupClose, waitChoiceSelection, advancedMission. Activates the timeTrialBounds bounds zone.

## Notes

- If the player stays out of bounds too long (onCareerTutorialOutOfBoundsTimedOut), the current mission is restarted (core_recoveryPrompt.buttonPressed("restartMission")) with a message.
- At the end of the step, the tutorial vehicle is deactivated (setActive(0)); it is reactivated at the start of the step.
- At the end of the advanced mission, the code writes career_modules_tutorial.playedAdvancedTimeTrial = true; this field is not declared in tutorial.lua (dynamically added field).
- If the advanced mission is not found, an error is logged and the step advances anyway.
- All tracking hooks ignore events if the current step is not 04timeTrial.

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_tutorial_step04timeTrial.cleanup()` | Called at the end of the step: removes the zone reset, clears the guidance and stops the tutorial mission if it is in the foreground. *(internal)* | 280 |
| `career_modules_tutorial_step04timeTrial.onAnyMissionChanged(state, mission)` | Hook emitted by the mission manager. On "started" of the simple mission, remembers the race; on "stopped", moves to the assessment popup (simple mission) or advances the step (advanced mission). *(internal)* *(hook)* | 185 |
| `career_modules_tutorial_step04timeTrial.onCareerTutorialAdvancedOrDragSelection(choice)` | Called from OptionalChallengeSelect.vue when the player chooses: "advancedTimeTrial" starts the advanced mission, any other choice deactivates the vehicle and moves to the next step. *(internal)* *(hook)* | 257 |
| `career_modules_tutorial_step04timeTrial.onCareerTutorialLeftBounds()` | Out-of-bounds hook: starts the step's out-of-bounds reset. *(internal)* *(hook)* | 276 |
| `career_modules_tutorial_step04timeTrial.onCareerTutorialOutOfBoundsTimedOut()` | Hook emitted when the player has stayed out of the zone too long: displays a warning and restarts the current mission. *(internal)* *(hook)* | 211 |
| `career_modules_tutorial_step04timeTrial.onDebugMenu(im)` | "Skip Step 4" button: stops the mission, deactivates the vehicle and advances. *(internal)* *(hook)* | 298 |
| `career_modules_tutorial_step04timeTrial.onIntroPopupCareerClosed(id)` | Popup close hook. v2/simpleTimeTrial: starts the simple mission and, after 0.5 s, switches the track prefabs (tutorialTrackOpen). v2/timeTrialAssessmentComplete: opens the optional challenge choice popup. *(internal)* *(hook)* | 146 |
| `career_modules_tutorial_step04timeTrial.onRacePathnodeReached(data)` | Hook emitted at each pathnode reached: updates the guidance for the simple tutorial race. *(internal)* *(hook)* | 234 |
| `career_modules_tutorial_step04timeTrial.onRaceStarted(data)` | Race start hook: if it is the simple tutorial race, remembers it and draws the guidance. *(internal)* *(hook)* | 224 |
| `career_modules_tutorial_step04timeTrial.onScreenFadeState(state)` | Screen fade hook: when the state is 3 during waitChoicePopup, restores the "career" game state and opens the assessment or choice popup. *(internal)* *(hook)* | 242 |
| `career_modules_tutorial_step04timeTrial.onUpdate(dtReal, dtSim, dtRaw)` | Called every frame: during the simple mission, updates the guidance path toward the next pathnodes (or toward the finish). *(internal)* *(hook)* | 171 |
| `career_modules_tutorial_step04timeTrial.setup(stepData)` | Called on activation: activates the timeTrialBounds zone, resets the states, finds the simpleTimeTrialFinish spot, puts the player back in the tutorial vehicle and opens the v2/simpleTimeTrial popup. *(internal)* | 124 |

### Parameter details

#### `career_modules_tutorial_step04timeTrial.onAnyMissionChanged(state, mission)`

Hook emitted by the mission manager. On "started" of the simple mission, remembers the race; on "stopped", moves to the assessment popup (simple mission) or advances the step (advanced mission).

- `state` (*string*) : Mission state ("started", "stopped"...).
- `mission` (*table*) : Mission concerned (id, race).

#### `career_modules_tutorial_step04timeTrial.onCareerTutorialAdvancedOrDragSelection(choice)`

Called from OptionalChallengeSelect.vue when the player chooses: "advancedTimeTrial" starts the advanced mission, any other choice deactivates the vehicle and moves to the next step.

- `choice` (*string*) : Player's choice ("advancedTimeTrial" or other).

#### `career_modules_tutorial_step04timeTrial.onDebugMenu(im)`

"Skip Step 4" button: stops the mission, deactivates the vehicle and advances.

- `im` (*table*) : ui_imgui table.

#### `career_modules_tutorial_step04timeTrial.onIntroPopupCareerClosed(id)`

Popup close hook. v2/simpleTimeTrial: starts the simple mission and, after 0.5 s, switches the track prefabs (tutorialTrackOpen). v2/timeTrialAssessmentComplete: opens the optional challenge choice popup.

- `id` (*string*) : Popup id.

#### `career_modules_tutorial_step04timeTrial.onRacePathnodeReached(data)`

Hook emitted at each pathnode reached: updates the guidance for the simple tutorial race.

- `data` (*table*) : Table with the race field.

#### `career_modules_tutorial_step04timeTrial.onRaceStarted(data)`

Race start hook: if it is the simple tutorial race, remembers it and draws the guidance.

- `data` (*table*) : Table with the race field.

#### `career_modules_tutorial_step04timeTrial.onScreenFadeState(state)`

Screen fade hook: when the state is 3 during waitChoicePopup, restores the "career" game state and opens the assessment or choice popup.

- `state` (*integer*) : Fade state (3 = handled here).

#### `career_modules_tutorial_step04timeTrial.onUpdate(dtReal, dtSim, dtRaw)`

Called every frame: during the simple mission, updates the guidance path toward the next pathnodes (or toward the finish).

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulation delta (s).
- `dtRaw` (*number*) : Raw delta (s).

#### `career_modules_tutorial_step04timeTrial.setup(stepData)`

Called on activation: activates the timeTrialBounds zone, resets the states, finds the simpleTimeTrialFinish spot, puts the player back in the tutorial vehicle and opens the v2/simpleTimeTrial popup.

- `stepData` (*any*) : Step data (unused).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua`.*
