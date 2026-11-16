# `freeroam_dragRace`

*File: `lua/ge/extensions/freeroam/dragRace.lua` · VM: Game Engine (GE) · 906 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `freeroam_dragRace`: `extensions.load("freeroam_dragRace")`, then the global `freeroam_dragRace`

Quarter-mile dragster race against an AI ("drag_opponent") on the dragstrips of the gridmap_v2 and west_coast_usa levels. Handles the starting tree (pre-stage, stage, amber, green, red lights), setting up the AI opponent (positions, pre-stage/stage/start, nitro/JATO), aligning the player on the line, false start detection, timing up to the finish trigger, the 7-segment displays (time and speed) and the UI results screen. Relies on named scene objects (Prestagelight_l, Amberlight1_R, display_time_1_l, dragTrigger, startTrigger_L...) and on the level's BeamNGTriggers. Global: freeroam_dragRace.

## Example

```lua
-- from a dragstrip trigger, the UI calls:
freeroam_dragRace.selectOpponent(freeroam_dragRace.selectRandomOpponent(true))
freeroam_dragRace.enableProTree(true) -- "pro" tree (immediate start on the 3 ambers)
```

## Notes

- BUG: `M.onUpdate = onUpdate` and `M.startRace = startRace` export variables that are never defined in this file: M.onUpdate and M.startRace are therefore nil. Likewise setupStage tests `if startRace` (nil global variable).
- BUG: in setupPrestage, the line `opponentVehicle:queLuaComuemand(...)` is a typo for queueLuaCommand: calling a nonexistent method raises a runtime error at the end of the pre-stage setup (the "AI_prestage" event is never sent to modded controllers and the rest of the function — be:enterVehicle, message — is not executed).
- The angle conversions use 3.1459 as the value of pi (typo for 3.14159) in setupVehicle and selectOpponent (slight orientation error).
- The current level (`level`) is a local variable set to 'gridmap_v2' by default; setLevel(lvl) changes it and reloads. The opponent/player reset positions are hardcoded per level. On gridmap_v2 the cinematic camera is disabled (cinematicCam=false in selectOpponent).
- Times and speed are in seconds and mph (speedUnit factor = 2.2369362920544 applied to m/s). The displays have 5 digits per side; time < 10 adds an "empty" digit.
- A false start (player crossing the line by more than 0.25 m during the countdown) disqualifies: red/amber lights on the player's side, the AI is stopped. Driving in the opponent's lane (laneTrigger_L) during the race also disqualifies.
- In onBeamNGTrigger, `table.getn(vehicles)` and modifying `vehicles` during the traversal (table.remove inside pairs) can skip elements.
- The module uses commands sent to the AI's VM: controller.setFreeze, ai.setSpeed/setAggression/setAvoidCars/setSpeedMode, electrics.values.jatoInput, controller nitrousOxideInjection, and the event controller.onGameplayEvent('freeroam_dragRace', 'AI_prestage'|'AI_stage'|'AI_setupStart'|'AI_start'|'AI_stop') for modded controllers.

## Functions

| Function | Description | Line |
|---|---|---|
| `freeroam_dragRace.accept()` | Called by the "Accept/Configure" button of the dragstrip dialog: opens the overview screen (displayOverview(true, false)) which puts the simulation in slow motion (1/100) and navigates to menu.dragRaceOverview. | 728 |
| `freeroam_dragRace.closeOverview()` | Closes the overview: puts the simulation back to 1x, the FOV to 65 and restores the previous camera. | 298 |
| `freeroam_dragRace.enableCinematicCam(value)` | Reads or sets the use of the cinematic (external) camera during the race. | 808 |
| `freeroam_dragRace.enableProTree(val)` | Reads or sets the "pro" tree (2 s countdown then the 3 ambers at 0.4 s then green) instead of the classic tree (successive ambers at 1.0/1.5/2.0 s, green at 2.5 s). | 815 |
| `freeroam_dragRace.exit()` | Quits the race: hides the menu, closes the dialog and the overview, deletes the drag_opponent scene object, forgets the opponent and reinitializes the module (onExtensionLoaded). | 732 |
| `freeroam_dragRace.onBeamNGTrigger(data)` | Level trigger hook: entry/exit dialog (dragTrigger), finish (endTrigger: update of the displays and results, AI stop), opponent's lane (laneTrigger_L), vehicle registration (startTrigger_R/L) and preparation (dragTrigger_L). *(internal)* *(hook)* | 620 |
| `freeroam_dragRace.onClientEndMission()` | End-of-level hook: empties the references to lights, displays, vehicles, triggers and results. *(internal)* *(hook)* | 867 |
| `freeroam_dragRace.onExtensionLoaded()` | Load hook: finds the scene's lights, displays (display_time_i_l/r, display_speed_i_l/r, i = 1..5) and triggers, hides the displays and sets the reset positions according to the level. *(internal)* *(hook)* | 742 |
| `freeroam_dragRace.onExtensionUnloaded()` | Unload hook: hides the menu, closes dialog and overview, deletes drag_opponent. *(internal)* *(hook)* | 859 |
| `freeroam_dragRace.onPreRender(dtReal, dtSim, dtRaw)` | Pre-render hook, heart of the race: advances the countdown (starttimer in simulated time), the timer, the player alignment messages (distance to the line in m), the false start and the AI's pre-stage/stage/start phases. *(internal)* *(hook)* | 333 |
| `freeroam_dragRace.onUpdate()` | Exported but nil (no local onUpdate function defined). (dynamically assigned) *(internal)* *(hook)* | dyn |
| `freeroam_dragRace.onVehicleDestroyed(id)` | Vehicle deletion hook: forgets the player or the opponent and hides the lights. *(internal)* *(hook)* | 550 |
| `freeroam_dragRace.onVehicleResetted(vid)` | Vehicle reset hook: closes the dialog if it is the player in the trigger; repositions the opponent (setupVehicle) if it is drag_opponent. *(internal)* *(hook)* | 791 |
| `freeroam_dragRace.onVehicleSpawned(vehicleID)` | Spawn hook: if it is the opponent, hides the menu and places it (setupVehicle); also finds the player vehicle named "thePlayer". *(internal)* *(hook)* | 541 |
| `freeroam_dragRace.resetLights()` | Hides all the light objects of the starting tree. | 107 |
| `freeroam_dragRace.restartRace()` | Restarts: resets the opponent and the player, returns to the menu, simulation at normal speed, orbit camera. | 717 |
| `freeroam_dragRace.selectOpponent(selection)` | Chooses and spawns the opponent (core_vehicles.spawnNewVehicle with vehicleName 'drag_opponent', plate '2slow'), resets the race and the displays, and puts the player back on the starting line if needed. | 822 |
| `freeroam_dragRace.selectRandomOpponent(sameClass)` | Randomly picks a car or truck config; with sameClass=true, restricts to configs whose 0-100 km/h is within ±1 s of the player vehicle's. Adds the model's Brand and Country for the UI. | 562 |
| `freeroam_dragRace.setLevel(lvl)` | Chooses the level for which the positions and cameras are hardcoded (gridmap_v2 or west_coast_usa) and reinitializes the module. | 878 |
| `freeroam_dragRace.setupPrestage()` | Turns on the AI's pre-stage and makes the opponent advance or hold depending on whether the player is ready; see the bug (queLuaComuemand) in the notes. *(internal)* | 158 |
| `freeroam_dragRace.setupStage()` | Turns on the AI's stage light and makes it approach the line (speed 5, aggression 0). *(internal)* | 179 |
| `freeroam_dragRace.startRace()` | Exported but nil: no implementation in this file (see notes). (dynamically assigned) | dyn |

### Parameter details

#### `freeroam_dragRace.enableCinematicCam(value)`

Reads or sets the use of the cinematic (external) camera during the race.

- `value` (*boolean|nil*) : New value; nil to only read.
- **returns**: boolean Current value.

#### `freeroam_dragRace.enableProTree(val)`

Reads or sets the "pro" tree (2 s countdown then the 3 ambers at 0.4 s then green) instead of the classic tree (successive ambers at 1.0/1.5/2.0 s, green at 2.5 s).

- `val` (*boolean|nil*) : New value; nil to only read.
- **returns**: boolean Current value.

#### `freeroam_dragRace.onBeamNGTrigger(data)`

Level trigger hook: entry/exit dialog (dragTrigger), finish (endTrigger: update of the displays and results, AI stop), opponent's lane (laneTrigger_L), vehicle registration (startTrigger_R/L) and preparation (dragTrigger_L).

- `data` (*table*) : {triggerName, event ('enter'|'exit'), subjectID}

#### `freeroam_dragRace.onPreRender(dtReal, dtSim, dtRaw)`

Pre-render hook, heart of the race: advances the countdown (starttimer in simulated time), the timer, the player alignment messages (distance to the line in m), the false start and the AI's pre-stage/stage/start phases.

- `dtReal` (*number*) : Real duration (s).
- `dtSim` (*number*) : Simulated duration (s), used for the timers.
- `dtRaw` (*number*) : Raw duration (s).

#### `freeroam_dragRace.onVehicleDestroyed(id)`

Vehicle deletion hook: forgets the player or the opponent and hides the lights.

- `id` (*integer*) : Vehicle id.

#### `freeroam_dragRace.onVehicleResetted(vid)`

Vehicle reset hook: closes the dialog if it is the player in the trigger; repositions the opponent (setupVehicle) if it is drag_opponent.

- `vid` (*integer*) : Vehicle id.

#### `freeroam_dragRace.onVehicleSpawned(vehicleID)`

Spawn hook: if it is the opponent, hides the menu and places it (setupVehicle); also finds the player vehicle named "thePlayer".

- `vehicleID` (*integer*) : Vehicle id.

#### `freeroam_dragRace.selectOpponent(selection)`

Chooses and spawns the opponent (core_vehicles.spawnNewVehicle with vehicleName 'drag_opponent', plate '2slow'), resets the race and the displays, and puts the player back on the starting line if needed.

- `selection` (*table*) : {model, config, color} (e.g. an element of selectRandomOpponent).

#### `freeroam_dragRace.selectRandomOpponent(sameClass)`

Randomly picks a car or truck config; with sameClass=true, restricts to configs whose 0-100 km/h is within ±1 s of the player vehicle's. Adds the model's Brand and Country for the UI.

- `sameClass` (*boolean|nil*) : true for a similar performance class.
- **returns**: table Vehicle config entry (model_key, key, Brand, Country...).

#### `freeroam_dragRace.setLevel(lvl)`

Chooses the level for which the positions and cameras are hardcoded (gridmap_v2 or west_coast_usa) and reinitializes the module.

- `lvl` (*string*) : Level name.

**UI events (guihooks.trigger):** `MenuHide`, `Message`

## Calls into the engine (C++)

- `be:` `enterVehicle`, `getPlayerVehicleID`
- `debugDrawer:` `drawLine`, `drawSphere`, `drawTextAdvanced`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/freeroam/dragRace.lua`.*
