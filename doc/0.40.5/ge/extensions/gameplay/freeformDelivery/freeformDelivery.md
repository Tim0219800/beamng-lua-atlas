# `gameplay_freeformDelivery_freeformDelivery`

*File: `lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua` · VM: Game Engine (GE) · 680 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_freeformDelivery_freeformDelivery`: `extensions.load("gameplay_freeformDelivery_freeformDelivery")`, then the global `gameplay_freeformDelivery_freeformDelivery`

Main module of the freeform delivery mode. It orchestrates the lifecycle of a delivery described by a delivery.delivery.json file: load (loading via the loader, vehicle setup, routes, odometer, action filter), start (goals, markers, tasklist, hints, timer), finish (stopping the UI, freezing vehicles, "finished" state), reset (back to the loaded state) and teardown (removing vehicles and unloading). Every frame it updates all submodules (goals, markers, tasklist, hints, routes, odometer, vehicleSleep), displays the timer and registers a radial menu (quickAccess) to finish the delivery or choose a route.

## Example

```lua
extensions.load('gameplay_freeformDelivery_freeformDelivery')
gameplay_freeformDelivery_freeformDelivery.load('gameplay/missions/driver_training/delivery/001-deliveryIntro/delivery.delivery.json')
-- wait for isLoaded() == true (asynchronous setup), then:
gameplay_freeformDelivery_freeformDelivery.start()
```

## Notes

- States: loading pending (setupPending), isLoaded (ready to start), isActive (in progress), isFinished (finished or failed, vehicles still present), isFailed + failReason. load() refuses to load if a delivery is already loaded, active or finished: call teardown() first.
- load() starts the setup asynchronously; isLoaded becomes true in onUpdate when setup and odometer are done. Maximum delay 20 s (SETUP_TIMEOUT_SECONDS), otherwise automatic teardown.
- load() blocks the following actions for player 0: vehicleTeleporting, vehicleMenues, physicsControls, aiControls, vehicleSwitching, freeCam, funStuff (freeformDeliveryBlockedActions group); teardown() unblocks them. It also calls gameplay_freeformDelivery_debug.toggleDebugWindow(), which actually opens nothing (see the debug module description).
- Time is measured with os.clock() (real time, not simulated time): pausing does not stop it.
- The automatic finish is triggered by gameplay_freeformDelivery_goals.updateCompletionTimer(dtReal); the manual finish goes through the radial menu /root/sandbox/delivery/ which emits onGameplayActivityAborted then finish().
- The quickAccess menu is only registered when the radial menu opens (onBeforeRadialOpened) and is removed in finish/teardown.
- Each function that changes state (start, finish, reset) returns false with a warning if the state does not allow it.
- The dependencies field is exposed and lists 20 extensions loaded beforehand (core_vehicles, core_gamestate, sitesManager, flowgraphManager, quickAccess, all freeformDelivery submodules, groundMarkers, actionFilter, genericMissionData). The comment indicates that setExtensionUnloadMode(M, "manual") is disabled.

**Dependencies (loaded first):** `core_vehicles`, `core_gamestate`, `gameplay_sites_sitesManager`, `core_flowgraphManager`, `core_quickAccess`, `gameplay_freeformDelivery_utils`, `gameplay_freeformDelivery_loader`, `gameplay_freeformDelivery_setup`, `gameplay_freeformDelivery_goals`, `gameplay_freeformDelivery_tasklist`, `gameplay_freeformDelivery_markers`, `gameplay_freeformDelivery_endScreen`, `gameplay_freeformDelivery_hints`, `gameplay_freeformDelivery_routes`, `gameplay_freeformDelivery_debug`, `gameplay_freeformDelivery_odometer`, `gameplay_freeformDelivery_vehicleSleep`, `core_groundMarkers`, `core_input_actionFilter`, `ui_apps_genericMissionData`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_freeformDelivery_freeformDelivery.cleanup()` | Old cleanup function, kept for compatibility: calls teardown() without arguments. | 666 |
| `gameplay_freeformDelivery_freeformDelivery.finish(failed, reason)` | Finishes the active delivery (successful or failed): records the elapsed time in currentDelivery.elapsedTime, hides markers, tasklist, hints, routes and odometer, freezes vehicles, clears the timer and switches to the finished state (isFinished). Goals remain evaluable. | 235 |
| `gameplay_freeformDelivery_freeformDelivery.getCurrentDelivery()` | Returns the current delivery table (loader data, plus elapsedTime after finish). | 174 |
| `gameplay_freeformDelivery_freeformDelivery.getFailReason()` | Returns the failure reason passed to finish. | 112 |
| `gameplay_freeformDelivery_freeformDelivery.getProgress()` | Returns the goal progress (gameplay_freeformDelivery_goals.getProgress) when the delivery is active or finished. | 296 |
| `gameplay_freeformDelivery_freeformDelivery.getResults()` | Returns the end statistics (gameplay_freeformDelivery_endScreen.collectStatistics) when the delivery is active or finished and has started. | 305 |
| `gameplay_freeformDelivery_freeformDelivery.getSetupPending()` | Returns whether the asynchronous setup is still in progress. | 183 |
| `gameplay_freeformDelivery_freeformDelivery.getStartTime()` | Returns the start time (os.clock()), 0 if not started. | 178 |
| `gameplay_freeformDelivery_freeformDelivery.isActive()` | Returns whether the delivery is in progress (goals and timer active). Used by quickAccess. | 97 |
| `gameplay_freeformDelivery_freeformDelivery.isFailed()` | Returns whether the delivery ended in failure. | 107 |
| `gameplay_freeformDelivery_freeformDelivery.isFinished()` | Returns whether the delivery is finished (successful or failed) but not yet torn down. | 102 |
| `gameplay_freeformDelivery_freeformDelivery.isLoaded()` | Returns whether loading and setup are complete (ready to start). | 170 |
| `gameplay_freeformDelivery_freeformDelivery.load(path)` | Loads a delivery: reads the file via gameplay_freeformDelivery_loader.load, installs vehicles and player (setup), prepares routes, odometer and vehicleSleep, blocks some actions and calls the debug window toggle. The setup finishes later (see isLoaded). | 117 |
| `gameplay_freeformDelivery_freeformDelivery.onBeforeRadialOpened()` | Hook: when the radial menu opens, registers the delivery's quickAccess entries (finish, routes). *(internal)* *(hook)* | 505 |
| `gameplay_freeformDelivery_freeformDelivery.onClientEndMission()` | Hook: level end; calls teardown(). *(internal)* *(hook)* | 674 |
| `gameplay_freeformDelivery_freeformDelivery.onExtensionUnloaded()` | Hook: extension unload; calls teardown(). *(internal)* *(hook)* | 670 |
| `gameplay_freeformDelivery_freeformDelivery.onQuickAccessLoaded()` | Hook: quickAccess reloaded; allows the entries to be registered again. *(internal)* *(hook)* | 509 |
| `gameplay_freeformDelivery_freeformDelivery.onUpdate(dtReal, dtSim, dtRaw)` | Called every frame: monitors the end of setup (and its 20 s timeout), then if the delivery is active updates the vehicle cache, goals, markers, tasklist, hints, routes, odometer and vehicleSleep, displays the timer via ui_apps_genericMissionData and finishes the delivery when the goal completion timer expires. *(internal)* *(hook)* | 538 |
| `gameplay_freeformDelivery_freeformDelivery.reset()` | Returns an active or finished delivery to the loaded state: cleans all submodules, unfreezes vehicles, restores their positions and redoes the player placement. start() must be called again afterwards. | 315 |
| `gameplay_freeformDelivery_freeformDelivery.start()` | Starts the loaded delivery: reconfigures routes, odometer and vehicleSleep, then activates goals, markers, tasklist and hints, and starts the timer. Requires isLoaded to be true and the delivery not to be already active. | 187 |
| `gameplay_freeformDelivery_freeformDelivery.teardown(keepVehicles)` | Completely tears down the delivery: unblocks actions, cleans submodules, unfreezes then removes the vehicles and the prefab (unless keepVehicles), clears raw POIs, removes the quickAccess menu and resets all states. No effect if nothing is loaded. | 624 |

### Parameter details

#### `gameplay_freeformDelivery_freeformDelivery.finish(failed, reason)`

Finishes the active delivery (successful or failed): records the elapsed time in currentDelivery.elapsedTime, hides markers, tasklist, hints, routes and odometer, freezes vehicles, clears the timer and switches to the finished state (isFinished). Goals remain evaluable.

- `failed` (*boolean|nil*) : true if the delivery is a failure.
- `reason` (*string|nil*) : Failure reason, kept in getFailReason.
- **returns**: boolean true if finished, false if there was no active delivery.

#### `gameplay_freeformDelivery_freeformDelivery.getCurrentDelivery()`

Returns the current delivery table (loader data, plus elapsedTime after finish).

- **returns**: table|nil Delivery, nil if none.

#### `gameplay_freeformDelivery_freeformDelivery.getFailReason()`

Returns the failure reason passed to finish.

- **returns**: string|nil Reason, nil otherwise.

#### `gameplay_freeformDelivery_freeformDelivery.getProgress()`

Returns the goal progress (gameplay_freeformDelivery_goals.getProgress) when the delivery is active or finished.

- **returns**: table|nil {total, completed, required, requiredCompleted, allRequiredComplete}, nil if only loaded.

#### `gameplay_freeformDelivery_freeformDelivery.getResults()`

Returns the end statistics (gameplay_freeformDelivery_endScreen.collectStatistics) when the delivery is active or finished and has started.

- **returns**: table|nil Statistics (time, goals, damage) or nil.

#### `gameplay_freeformDelivery_freeformDelivery.getSetupPending()`

Returns whether the asynchronous setup is still in progress.

- **returns**: boolean true as long as the setup is not finished.

#### `gameplay_freeformDelivery_freeformDelivery.getStartTime()`

Returns the start time (os.clock()), 0 if not started.

- **returns**: number Time in seconds.

#### `gameplay_freeformDelivery_freeformDelivery.isActive()`

Returns whether the delivery is in progress (goals and timer active). Used by quickAccess.

- **returns**: boolean true if active.

#### `gameplay_freeformDelivery_freeformDelivery.isFailed()`

Returns whether the delivery ended in failure.

- **returns**: boolean true if failed.

#### `gameplay_freeformDelivery_freeformDelivery.isFinished()`

Returns whether the delivery is finished (successful or failed) but not yet torn down.

- **returns**: boolean true if finished.

#### `gameplay_freeformDelivery_freeformDelivery.isLoaded()`

Returns whether loading and setup are complete (ready to start).

- **returns**: boolean true if ready.

#### `gameplay_freeformDelivery_freeformDelivery.load(path)`

Loads a delivery: reads the file via gameplay_freeformDelivery_loader.load, installs vehicles and player (setup), prepares routes, odometer and vehicleSleep, blocks some actions and calls the debug window toggle. The setup finishes later (see isLoaded).

- `path` (*string*) : Path of the delivery.delivery.json file.
- **returns**: boolean true if loading started, false if a delivery is already in place or if the file/setup failed.

#### `gameplay_freeformDelivery_freeformDelivery.onUpdate(dtReal, dtSim, dtRaw)`

Called every frame: monitors the end of setup (and its 20 s timeout), then if the delivery is active updates the vehicle cache, goals, markers, tasklist, hints, routes, odometer and vehicleSleep, displays the timer via ui_apps_genericMissionData and finishes the delivery when the goal completion timer expires.

- `dtReal` (*number*) : Real-time delta.
- `dtSim` (*number*) : Simulated time delta.
- `dtRaw` (*number*) : Raw time delta.

#### `gameplay_freeformDelivery_freeformDelivery.reset()`

Returns an active or finished delivery to the loaded state: cleans all submodules, unfreezes vehicles, restores their positions and redoes the player placement. start() must be called again afterwards.

- **returns**: boolean true if reset, false if there is nothing to reset.

#### `gameplay_freeformDelivery_freeformDelivery.start()`

Starts the loaded delivery: reconfigures routes, odometer and vehicleSleep, then activates goals, markers, tasklist and hints, and starts the timer. Requires isLoaded to be true and the delivery not to be already active.

- **returns**: boolean true if started.

#### `gameplay_freeformDelivery_freeformDelivery.teardown(keepVehicles)`

Completely tears down the delivery: unblocks actions, cleans submodules, unfreezes then removes the vehicles and the prefab (unless keepVehicles), clears raw POIs, removes the quickAccess menu and resets all states. No effect if nothing is loaded.

- `keepVehicles` (*boolean|nil*) : true to keep the spawned vehicles (false by default).

## Fields

| Field | Type | Description |
|---|---|---|
| `debug` | table | Debug configuration read by the submodules: {enabled = false, targetAreas = {location, zone, parkingSpot = true}, p = nil (LuaProfiler)}. |
| `dependencies` | string[] | Extensions loaded beforehand: core_vehicles, core_gamestate, gameplay_sites_sitesManager, core_flowgraphManager, core_quickAccess, gameplay_freeformDelivery_{utils, loader, setup, goals, tasklist, markers, endScreen, hints, routes, debug, odometer, vehicleSleep}, core_groundMarkers, core_input_actionFilter, ui_apps_genericMissionData. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onGameplayActivityAborted`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua`.*
