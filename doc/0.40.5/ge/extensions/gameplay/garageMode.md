# `gameplay_garageMode`

*File: `lua/ge/extensions/gameplay/garageMode.lua` · VM: Game Engine (GE) · 582 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_garageMode`: `extensions.load("gameplay_garageMode")`, then the global `gameplay_garageMode`

Garage mode: loads the garage_v2 level (or uses the current location in career), freezes the vehicle at its spawn point, switches the camera to orbit, blocks certain input actions (map, vehicle menus, AI, walking, reset...), automatically hides ceiling and pillars depending on the camera position, manages lighting by groups and allows testing the vehicle in the gridmap_v2 level. A modder uses it to enter/exit the garage (start/stop) or adjust camera and lighting.

## Example

```lua
extensions.load('gameplay_garageMode')
gameplay_garageMode.start(false)   -- loads garage_v2 with the current vehicle
gameplay_garageMode.setCamera('front')
gameplay_garageMode.setLighting({true, false, true}) -- west, middle, east
gameplay_garageMode.stop()
```

## Notes

- Camera presets of setCamera: default, front, back, side, left, right, top. An unknown name gives nil to setDefaultRotation.
- Hidden scene groups: hide_from_camera (ceiling, if the camera is above z = 108.1), hide_from_camera_pillars_west / _east (depending on the camera's x); lighting groups lights_group_west, _middle, _east.
- The vehicle is frozen (setFreeze) 5 frames after spawning, because the vlua can be reinitialized before.
- onUpdate is only registered while the mode is active (setActive calls extensions.hookUpdate).
- In career, loading/saving texts go through career_saveSystem.saveCurrent then the garageInitModules step chain (gameplay_garageMode, career_modules_inventory) via initStepFinished.
- Inconsistency: the local variable vehicleToLoad is never assigned; the onClientStartMission code (replaceVehicle) is therefore unused.
- Emits the hook extensions.hook('onEndGarageMode') at the end of the mode.

**Dependencies (loaded first):** `core_jobsystem`, `core_vehicle_manager`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_garageMode.garageModeStartStep()` | Chained initialization step: launches career_saveSystem.saveCurrent(); the end of the save calls initStepFinished. *(internal)* | 372 |
| `gameplay_garageMode.getGarageMenuState()` | Returns the stored garage menu. | 65 |
| `gameplay_garageMode.getLastOwnedVehicleId()` | ID of the last owned vehicle entered, or the current one in career. | 541 |
| `gameplay_garageMode.getLighting()` | Returns the state of the three lighting groups. | 450 |
| `gameplay_garageMode.initStepFinished()` | Moves to the next initialization step (next extension of garageInitModules) or ends the chain. *(internal)* | 362 |
| `gameplay_garageMode.isActive()` | Returns whether garage mode is active. | 485 |
| `gameplay_garageMode.isObjectsAutohide()` | Returns whether automatic hiding is active. | 493 |
| `gameplay_garageMode.onClientPreStartMission(levelPath)` | Hook before a level starts: activates garage mode if requested at load (unloads/reloads extensions), otherwise ends garage mode if it was active. *(internal)* *(hook)* | 461 |
| `gameplay_garageMode.onClientStartMission(levelPath)` | Hook at level start: replaces the vehicle with vehicleToLoad if it exists (never assigned in this file). *(internal)* *(hook)* | 454 |
| `gameplay_garageMode.onDeserialized(v)` | Extension reload hook: restores the active state. *(internal)* *(hook)* | 481 |
| `gameplay_garageMode.onEnterVehicleFinished(vehicleId)` | Hook: stores the entered vehicle as the last owned vehicle. *(internal)* *(hook)* | 69 |
| `gameplay_garageMode.onGarageEnter(context, toRoute, fromRoute, data)` | UI navigation hook: fills data.layoutMenu (top bar with Garage/Tuning tabs, header, rails) and data.garage for the garage route. *(internal)* *(hook)* | 146 |
| `gameplay_garageMode.onLoadingScreenFadeout()` | Hook at the end of the loading screen: after testVehicle, navigates to the UI route "play". *(internal)* *(hook)* | 545 |
| `gameplay_garageMode.onSerialize()` | Extension reload hook: saves {active}. *(internal)* *(hook)* | 475 |
| `gameplay_garageMode.onSpawnCCallback(vehicleId)` | Spawn hook: requests that the vehicle spawns with the engine off (spawnWithEngineRunning = false). *(internal)* *(hook)* | 121 |
| `gameplay_garageMode.onThumbnailTriggered(active)` | Thumbnail capture hook: in garage_v2, exits garage mode and hides the east pillars (shows west/ceiling) during the capture, then re-enables the mode; shows/removes the GarageModeBlackscreen black screen. *(internal)* *(hook)* | 497 |
| `gameplay_garageMode.onVehicleSaveFinished()` | Hook: if the garage initialization is waiting for the save, moves to the next step. *(internal)* *(hook)* | 377 |
| `gameplay_garageMode.onVehicleSpawned(vehicleId)` | Hook called when a vehicle spawns; in garage mode, teleports it to the garage level's spawn point and schedules the freeze. *(internal)* *(hook)* | 114 |
| `gameplay_garageMode.setCamera(preset)` | Starts a job that switches to orbit camera and applies a predefined default rotation. | 84 |
| `gameplay_garageMode.setGarageMenuState(state)` | Stores the open garage menu; the "paint" state marks the vehicle as modified. | 56 |
| `gameplay_garageMode.setLighting(state)` | Turns the garage's three lighting groups on/off (west, middle, east). | 318 |
| `gameplay_garageMode.setObjectsAutohide(v)` | Enables or disables the automatic hiding of the ceiling and pillars. | 489 |
| `gameplay_garageMode.setVehicleDirty(vehicleDirty, switchedToNewVehicle)` | Intended to signal a modified vehicle in career; the guihook trigger is currently commented out, so the function does nothing observable. | 50 |
| `gameplay_garageMode.start(_useCurrentLocation, skipInventoryStep)` | Enters garage mode. With useCurrentLocation true, stays on the current map (career: checks that there are vehicles in the inventory, calls career_modules_inventory.onBeforeGarage, switches to orbit camera, sets ignition to 0); otherwise loads the garage_v2 level with the current vehicle. | 385 |
| `gameplay_garageMode.stop()` | Exits garage mode: sets ignition back to level 3, unfreezes the vehicle, restores the camera and the freeroam state, then emits onEndGarageMode. | 445 |
| `gameplay_garageMode.testVehicle()` | Starts a job that makes the vehicle leave the garage (ai to the garageExit waypoint), fades to black then loads gridmap_v2 in freeroam with the current vehicle. | 537 |
| `gameplay_garageMode.vehicleByIdOrActive(vehicleId)` | Returns "Brand Name" of the given model, or of the active vehicle if none is provided. | 191 |
| `gameplay_garageMode.zoom(value)` | Zooms the camera progressively (limited acceleration); no effect outside garage mode. The zoom stops by itself after a short delay. | 211 |

### Parameter details

#### `gameplay_garageMode.getGarageMenuState()`

Returns the stored garage menu.

- **returns**: string|nil Menu name.

#### `gameplay_garageMode.getLastOwnedVehicleId()`

ID of the last owned vehicle entered, or the current one in career.

- **returns**: integer|nil Vehicle ID.

#### `gameplay_garageMode.getLighting()`

Returns the state of the three lighting groups.

- **returns**: boolean[] {west, middle, east}.

#### `gameplay_garageMode.isActive()`

Returns whether garage mode is active.

- **returns**: boolean true if active.

#### `gameplay_garageMode.isObjectsAutohide()`

Returns whether automatic hiding is active.

- **returns**: boolean Current state.

#### `gameplay_garageMode.onClientPreStartMission(levelPath)`

Hook before a level starts: activates garage mode if requested at load (unloads/reloads extensions), otherwise ends garage mode if it was active.

- `levelPath` (*string*) : Level path.

#### `gameplay_garageMode.onClientStartMission(levelPath)`

Hook at level start: replaces the vehicle with vehicleToLoad if it exists (never assigned in this file).

- `levelPath` (*string*) : Level path.

#### `gameplay_garageMode.onDeserialized(v)`

Extension reload hook: restores the active state.

- `v` (*table*) : Data from onSerialize.

#### `gameplay_garageMode.onEnterVehicleFinished(vehicleId)`

Hook: stores the entered vehicle as the last owned vehicle.

- `vehicleId` (*integer|nil*) : Vehicle ID.

#### `gameplay_garageMode.onGarageEnter(context, toRoute, fromRoute, data)`

UI navigation hook: fills data.layoutMenu (top bar with Garage/Tuning tabs, header, rails) and data.garage for the garage route.

- `context` (*table|nil*) : Navigation context.
- `toRoute` (*table|nil*) : Destination route (field name).
- `fromRoute` (*table|nil*) : Origin route (unused).
- `data` (*table*) : Route data table, modified in place.

#### `gameplay_garageMode.onSerialize()`

Extension reload hook: saves {active}.

- **returns**: table {active = boolean}.

#### `gameplay_garageMode.onSpawnCCallback(vehicleId)`

Spawn hook: requests that the vehicle spawns with the engine off (spawnWithEngineRunning = false).

- `vehicleId` (*integer*) : Vehicle ID.

#### `gameplay_garageMode.onThumbnailTriggered(active)`

Thumbnail capture hook: in garage_v2, exits garage mode and hides the east pillars (shows west/ceiling) during the capture, then re-enables the mode; shows/removes the GarageModeBlackscreen black screen.

- `active` (*boolean*) : true at the start of the capture, false at the end.

#### `gameplay_garageMode.onVehicleSpawned(vehicleId)`

Hook called when a vehicle spawns; in garage mode, teleports it to the garage level's spawn point and schedules the freeze.

- `vehicleId` (*integer*) : Vehicle ID.

#### `gameplay_garageMode.setCamera(preset)`

Starts a job that switches to orbit camera and applies a predefined default rotation.

- `preset` (*string|nil*) : default, front, back, side, left, right or top (default if nil).

#### `gameplay_garageMode.setGarageMenuState(state)`

Stores the open garage menu; the "paint" state marks the vehicle as modified.

- `state` (*string|nil*) : Menu name.

#### `gameplay_garageMode.setLighting(state)`

Turns the garage's three lighting groups on/off (west, middle, east).

- `state` (*boolean[]|nil*) : Array of 3 booleans; nil turns everything back on.

#### `gameplay_garageMode.setObjectsAutohide(v)`

Enables or disables the automatic hiding of the ceiling and pillars.

- `v` (*boolean*) : true to hide automatically.

#### `gameplay_garageMode.setVehicleDirty(vehicleDirty, switchedToNewVehicle)`

Intended to signal a modified vehicle in career; the guihook trigger is currently commented out, so the function does nothing observable.

- `vehicleDirty` (*boolean*) : Modified state.
- `switchedToNewVehicle` (*boolean|nil*) : Vehicle change.

#### `gameplay_garageMode.start(_useCurrentLocation, skipInventoryStep)`

Enters garage mode. With useCurrentLocation true, stays on the current map (career: checks that there are vehicles in the inventory, calls career_modules_inventory.onBeforeGarage, switches to orbit camera, sets ignition to 0); otherwise loads the garage_v2 level with the current vehicle.

- `_useCurrentLocation` (*boolean|nil*) : true to use the current location instead of loading garage_v2.
- `skipInventoryStep` (*boolean|nil*) : In career, skips the call to career_modules_inventory.onBeforeGarage.

#### `gameplay_garageMode.vehicleByIdOrActive(vehicleId)`

Returns "Brand Name" of the given model, or of the active vehicle if none is provided.

- `vehicleId` (*string|nil*) : Model key (jbeam folder name), despite its name.
- **returns**: string|nil "Brand Name" text or nil.

#### `gameplay_garageMode.zoom(value)`

Zooms the camera progressively (limited acceleration); no effect outside garage mode. The zoom stops by itself after a short delay.

- `value` (*number*) : Direction and intensity (positive or negative); 0 does nothing.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | core_jobsystem and core_vehicle_manager. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onEndGarageMode`
- `onUpdate` — listened to by 186 module(s)

**UI events (guihooks.trigger):** `FadeScreen`, `GarageModeBlackscreen`

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/garageMode.lua`.*
