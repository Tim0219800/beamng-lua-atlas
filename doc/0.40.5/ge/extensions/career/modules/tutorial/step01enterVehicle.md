# `career_modules_tutorial_step01enterVehicle`

*File: `lua/ge/extensions/career/modules/tutorial/step01enterVehicle.lua` · VM: Game Engine (GE) · 234 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_tutorial_step01enterVehicle`: `extensions.load("career_modules_tutorial_step01enterVehicle")`, then the global `career_modules_tutorial_step01enterVehicle`

Career tutorial step 1 ("enterVehicle"): the player gets into the tutorial vehicle, learns the basic controls (accelerate, brake, steer, objectives validated at 0.75 / 0.75 / 0.5 of the input value), chooses their gearbox mode via a driving aids popup, then step 02moveOff is activated. Works in phases: waitVehicleSetup, getInCar, waitBasicControlsPopup, controls, shiftMode, waitBeginFirstChallenge. Extension loaded by gameplay_tutorial_runtime (prefix career_modules_tutorial_step).

## Notes

- The hooks setup, cleanup, onUpdate, onCareerTutorialLeftBounds and onDebugMenu are called by the tutorial runtime; onIntroPopupCareerClosed and onShiftModeSelectedViaPopup are emitted by the popups / the UI (GearboxSelect.vue).
- Out-of-bounds events: the first uses an instant reset at the start, the following ones a reset with fade.

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_tutorial_step01enterVehicle.cleanup()` | Called at the end of the step or the tutorial: removes the out-of-bounds handler and the marker above the vehicle. *(internal)* | 131 |
| `career_modules_tutorial_step01enterVehicle.onCareerTutorialLeftBounds()` | Hook emitted when the player leaves the allowed zone: instant position reset only once at the start, then the step's standard reset. *(internal)* *(hook)* | 59 |
| `career_modules_tutorial_step01enterVehicle.onDebugMenu(im)` | Adds a "Skip Step 1" button to the debug menu (puts the player in the driver's seat, starts the engine, moves to the next step). *(internal)* *(hook)* | 226 |
| `career_modules_tutorial_step01enterVehicle.onIntroPopupCareerClosed(id)` | Hook emitted when an intro popup closes. Depending on the id: v2/approachVehicle displays the "get in the car" objective and a marker; v2/basicControls enables input tracking and starts the engine; v2/beginFirstChallenge activates step 02moveOff. *(internal)* *(hook)* | 142 |
| `career_modules_tutorial_step01enterVehicle.onShiftModeSelectedViaPopup(data)` | Called from GearboxSelect.vue when the player confirms the gearbox mode (shiftMode phase): applies setGearboxMode on the vehicle then displays the beginFirstChallenge popup. *(internal)* *(hook)* | 183 |
| `career_modules_tutorial_step01enterVehicle.onUpdate(dtReal, dtSim, dtRaw)` | Called every frame during the step. Handles the phases: launches the introduction popups, detects that the player got in (gameplay_walk), then validates the throttle/brake/steer objectives and opens the driving aids popup. *(internal)* *(hook)* | 70 |
| `career_modules_tutorial_step01enterVehicle.setup(stepData)` | Called when the step is activated: resets the objectives, enters the waitVehicleSetup phase, installs the out-of-bounds handler (return to the parking start), activates the evalZone zone, damage tracking, the tutorial's recovery settings and displays the tasks app. *(internal)* | 36 |

### Parameter details

#### `career_modules_tutorial_step01enterVehicle.onDebugMenu(im)`

Adds a "Skip Step 1" button to the debug menu (puts the player in the driver's seat, starts the engine, moves to the next step).

- `im` (*table*) : ui_imgui table.

#### `career_modules_tutorial_step01enterVehicle.onIntroPopupCareerClosed(id)`

Hook emitted when an intro popup closes. Depending on the id: v2/approachVehicle displays the "get in the car" objective and a marker; v2/basicControls enables input tracking and starts the engine; v2/beginFirstChallenge activates step 02moveOff.

- `id` (*string*) : Popup id (e.g. "v2/basicControls").

#### `career_modules_tutorial_step01enterVehicle.onShiftModeSelectedViaPopup(data)`

Called from GearboxSelect.vue when the player confirms the gearbox mode (shiftMode phase): applies setGearboxMode on the vehicle then displays the beginFirstChallenge popup.

- `data` (*table*) : Table with the mode field (chosen gearbox mode).

#### `career_modules_tutorial_step01enterVehicle.onUpdate(dtReal, dtSim, dtRaw)`

Called every frame during the step. Handles the phases: launches the introduction popups, detects that the player got in (gameplay_walk), then validates the throttle/brake/steer objectives and opens the driving aids popup.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulation delta (s).
- `dtRaw` (*number*) : Raw delta (s).

#### `career_modules_tutorial_step01enterVehicle.setup(stepData)`

Called when the step is activated: resets the objectives, enters the waitVehicleSetup phase, installs the out-of-bounds handler (return to the parking start), activates the evalZone zone, damage tracking, the tutorial's recovery settings and displays the tasks app.

- `stepData` (*any*) : Step data provided by the runtime (unused).

**UI events (guihooks.trigger):** `ClearTasklist`

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/tutorial/step01enterVehicle.lua`.*
