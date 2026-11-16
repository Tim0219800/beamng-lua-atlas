# `career_modules_tutorial_step05driveToDragStrip`

*File: `lua/ge/extensions/career/modules/tutorial/step05driveToDragStrip.lua` · VM: Game Engine (GE) · 256 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_tutorial_step05driveToDragStrip`: `extensions.load("career_modules_tutorial_step05driveToDragStrip")`, then the global `career_modules_tutorial_step05driveToDragStrip`

Career tutorial step 5 ("driveToDragStrip"): the player drives to the drag strip, with ground guidance and a marker, then parks the vehicle in the beforeDragStrip spot (stationary 1 s). Phases: waitPopup, driveToStrip, parkInStaging (triggered within 25 m of the spot). Then step 06dragStripBasics is activated. Activates the drivingToDragBounds and parkingBounds zones.

## Notes

- At the start, the vehicle is teleported to the simpleTimeTrialFinish spot (end of step 4) and traffic is restored (career_modules_playerDriving.restoreTrafficAfterTutorialPhase).
- The attention flag of the "drive to the strip" objective is removed after 5 m traveled.
- The prefabs are switched 0.5 s after the start of the step.

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_tutorial_step05driveToDragStrip.cleanup()` | Removes the zone reset, the guidance, the task list and the parking spot visuals. *(internal)* | 230 |
| `career_modules_tutorial_step05driveToDragStrip.onCareerTutorialLeftBounds()` | Out-of-bounds hook: starts the step's out-of-bounds reset. *(internal)* *(hook)* | 192 |
| `career_modules_tutorial_step05driveToDragStrip.onDebugMenu(im)` | Displays the phase and a "Skip Step 5" button (teleports the vehicle to beforeDragStrip then activates step 6). *(internal)* *(hook)* | 237 |
| `career_modules_tutorial_step05driveToDragStrip.onIntroPopupCareerClosed(id)` | Popup close hook: when v2/driveToDragStrip closes, moves to the driveToStrip phase and displays the objective. *(internal)* *(hook)* | 180 |
| `career_modules_tutorial_step05driveToDragStrip.onUpdate(dtReal, dtSim, dtRaw)` | Called every frame: tracks the distance traveled and the distance to the spot, moves to the parking phase and validates the parking objective before activating 06dragStripBasics (after 1 s). *(internal)* *(hook)* | 196 |
| `career_modules_tutorial_step05driveToDragStrip.setup(stepData)` | Called on activation: restores traffic, activates the zones, installs the out-of-bounds reset (return to simpleTimeTrialFinish), prepares the vehicle (ignition, unfreeze, player in the driver's seat), draws the guidance, creates the marker, displays the v2/driveToDragStrip popup and switches the prefabs. *(internal)* | 114 |

### Parameter details

#### `career_modules_tutorial_step05driveToDragStrip.onDebugMenu(im)`

Displays the phase and a "Skip Step 5" button (teleports the vehicle to beforeDragStrip then activates step 6).

- `im` (*table*) : ui_imgui table.

#### `career_modules_tutorial_step05driveToDragStrip.onIntroPopupCareerClosed(id)`

Popup close hook: when v2/driveToDragStrip closes, moves to the driveToStrip phase and displays the objective.

- `id` (*string*) : Popup id.

#### `career_modules_tutorial_step05driveToDragStrip.onUpdate(dtReal, dtSim, dtRaw)`

Called every frame: tracks the distance traveled and the distance to the spot, moves to the parking phase and validates the parking objective before activating 06dragStripBasics (after 1 s).

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulation delta (s).
- `dtRaw` (*number*) : Raw delta (s).

#### `career_modules_tutorial_step05driveToDragStrip.setup(stepData)`

Called on activation: restores traffic, activates the zones, installs the out-of-bounds reset (return to simpleTimeTrialFinish), prepares the vehicle (ignition, unfreeze, player in the driver's seat), draws the guidance, creates the marker, displays the v2/driveToDragStrip popup and switches the prefabs.

- `stepData` (*any*) : Step data (unused).

**UI events (guihooks.trigger):** `ClearTasklist`, `DiscardTasklistItem`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/tutorial/step05driveToDragStrip.lua`.*
