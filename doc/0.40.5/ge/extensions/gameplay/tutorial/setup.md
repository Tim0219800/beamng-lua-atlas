# `gameplay_tutorial_setup`

*File: `lua/ge/extensions/gameplay/tutorial/setup.lua` · VM: Game Engine (GE) · 409 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_tutorial_setup`: `extensions.load("gameplay_tutorial_setup")`, then the global `gameplay_tutorial_setup`

Tutorial scene setup: prefabs, sites (parking zones), tutorial vehicle (sunburst2, config apmTutorial_sunburst), placing the player on foot, blocking input actions, and "out of bounds" reset with screen fade. Used by gameplay_tutorial_runtime and by the steps; it only keeps the vehicle id, not the object.

## Notes

- The loaded sites file is /gameplay/tutorials/tutorialZones.sites.json; the points used are tutorialCarStart, playerWalkingStart, dragPlayerStart and dragCarStart.
- Prefabs are loaded from gameplay/tutorials/<id>.prefab.json and named <id>Prefab.
- The out-of-bounds reset goes through ui_fadeScreen: the callback is executed when onScreenFadeState receives state 2.
- The tutorial vehicle is frozen (setFreeze), gearbox in realistic mode, ignition off on spawn.
- Gearboxes are blocked by default (blockedActions); unblockGearActions() releases them.
- The out-of-zone warning message is hardcoded in English and does not go through the translation system.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_tutorial_setup.activateOutOfBoundsSystem()` | Enables the zone bounds system (outOfBoundsSystemActive = true). | 39 |
| `gameplay_tutorial_setup.cleanup()` | Resets everything: flags, reset handlers, created prefabs (deleted, collision reloaded) and tutorialVehicleId. | 115 |
| `gameplay_tutorial_setup.isOutOfBoundsResetAllowed()` | Indicates whether the out-of-bounds reset is allowed. | 31 |
| `gameplay_tutorial_setup.loadTutorialSites()` | Loads the tutorial sites file via gameplay_sites_sitesManager.loadSites and stores it in tutorialSites. | 144 |
| `gameplay_tutorial_setup.onLoadingScreenFadeout()` | Hook called at the end of the loading screen fade; sets loadingScreenFadeoutComplete to true. *(internal)* *(hook)* | 195 |
| `gameplay_tutorial_setup.onScreenFadeState(state)` | Hook called on screen fade state changes; at state 2 and if a reset is pending, runs the callback, stops the fade and displays the warning. *(internal)* *(hook)* | 339 |
| `gameplay_tutorial_setup.placePlayerAtDragStart()` | Puts the player on foot and teleports them to the dragPlayerStart site (or 6 m behind dragCarStart), facing forward. | 353 |
| `gameplay_tutorial_setup.placePlayerBackInTutorialVehicle()` | Puts the player back in the tutorial vehicle if they are walking or driving something else. | 376 |
| `gameplay_tutorial_setup.placePlayerBackToParkingStart()` | Teleports the player: on foot, to the playerWalkingStart site; in a vehicle, the tutorial vehicle to tutorialCarStart, and puts the player in it if they are not in it. | 288 |
| `gameplay_tutorial_setup.runCurrentStepOutOfBoundsReset()` | Starts the out-of-bounds reset with the current step's handler, otherwise with the placement at the start point. | 322 |
| `gameplay_tutorial_setup.runOutOfBoundsResetWithFade(resetCallback)` | Starts a 0.3 s screen fade; the callback will be executed at fade state 2. Ignored if a reset is already pending. | 315 |
| `gameplay_tutorial_setup.setActivePrefabs(prefabStates)` | Enables or disables prefabs of gameplay/tutorials/ according to an id -> boolean table; only touches those whose state changes. Reloads collision if something changed. | 69 |
| `gameplay_tutorial_setup.setOutOfBoundsResetAllowed(allowed)` | Allows or not the out-of-bounds reset (to allow once the welcome pop-ups are closed). | 27 |
| `gameplay_tutorial_setup.setOutOfBoundsResetHandler(resetCallback)` | Sets the reset callback specific to the current step (otherwise placePlayerBackToParkingStart is used). | 35 |
| `gameplay_tutorial_setup.setupBlockedActions()` | Builds the blocked actions list (group templates set to true + individual actions set to true) and registers it as the tutorialBlockedActions group of player 0's action filter. | 390 |
| `gameplay_tutorial_setup.setupPlayer()` | Puts the player in walking mode at the playerWalkingStart position (or a hardcoded default position) then places them back at the start point; sets vehicleSetupComplete to true. | 199 |
| `gameplay_tutorial_setup.setupVehicles()` | Resets the setup flags to false, then spawns the tutorial vehicle and calls setupPlayer once ready. | 189 |
| `gameplay_tutorial_setup.showOutOfBoundsWarning()` | Displays for 3 s a message task "Please stay inside of the evaluation zone." in the UI task list (SetTasklistTask then DiscardTasklistItem). | 331 |
| `gameplay_tutorial_setup.spawnPrefab(prefabPath, pos, rot, name)` | Spawns a prefab in MissionGroup (canSave = false) and stores it for cleanup. | 43 |
| `gameplay_tutorial_setup.spawnTutorialVehicle(thenFunction)` | Spawns the tutorial's sunburst2 at the tutorialCarStart site (without entering it), stores its id, sets the gearbox to realistic, freezes the vehicle and turns the ignition off, then calls thenFunction. | 223 |
| `gameplay_tutorial_setup.unblockGearActions()` | Sets all gear actions of blockedActions to false and reapplies the filter. | 281 |

### Parameter details

#### `gameplay_tutorial_setup.isOutOfBoundsResetAllowed()`

Indicates whether the out-of-bounds reset is allowed.

- **returns**: boolean 

#### `gameplay_tutorial_setup.loadTutorialSites()`

Loads the tutorial sites file via gameplay_sites_sitesManager.loadSites and stores it in tutorialSites.

- **returns**: table|nil Loaded sites, nil on failure.

#### `gameplay_tutorial_setup.onScreenFadeState(state)`

Hook called on screen fade state changes; at state 2 and if a reset is pending, runs the callback, stops the fade and displays the warning.

- `state` (*integer*) : Fade state (2 = screen fully blackened, inferred from code).

#### `gameplay_tutorial_setup.runOutOfBoundsResetWithFade(resetCallback)`

Starts a 0.3 s screen fade; the callback will be executed at fade state 2. Ignored if a reset is already pending.

- `resetCallback` (*function|nil*) : Reset callback; placePlayerBackToParkingStart if nil.

#### `gameplay_tutorial_setup.setActivePrefabs(prefabStates)`

Enables or disables prefabs of gameplay/tutorials/ according to an id -> boolean table; only touches those whose state changes. Reloads collision if something changed.

- `prefabStates` (*table<string, boolean>*) : Prefab id -> active or not.

#### `gameplay_tutorial_setup.setOutOfBoundsResetAllowed(allowed)`

Allows or not the out-of-bounds reset (to allow once the welcome pop-ups are closed).

- `allowed` (*boolean*) : true to allow.

#### `gameplay_tutorial_setup.setOutOfBoundsResetHandler(resetCallback)`

Sets the reset callback specific to the current step (otherwise placePlayerBackToParkingStart is used).

- `resetCallback` (*function|nil*) : Function with no argument.

#### `gameplay_tutorial_setup.spawnPrefab(prefabPath, pos, rot, name)`

Spawns a prefab in MissionGroup (canSave = false) and stores it for cleanup.

- `prefabPath` (*string*) : Prefab file path.
- `pos` (*vec3*) : Position.
- `rot` (*quat*) : Rotation.
- `name` (*string|nil*) : Object name; generated (tutorial_prefab_...) if absent.
- **returns**: userdata|nil Prefab object, nil on failure.

#### `gameplay_tutorial_setup.spawnTutorialVehicle(thenFunction)`

Spawns the tutorial's sunburst2 at the tutorialCarStart site (without entering it), stores its id, sets the gearbox to realistic, freezes the vehicle and turns the ignition off, then calls thenFunction.

- `thenFunction` (*function|nil*) : Called when the vehicle has responded to the mainController/gearboxMode request.
- **returns**: userdata|nil Vehicle object, nil if spawning failed.

## Fields

| Field | Type | Description |
|---|---|---|
| `blockedActions` | table<string, boolean> | Individually blocked input actions (gear1..8, gearN, gearR, shiftUp, shiftDown, setShifterMode: all true by default). |
| `blockedActionsTemplates` | table<string, boolean> | Action groups (aiControls, bigMap, freeCam, resetPhysics, walkingMode, vehicleSwitching...) blocked when the value is true. |
| `loadingScreenFadeoutComplete` | boolean | true after onLoadingScreenFadeout. |
| `outOfBoundsSystemActive` | boolean | true after activateOutOfBoundsSystem(). |
| `tutorialSites` | table|nil | Loaded sites (parkingSpots, etc.); nil until loadTutorialSites has succeeded. |
| `tutorialVehicleId` | integer|nil | Tutorial vehicle id (nil before spawn and after cleanup). Steps use getObjectByID on it. |
| `vehicleSetupComplete` | boolean | true when the vehicle is ready and the player placed (end of setupPlayer). |

**UI events (guihooks.trigger):** `DiscardTasklistItem`, `SetTasklistTask`

## Calls into the engine (C++)

- `be:` `reloadCollision`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/tutorial/setup.lua`.*
