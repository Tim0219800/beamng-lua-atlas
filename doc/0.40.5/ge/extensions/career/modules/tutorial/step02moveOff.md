# `career_modules_tutorial_step02moveOff`

*File: `lua/ge/extensions/career/modules/tutorial/step02moveOff.lua` · VM: Game Engine (GE) · 262 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_tutorial_step02moveOff`: `extensions.load("career_modules_tutorial_step02moveOff")`, then the global `career_modules_tutorial_step02moveOff`

Career tutorial step 2 ("moveOff"): learning to move off according to the gearbox mode set in step 1. Three modes (inferred from the gearboxMode setting and autoClutch): arcade, realistic_clutch (engage 1st gear then accelerate) and realistic_no_clutch (manual clutch, with recovery on engine stall). The step ends when the vehicle has moved at least 3 m, then activates 03basicManeuvers after 1 s.

## Notes

- Thresholds: movement 3 m, throttle input 0.2, 1st gear = gearIndex 1.
- A stall is detected by a change of ignitionLevel from 2 to 0 or 1 (no-clutch mode only).
- The hooks are called by the tutorial runtime.

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_tutorial_step02moveOff.cleanup()` | Removes the out-of-bounds handler, unregisters the vehicle notifications and clears the task list. *(internal)* | 229 |
| `career_modules_tutorial_step02moveOff.onCareerTutorialLeftBounds()` | Out-of-bounds hook: starts the step's out-of-bounds reset. *(internal)* *(hook)* | 149 |
| `career_modules_tutorial_step02moveOff.onDebugMenu(im)` | Displays the current mode and a button to skip the step (activates 03basicManeuvers). *(internal)* *(hook)* | 252 |
| `career_modules_tutorial_step02moveOff.onUpdate(dtReal, dtSim, dtRaw)` | Called every frame: reads the cached vehicle inputs, handles stalling, validates the objectives and advances to step 03 when the 3 m distance is reached. *(internal)* *(hook)* | 153 |
| `career_modules_tutorial_step02moveOff.setup(stepData)` | Called on activation: resets the state, activates the evalZone zone, registers the throttle_input, clutch, gearIndex, ignitionLevel notifications, reads the gearbox behavior (mainController/gearboxMode), chooses the mode, unlocks the gear change actions, unfreezes the vehicle and builds the task list. *(internal)* | 93 |

### Parameter details

#### `career_modules_tutorial_step02moveOff.onDebugMenu(im)`

Displays the current mode and a button to skip the step (activates 03basicManeuvers).

- `im` (*table*) : ui_imgui table.

#### `career_modules_tutorial_step02moveOff.onUpdate(dtReal, dtSim, dtRaw)`

Called every frame: reads the cached vehicle inputs, handles stalling, validates the objectives and advances to step 03 when the 3 m distance is reached.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulation delta (s).
- `dtRaw` (*number*) : Raw delta (s).

#### `career_modules_tutorial_step02moveOff.setup(stepData)`

Called on activation: resets the state, activates the evalZone zone, registers the throttle_input, clutch, gearIndex, ignitionLevel notifications, reads the gearbox behavior (mainController/gearboxMode), chooses the mode, unlocks the gear change actions, unfreezes the vehicle and builds the task list.

- `stepData` (*any*) : Step data (unused).

**UI events (guihooks.trigger):** `ClearTasklist`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/tutorial/step02moveOff.lua`.*
