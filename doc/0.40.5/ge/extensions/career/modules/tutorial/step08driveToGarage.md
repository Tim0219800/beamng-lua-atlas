# `career_modules_tutorial_step08driveToGarage`

*File: `lua/ge/extensions/career/modules/tutorial/step08driveToGarage.lua` · VM: Game Engine (GE) · 360 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_tutorial_step08driveToGarage`: `extensions.load("career_modules_tutorial_step08driveToGarage")`, then the global `career_modules_tutorial_step08driveToGarage`

Career tutorial step 8 ("driveToGarage"): the player drives to the garage, parks in the garageExteriorPark spot (stationary 1 s, within 25 m to trigger the parking phase), then gets out of the vehicle (walking mode). Phases: driveToGarage, parkAtGarage, hopOut, waitArrivalPopups. Two arrival popups (v2/garageArrivalIntro1 and 2) conclude the step, then the guidance leads to the garageInteriorWalkStart point.

## Notes

- Three zones driveToGarageZone1 to 3 serve as respawn points: when leaving the zone, the vehicle is put back on the driveToGarageReset<N> spot of the last checkpoint reached.
- If no respawn zone exists in the tutorial sites, the active zones are cleared and no reset is installed.
- Once parked: engine off, vehicle frozen and blacklisted for walking (player cannot get back in), damage tracking disabled on exit.
- At the start of the step, any drag race is stopped (gameplay_drag_dragBridge.stopDragRace).

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_tutorial_step08driveToGarage.cleanup()` | Removes the zone reset, unlocks walking, clears the tasks and deletes the parking visuals. *(internal)* | 325 |
| `career_modules_tutorial_step08driveToGarage.onCareerTutorialLeftBounds()` | Out-of-bounds hook: starts the step's out-of-bounds reset. *(internal)* *(hook)* | 258 |
| `career_modules_tutorial_step08driveToGarage.onDebugMenu(im)` | Displays the phase and a "Skip Step 8" button (teleports to the garage, switches to walking mode, advances). *(internal)* *(hook)* | 333 |
| `career_modules_tutorial_step08driveToGarage.onIntroPopupCareerClosed(id)` | Popup close hook: when v2/garageArrivalIntro2 closes (waitArrivalPopups phase), draws the route to the garage interior and schedules the step advance after 1 s. *(internal)* *(hook)* | 262 |
| `career_modules_tutorial_step08driveToGarage.onUpdate(dtReal, dtSim, dtRaw)` | Called every frame: updates the respawn checkpoint, handles the driving / parking / exiting the vehicle phases. *(internal)* *(hook)* | 272 |
| `career_modules_tutorial_step08driveToGarage.setup(stepData)` | Called on activation: stops the drag, finds the player vehicle, the garage spots and zones, installs zones and reset, allows walking and entering the vehicle, creates the marker and displays the objective. *(internal)* | 181 |

### Parameter details

#### `career_modules_tutorial_step08driveToGarage.onDebugMenu(im)`

Displays the phase and a "Skip Step 8" button (teleports to the garage, switches to walking mode, advances).

- `im` (*table*) : ui_imgui table.

#### `career_modules_tutorial_step08driveToGarage.onIntroPopupCareerClosed(id)`

Popup close hook: when v2/garageArrivalIntro2 closes (waitArrivalPopups phase), draws the route to the garage interior and schedules the step advance after 1 s.

- `id` (*string*) : Popup id.

#### `career_modules_tutorial_step08driveToGarage.onUpdate(dtReal, dtSim, dtRaw)`

Called every frame: updates the respawn checkpoint, handles the driving / parking / exiting the vehicle phases.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulation delta (s).
- `dtRaw` (*number*) : Raw delta (s).

#### `career_modules_tutorial_step08driveToGarage.setup(stepData)`

Called on activation: stops the drag, finds the player vehicle, the garage spots and zones, installs zones and reset, allows walking and entering the vehicle, creates the marker and displays the objective.

- `stepData` (*any*) : Step data (unused).

**UI events (guihooks.trigger):** `ClearTasklist`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/tutorial/step08driveToGarage.lua`.*
