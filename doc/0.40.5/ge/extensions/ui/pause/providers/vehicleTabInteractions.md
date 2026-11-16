# `ui_pause_providers_vehicleTabInteractions`

*File: `lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua` · VM: Game Engine (GE) · 1775 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_pause_providers_vehicleTabInteractions`: `extensions.load("ui_pause_providers_vehicleTabInteractions")`, then the global `ui_pause_providers_vehicleTabInteractions`

Data and action provider for the "Vehicle" tab (and vehicle management) of the pause menu. It lists the spawned vehicles (excluding the on-foot "unicycle" character, inactive vehicles or vehicles the player cannot use), their controller (player, AI, multiplayer), their AI mode (polled every 8 s via core_vehicleBridge), and builds the action buttons for each vehicle (switch vehicle, exit, AI modes, repair, reset, clone, delete, delete all but this one, open details) taking into account multiplayer permissions and the first-drive state. It also highlights in orange the hovered or selected vehicle with the debugDrawer. Payloads are sent to the UI either by direct call or by stream (guihooks.triggerStream) for asynchronous hydration.

## Example

```lua
local data = ui_pause_providers_vehicleTabInteractions.getSpawnedVehiclesData({mode = "freeroam"})
for _, v in ipairs(data.vehicles) do print(v.vehicleId, v.label, v.aiMode) end
-- run an action from its buttonId
ui_pause_providers_vehicleTabInteractions.executeVehicleTabInteractionAction(data.vehicles[1].cardActions.switchToVehicle.buttonId)
```

## Notes

- Emitted guihooks streams: ui_pause_vehicleTabInteractions_vehicle_state (vehicle state: controllerType, controllingPlayerNums, multiSeatLocal, onlineControlled, aiMode, aiControlled, controllerUiElements), ui_pause_vehicleTabInteractions_spawned_payload and ui_pause_vehicleTabInteractions_spawned_selected_payload (hydrated payloads). UI event: VehicleTabSpawnFinished when a vehicle has spawned.
- Actions are buttons (gridSelectorUtils/buttonModule) cached per vehicle: switchToVehicle, switchToVehicle_p<N> (multi-seat), deleteVehicle, repairVehicleHere, resetVehicle, cloneVehicle, aiModeFlee/Chase/Follow/Random/Traffic/Disable, removeAllOtherVehicles, exitVehicle, openVehicleDetails(Home|Manage), setOtherVehiclesAiMode_<mode>. They are executed by buttonId via executeVehicleTabInteractionAction.
- The flee, chase and follow AI modes send ai.setMode then ai.setTargetObjectID with the player vehicle as target; random sends ai.setState({mode = "random"}); traffic sends ai.setMode("traffic"); disable sends ai.setMode("disabled"). The "disabled" mode is normalized to "none" on the display side.
- Repair, reset and repair during first drive with a foreground mission are blocked; repair uses spawn.safeTeleport at the current position, reset uses requestReset(RESET_PHYSICS) and resetBrokenFlexMesh. Clone temporarily switches the player to the source vehicle (be:enterVehicle) to call core_vehicles.cloneCurrent then returns to the original vehicle; cloning goes through gameplay_lowPerformance.confirmSpawn if it exists.
- Multiplayer permissions are checked by multiplayer_permissions.checkPlayerPermission (removeVehicle, recoverVehicle, resetVehicle, spawnVehicle); without multiplayer everything is allowed.
- Hooks emitted by the actions: trackNewVeh, onVehicleSwitchPerformendByUser (the "Performend" typo is in the game's hook name), onVehicleTabInteractionRemoveVehicle(vehicleId), onVehicleTabInteractionRemoveAll(selectedId).
- The module acts (periodic update, highlighting) only when the router's current route is pause or pause.vehicle* / pause.manageVehicles* (flag set by onPauseRouteLifecycle); outside these routes, onUpdate resets hover and deferred requests.
- The asynchronous hydration debug delay (setAsyncHydrationDebugDelay) artificially delays request responses; it is meant for UI review, not for normal use.
- In getSpawnedVehiclesPayload (called by getSpawnedVehiclesData, getSpawnedSelectedVehicleData, etc.), each call resets the state, emits the state stream and restarts the AI mode request: these functions therefore have side effects, not just reads.

**Dependencies (loaded first):** `core_vehicleBridge`, `core_locales`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_pause_providers_vehicleTabInteractions.executeVehicleTabInteractionAction(buttonId, payload)` | Executes the action button identified by buttonId (buttonId field of the action entries returned in the payloads), with an optional payload. | 1607 |
| `ui_pause_providers_vehicleTabInteractions.getAsyncHydrationDebugDelay()` | Returns the current asynchronous hydration debug delay, in seconds. | 1650 |
| `ui_pause_providers_vehicleTabInteractions.getSpawnedSelectedVehicleData(context)` | Details of the selected vehicle: vehicleId, label, rawName, vehicle (list entry) and groups (action groups). The selection comes from the route's vehicleId parameter, otherwise the last chosen vehicle, otherwise the player's vehicle, otherwise the first in the list. | 1662 |
| `ui_pause_providers_vehicleTabInteractions.getSpawnedSelectedVehicleShellData(context)` | Skeleton of the selected vehicle's details (label, disabled action groups, loading = true), without full computation. | 1629 |
| `ui_pause_providers_vehicleTabInteractions.getSpawnedVehiclesData(context)` | Full payload of the spawned vehicles: mode, summary {currentVehicleName, totalCount, aiControlledCount}, selectedVehicleId, aiOtherVehiclesMode, aiModeOptions, vehicles (id, vehicleId, index, displayNumber, label, rawName, isCurrent, controllerType, aiMode, aiControlled, cardActions...), actions (global actions) and lowPerformance. Side effects: resets the state and restarts AI mode polling. | 1612 |
| `ui_pause_providers_vehicleTabInteractions.getSpawnedVehiclesShellData(context)` | "Skeleton" version of the payload, without querying the vehicles: asyncHydration and loading are true, empty list, actions disabled. Used to display the screen immediately before hydration. | 1616 |
| `ui_pause_providers_vehicleTabInteractions.getSpawnedVehiclesSummaryData(context)` | Returns only summary and vehicles from the spawned vehicles payload. | 1654 |
| `ui_pause_providers_vehicleTabInteractions.onPauseRouteLifecycle(routeName)` | Hook called by routeLifecycleCallbacks on entering and leaving a pause route, with the target route name. Enables or disables tracking (hover, AI polling) and resets vehicle numbering when leaving the pause family. *(internal)* *(hook)* | 1666 |
| `ui_pause_providers_vehicleTabInteractions.onUpdate(dtReal, dtSim, dtRaw)` | Hook called every frame. When tracking is active on a vehicle route: processes deferred requests, restarts AI mode polling every 8 s of simulation time and draws a pulsing white-orange frame (12 edges of the bounding box, thickness 3) around the hovered or detailed vehicle, via debugDrawer.drawLineInstance. Without a box, draws a 2 m vertical line. *(internal)* *(hook)* | 1697 |
| `ui_pause_providers_vehicleTabInteractions.onVehicleDestroyed()` | Hook called when a vehicle is destroyed: recomputes the vehicle state for the UI if tracking is active. *(internal)* *(hook)* | 1685 |
| `ui_pause_providers_vehicleTabInteractions.onVehicleHoverEnd(vehicleId)` | Called by the UI when the cursor leaves the card: removes the highlight if it is that vehicle (or if vehicleId is nil). *(internal)* *(hook)* | 1693 |
| `ui_pause_providers_vehicleTabInteractions.onVehicleHoverStart(vehicleId)` | Called by the UI when the cursor hovers a vehicle's card: that vehicle will be highlighted in the world. *(internal)* *(hook)* | 1689 |
| `ui_pause_providers_vehicleTabInteractions.onVehicleSpawned()` | Hook called when a vehicle spawns: recomputes the state if the route requires it and triggers the UI event VehicleTabSpawnFinished. *(internal)* *(hook)* | 1680 |
| `ui_pause_providers_vehicleTabInteractions.onVehicleSwitchPerformendByUser()` | Hook emitted after a vehicle switch requested by the user from the menu: same handling as onVehicleSwitched. *(internal)* *(hook)* | 1675 |
| `ui_pause_providers_vehicleTabInteractions.onVehicleSwitched()` | Hook called when the player's vehicle changes: re-emits the vehicle state to the UI and resets the AI polling timer. *(internal)* *(hook)* | 1670 |
| `ui_pause_providers_vehicleTabInteractions.requestSpawnedSelectedVehiclePayload(payload)` | Asynchronous version of the selected vehicle's details: emits the result on the ui_pause_vehicleTabInteractions_spawned_selected_payload stream. | 1633 |
| `ui_pause_providers_vehicleTabInteractions.requestSpawnedVehiclesPayload(payload)` | Requests asynchronous hydration: computes the payload and sends it on the ui_pause_vehicleTabInteractions_spawned_payload stream (with asyncHydration, loading = false, requestId). If a debug delay is active, the response is queued and a loading acknowledgment is returned. | 1620 |
| `ui_pause_providers_vehicleTabInteractions.setAsyncHydrationDebugDelay(delaySec)` | Sets an artificial delay (seconds, minimum 0) before responding to asynchronous requests; 0 disables it and empties the queue. | 1642 |

### Parameter details

#### `ui_pause_providers_vehicleTabInteractions.executeVehicleTabInteractionAction(buttonId, payload)`

Executes the action button identified by buttonId (buttonId field of the action entries returned in the payloads), with an optional payload.

- `buttonId` (*any*) : Button identifier provided by buttonModule (inferred from code)
- `payload` (*any*) : Data passed to the button callback (inferred from code)
- **returns**: boolean false if buttonId is missing, otherwise the button execution result

#### `ui_pause_providers_vehicleTabInteractions.getAsyncHydrationDebugDelay()`

Returns the current asynchronous hydration debug delay, in seconds.

- **returns**: number Delay in seconds (0 = disabled)

#### `ui_pause_providers_vehicleTabInteractions.getSpawnedSelectedVehicleData(context)`

Details of the selected vehicle: vehicleId, label, rawName, vehicle (list entry) and groups (action groups). The selection comes from the route's vehicleId parameter, otherwise the last chosen vehicle, otherwise the player's vehicle, otherwise the first in the list.

- `context` (*table|nil*) : Pause context
- **returns**: table {vehicleId, label, rawName, vehicle, groups}

#### `ui_pause_providers_vehicleTabInteractions.getSpawnedSelectedVehicleShellData(context)`

Skeleton of the selected vehicle's details (label, disabled action groups, loading = true), without full computation.

- `context` (*table|nil*) : Pause context
- **returns**: table Loading payload

#### `ui_pause_providers_vehicleTabInteractions.getSpawnedVehiclesData(context)`

Full payload of the spawned vehicles: mode, summary {currentVehicleName, totalCount, aiControlledCount}, selectedVehicleId, aiOtherVehiclesMode, aiModeOptions, vehicles (id, vehicleId, index, displayNumber, label, rawName, isCurrent, controllerType, aiMode, aiControlled, cardActions...), actions (global actions) and lowPerformance. Side effects: resets the state and restarts AI mode polling.

- `context` (*table|nil*) : Pause context; only context.mode is read (default "freeroam")
- **returns**: table Vehicles payload

#### `ui_pause_providers_vehicleTabInteractions.getSpawnedVehiclesShellData(context)`

"Skeleton" version of the payload, without querying the vehicles: asyncHydration and loading are true, empty list, actions disabled. Used to display the screen immediately before hydration.

- `context` (*table|nil*) : Pause context (mode)
- **returns**: table Loading payload

#### `ui_pause_providers_vehicleTabInteractions.getSpawnedVehiclesSummaryData(context)`

Returns only summary and vehicles from the spawned vehicles payload.

- `context` (*table|nil*) : Pause context
- **returns**: table {summary, vehicles}

#### `ui_pause_providers_vehicleTabInteractions.onPauseRouteLifecycle(routeName)`

Hook called by routeLifecycleCallbacks on entering and leaving a pause route, with the target route name. Enables or disables tracking (hover, AI polling) and resets vehicle numbering when leaving the pause family.

- `routeName` (*string|nil*) : Target route name

#### `ui_pause_providers_vehicleTabInteractions.onUpdate(dtReal, dtSim, dtRaw)`

Hook called every frame. When tracking is active on a vehicle route: processes deferred requests, restarts AI mode polling every 8 s of simulation time and draws a pulsing white-orange frame (12 edges of the bounding box, thickness 3) around the hovered or detailed vehicle, via debugDrawer.drawLineInstance. Without a box, draws a 2 m vertical line.

- `dtReal` (*number*) : Real time (s)
- `dtSim` (*number*) : Simulation time (s)
- `dtRaw` (*number*) : Raw time (s)

#### `ui_pause_providers_vehicleTabInteractions.onVehicleHoverEnd(vehicleId)`

Called by the UI when the cursor leaves the card: removes the highlight if it is that vehicle (or if vehicleId is nil).

- `vehicleId` (*number|nil*) : Vehicle id

#### `ui_pause_providers_vehicleTabInteractions.onVehicleHoverStart(vehicleId)`

Called by the UI when the cursor hovers a vehicle's card: that vehicle will be highlighted in the world.

- `vehicleId` (*number*) : ID of the hovered vehicle

#### `ui_pause_providers_vehicleTabInteractions.requestSpawnedSelectedVehiclePayload(payload)`

Asynchronous version of the selected vehicle's details: emits the result on the ui_pause_vehicleTabInteractions_spawned_selected_payload stream.

- `payload` (*table|nil*) : {requestId, context}
- **returns**: table Emitted payload, or loading acknowledgment in debug delay mode

#### `ui_pause_providers_vehicleTabInteractions.requestSpawnedVehiclesPayload(payload)`

Requests asynchronous hydration: computes the payload and sends it on the ui_pause_vehicleTabInteractions_spawned_payload stream (with asyncHydration, loading = false, requestId). If a debug delay is active, the response is queued and a loading acknowledgment is returned.

- `payload` (*table|nil*) : {requestId, context}
- **returns**: table Emitted payload, or loading acknowledgment in debug delay mode

#### `ui_pause_providers_vehicleTabInteractions.setAsyncHydrationDebugDelay(delaySec)`

Sets an artificial delay (seconds, minimum 0) before responding to asynchronous requests; 0 disables it and empties the queue.

- `delaySec` (*number*) : Delay in seconds
- **returns**: number Delay actually applied

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | {'core_vehicleBridge', 'core_locales'} |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onVehicleSwitchPerformendByUser` — listened to by 1 module(s)
- `onVehicleTabInteractionRemoveAll`
- `onVehicleTabInteractionRemoveVehicle`
- `trackNewVeh`

**UI events (guihooks.trigger):** `VehicleTabSpawnFinished`

## Calls into the engine (C++)

- `be:` `enterVehicle`, `getObject`, `getObjectCount`, `getPlayerVehicleID`
- `debugDrawer:` `drawLineInstance`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua`.*
