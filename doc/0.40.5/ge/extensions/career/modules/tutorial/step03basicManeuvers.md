# `career_modules_tutorial_step03basicManeuvers`

*File: `lua/ge/extensions/career/modules/tutorial/step03basicManeuvers.lua` · VM: Game Engine (GE) · 186 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_tutorial_step03basicManeuvers`: `extensions.load("career_modules_tutorial_step03basicManeuvers")`, then the global `career_modules_tutorial_step03basicManeuvers`

Career tutorial step 3 ("basicManeuvers"): the player drives freely (message about changing camera) then must park the vehicle in the parking spot named simpleCourseStart (marker + ground decal). The objective is validated when the vehicle stays stationary in the spot for 1 s (gameplay_tutorial_markers.checkParkGoalWithStationaryTime); the next step is then activated after 1.5 s.

## Notes

- If the simpleCourseStart spot is not found in the tutorial sites, a warning is logged and the parking objective cannot be validated.
- The hooks are called by the tutorial runtime.

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_tutorial_step03basicManeuvers.cleanup()` | Called at the end of the step: removes the out-of-bounds reset, clears the task list, deletes the marker and decal. *(internal)* | 125 |
| `career_modules_tutorial_step03basicManeuvers.onCareerTutorialLeftBounds()` | Out-of-bounds hook: starts the step's out-of-bounds reset. *(internal)* *(hook)* | 107 |
| `career_modules_tutorial_step03basicManeuvers.onDebugMenu(im)` | Displays the objectives state and a "Skip Step 3" button (teleports the vehicle to the spot and advances). *(internal)* *(hook)* | 164 |
| `career_modules_tutorial_step03basicManeuvers.onUpdate(dtReal, dtSim, dtRaw)` | Called every frame: tests the parking objective; once validated, moves to the next step after 1.5 s. *(internal)* *(hook)* | 112 |
| `career_modules_tutorial_step03basicManeuvers.setup(stepData)` | Called on activation: resets the objective, activates the evalZone zone, installs the out-of-bounds reset, then directly starts the parking phase (unlocks the gears, unfreezes the vehicle, creates the marker). *(internal)* | 89 |

### Parameter details

#### `career_modules_tutorial_step03basicManeuvers.onDebugMenu(im)`

Displays the objectives state and a "Skip Step 3" button (teleports the vehicle to the spot and advances).

- `im` (*table*) : ui_imgui table.

#### `career_modules_tutorial_step03basicManeuvers.onUpdate(dtReal, dtSim, dtRaw)`

Called every frame: tests the parking objective; once validated, moves to the next step after 1.5 s.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulation delta (s).
- `dtRaw` (*number*) : Raw delta (s).

#### `career_modules_tutorial_step03basicManeuvers.setup(stepData)`

Called on activation: resets the objective, activates the evalZone zone, installs the out-of-bounds reset, then directly starts the parking phase (unlocks the gears, unfreezes the vehicle, creates the marker).

- `stepData` (*any*) : Step data (unused).

**UI events (guihooks.trigger):** `ClearTasklist`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/tutorial/step03basicManeuvers.lua`.*
