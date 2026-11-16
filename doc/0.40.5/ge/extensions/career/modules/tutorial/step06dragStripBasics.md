# `career_modules_tutorial_step06dragStripBasics`

*File: `lua/ge/extensions/career/modules/tutorial/step06dragStripBasics.lua` · VM: Game Engine (GE) · 649 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_tutorial_step06dragStripBasics`: `extensions.load("career_modules_tutorial_step06dragStripBasics")`, then the global `career_modules_tutorial_step06dragStripBasics`

Career tutorial step 6 ("dragStripBasics"): learning a drag race. The player lines up (staging), waits for the countdown, launches, reaches the finish line, then a timeslip popup concludes the step. Also handles disqualifications (false start or leaving the lane), coaching popups that pause the game (simTimeAuthority) and a slow motion at the end of the countdown. The hooks dragRaceStarted, dragRaceEndLineReached, onDragRacersSetup and onRacerPhaseTransition are emitted by gameplay_drag_*.

## Notes

- Internal phases: waitIntroPopup, active, waitDqPopup, waitFalseStartRestage, waitTimeslipPopup.
- After 3 failures since the last reset, the coaching popups (approach, countdown) are allowed again.
- A false start disqualification leads to a "return to staging" objective; leaving the lane causes a reset with fade onto the dragStripResetSpot spot then a restart of the attempt (2.5 s wait).
- The race hooks only count if the current step is 06dragStripBasics, if the vehicle is the tutorial one and if the player is within the bounds.
- End-of-countdown slow motion: simulation time goes from 0.1 to 0.75 over 2 s (quadratic curve), then returns to 1.

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_tutorial_step06dragStripBasics.cleanup()` | Removes the zone reset, lifts the pause, resets simulation time to 1 and deletes markers, guidance and tasks. *(internal)* | 609 |
| `career_modules_tutorial_step06dragStripBasics.dragRaceEndLineReached(vehId)` | Hook emitted when the vehicle reaches the finish: starts the disqualification flow if the driver is disqualified, otherwise validates the finish objective and opens the timeslip popup after 2 s. *(internal)* | 506 |
| `career_modules_tutorial_step06dragStripBasics.dragRaceStarted(vehId)` | Hook emitted at the actual start of the race: validates the "line up" and "launch" objectives. *(internal)* | 493 |
| `career_modules_tutorial_step06dragStripBasics.onCareerTutorialLeftBounds()` | Out-of-bounds hook: starts the step's out-of-bounds reset. *(internal)* *(hook)* | 412 |
| `career_modules_tutorial_step06dragStripBasics.onDebugMenu(im)` | Displays the phase and the objectives state; "Skip Step 6" button (marks everything as done and advances). *(internal)* *(hook)* | 626 |
| `career_modules_tutorial_step06dragStripBasics.onDragRacersSetup(data)` | Hook emitted when the racers are put back in place for a new attempt: validates the "return to staging" objective after a false start and restarts the attempt after 1 s. *(internal)* *(hook)* | 594 |
| `career_modules_tutorial_step06dragStripBasics.onIntroPopupCareerClosed(id)` | Popup close hook: advances the state machine (welcome done -> displays the objectives; disqualification popup -> reset or return to staging; timeslip -> advances to the next step; coaching -> resumes from pause and possible slow motion). *(internal)* *(hook)* | 416 |
| `career_modules_tutorial_step06dragStripBasics.onRacerPhaseTransition(vehId, oldPhase, newPhase, newPhaseName)` | gameplay_drag hook: at the countdown phase, validates the "line up" objective and opens the countdown coaching popup (once). *(internal)* *(hook)* | 477 |
| `career_modules_tutorial_step06dragStripBasics.onUpdate(dtReal, dtSim, dtRaw)` | Called every frame: handles the start slow motion, triggers the approach popup within 15 m of the start line, hides the line marker within 5 m, and detects disqualifications. *(internal)* *(hook)* | 543 |
| `career_modules_tutorial_step06dragStripBasics.setup(stepData)` | Called on activation: resets the state, activates the drivingToDragBounds and dragStripBounds zones, finds the beforeDragStrip and dragStartLine spots, displays the v2/dragStripWelcome welcome popup, switches the prefabs and creates the direction markers (dragGuide1 to 3). *(internal)* | 359 |

### Parameter details

#### `career_modules_tutorial_step06dragStripBasics.dragRaceEndLineReached(vehId)`

Hook emitted when the vehicle reaches the finish: starts the disqualification flow if the driver is disqualified, otherwise validates the finish objective and opens the timeslip popup after 2 s.

- `vehId` (*integer*) : Vehicle id.

#### `career_modules_tutorial_step06dragStripBasics.dragRaceStarted(vehId)`

Hook emitted at the actual start of the race: validates the "line up" and "launch" objectives.

- `vehId` (*integer*) : Vehicle id.

#### `career_modules_tutorial_step06dragStripBasics.onDebugMenu(im)`

Displays the phase and the objectives state; "Skip Step 6" button (marks everything as done and advances).

- `im` (*table*) : ui_imgui table.

#### `career_modules_tutorial_step06dragStripBasics.onDragRacersSetup(data)`

Hook emitted when the racers are put back in place for a new attempt: validates the "return to staging" objective after a false start and restarts the attempt after 1 s.

- `data` (*table*) : Setup data (unused).

#### `career_modules_tutorial_step06dragStripBasics.onIntroPopupCareerClosed(id)`

Popup close hook: advances the state machine (welcome done -> displays the objectives; disqualification popup -> reset or return to staging; timeslip -> advances to the next step; coaching -> resumes from pause and possible slow motion).

- `id` (*string*) : Id of the closed popup.

#### `career_modules_tutorial_step06dragStripBasics.onRacerPhaseTransition(vehId, oldPhase, newPhase, newPhaseName)`

gameplay_drag hook: at the countdown phase, validates the "line up" objective and opens the countdown coaching popup (once).

- `vehId` (*integer*) : Vehicle id.
- `oldPhase` (*integer*) : Old phase.
- `newPhase` (*integer*) : New phase (2 = countdown).
- `newPhaseName` (*string*) : Name of the new phase ("countdown").

#### `career_modules_tutorial_step06dragStripBasics.onUpdate(dtReal, dtSim, dtRaw)`

Called every frame: handles the start slow motion, triggers the approach popup within 15 m of the start line, hides the line marker within 5 m, and detects disqualifications.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulation delta (s).
- `dtRaw` (*number*) : Raw delta (s).

#### `career_modules_tutorial_step06dragStripBasics.setup(stepData)`

Called on activation: resets the state, activates the drivingToDragBounds and dragStripBounds zones, finds the beforeDragStrip and dragStartLine spots, displays the v2/dragStripWelcome welcome popup, switches the prefabs and creates the direction markers (dragGuide1 to 3).

- `stepData` (*any*) : Step data (unused).

**UI events (guihooks.trigger):** `ClearTasklist`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/tutorial/step06dragStripBasics.lua`.*
