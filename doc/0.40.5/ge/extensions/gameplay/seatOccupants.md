# `gameplay_seatOccupants`

*File: `lua/ge/extensions/gameplay/seatOccupants.lua` · VM: Game Engine (GE) · 2030 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_seatOccupants`: `extensions.load("gameplay_seatOccupants")`, then the global `gameplay_seatOccupants`

Vehicle seat and occupant system. It records which player (or dummy occupant) occupies which seat of each vehicle (occupancy[vehId][seatId]) and the "presence" of each player (vehicle, optional seat, permission mode). It applies the occupants' weight to the vehicle, shows or hides occupant meshes (depending on the camera and the enableSeatOccupants setting), handles the seat camera, the blocking of driving controls for a passenger (action maps mask) and exiting the vehicle. Vehicles without a seat configuration (occupantSystem / occupantSlotsById in the JBeam data) do not go through this system. Useful to modders for putting a player in a specific seat, adding weighted dummy passengers or finding out who is driving.

## Example

```lua
-- seat player 0 as a passenger in seat "RR"
gameplay_seatOccupants.requestEnterSeat(vehId, 'RR', 0)
-- add an 80 kg dummy passenger
gameplay_seatOccupants.setDummyOccupant(vehId, 'FR', 80)
print(dumps(gameplay_seatOccupants.getSeats(vehId)))
```

## Notes

- Permission modes (gameplay/vehiclePresencePolicy): 'driver' (driving controls), 'passenger' (no controls), 'unrestricted' (all). Without a seat, the default mode is 'unrestricted' in freeroam outside multiseat, otherwise 'passenger'.
- Default occupant weight: 89 (kg). cheeseburger / salad add / remove 10 kg to all occupants of the vehicle, clamped between 49 and 119.
- Seat identifiers (seatId) come from the vehicle's "<seatId>Occupant" cargo groups (for example FL, FR). The driver seat is the one whose defaultPermissionMode is 'driver', otherwise FR (right-hand drive) or FL.
- Unicycle (walking) is excluded from the seat system.
- Debug fields: debugDisableOccupantSystem restores the old behavior (everyone 'unrestricted', no seats); debugDisableOccupantWeight; enablePresenceDebugMessages displays presence changes; enableSeatEjection (false by default) lets enterSeat eject the current occupant of an occupied seat and take their place.
- Serialization: version 2 ({version, playerPresence, seatClaims, occupancy}); restoration also accepts the old "occupancy"-only format.

**Dependencies (loaded first):** `core_camera`, `core_vehicle_manager`, `core_input_actionFilter`, `core_gamestate`, `core_multiseat`, `ui_vehicleSelector_vehicleSpecifications`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_seatOccupants.canEnterVehicle(vehId, player)` | Indicates whether the player can enter the vehicle (vehicle switching or walking allowed). | 365 |
| `gameplay_seatOccupants.cheeseburger(vehId)` | Adds 10 kg to each occupant (clamped to 119) and displays a message with the weight. | 1497 |
| `gameplay_seatOccupants.clearDummyOccupant(vehId, seatId)` | Removes the dummy occupant from a seat. | 1422 |
| `gameplay_seatOccupants.clearDummyOccupants(vehId)` | Removes all dummy occupants from a vehicle, or from all vehicles if vehId is nil. | 1434 |
| `gameplay_seatOccupants.clearOccupied(vehId, seatIdOrPlayer)` | Frees seats. Without a second argument: all occupants of the vehicle. With a number: removes that player from all vehicles. | 875 |
| `gameplay_seatOccupants.enterSeat(vehId, triggerId, player)` | Entry point of a seat's "enterSeat" trigger: finds the seat from the trigger then calls requestEnterSeat. In debug mode, enters 'unrestricted' without a seat. | 1597 |
| `gameplay_seatOccupants.getDriverPlayer(vehId)` | Lowest player index allowed to drive the vehicle ('driver' or 'unrestricted' mode). | 1388 |
| `gameplay_seatOccupants.getOccupantSystemVersion(vehId)` | Declared version of the occupant system in the vehicle data. | 80 |
| `gameplay_seatOccupants.getPlayerPresence(player)` | Copy of a player's presence in a vehicle. | 287 |
| `gameplay_seatOccupants.getSeatExitData(player, vehId)` | Computes where the player exits the vehicle: a point beside the body, on the seat side (exitNode/exitSide of the slot, otherwise side inferred from the position), offset 0.7 m beyond the body. | 1520 |
| `gameplay_seatOccupants.getSeats(vehId)` | Lists the seats of a vehicle with their state. | 1322 |
| `gameplay_seatOccupants.getVehiclePresences(vehId)` | List of player presences in a vehicle, sorted by player. | 1371 |
| `gameplay_seatOccupants.onBeforeVehicleReplaced(vehId)` | Hook before a vehicle is replaced: remembers whether it had no seat system. *(internal)* *(hook)* | 1809 |
| `gameplay_seatOccupants.onBeforeWalkingModeToggled(enabled, _, player)` | Hook before the walking mode toggle: if the player switches to walking, lifts the driving block. *(internal)* *(hook)* | 1878 |
| `gameplay_seatOccupants.onCameraChanged(player, camName, vid)` | Hook: a player's camera changes; updates occupant visibility (e.g. hide the head in first-person view). *(internal)* *(hook)* | 1756 |
| `gameplay_seatOccupants.onClientStartMission()` | Hook: clears occupant overrides and occupies player 0's current vehicle. *(internal)* *(hook)* | 1865 |
| `gameplay_seatOccupants.onDeserialized(data)` | Hook: restores the state after a Lua reload. *(internal)* *(hook)* | 1971 |
| `gameplay_seatOccupants.onExtensionLoaded(data)` | Hook: restores the serialized state if it exists, otherwise occupies the existing players. *(internal)* *(hook)* | 1939 |
| `gameplay_seatOccupants.onExtensionUnloaded()` | Hook: removes the overrides, restores the cameras and frees the action maps mask. *(internal)* *(hook)* | 1952 |
| `gameplay_seatOccupants.onLocalParticipantsChanged()` | Hook: recalculates presences and visuals when the local participants change. *(internal)* *(hook)* | 1870 |
| `gameplay_seatOccupants.onSerialize()` | Hook: serializes presences and occupied seats before a Lua reload. *(internal)* *(hook)* | 1962 |
| `gameplay_seatOccupants.onSettingsChanged()` | Hook: reapplies the occupant visuals (enableSeatOccupants setting). *(internal)* *(hook)* | 1746 |
| `gameplay_seatOccupants.onSplitScreenChanged()` | Hook: recalculates presences and visuals after a split-screen change. *(internal)* *(hook)* | 1750 |
| `gameplay_seatOccupants.onVehicleDestroyed(vehId)` | Hook: frees all occupancy and presence data of the destroyed vehicle. *(internal)* *(hook)* | 1833 |
| `gameplay_seatOccupants.onVehicleReplaced(vehId)` | Hook after replacement: reapplies the state and reassigns unseated players. *(internal)* *(hook)* | 1813 |
| `gameplay_seatOccupants.onVehicleResetted(vehId)` | Hook: reapplies weight and visuals after a reset. *(internal)* *(hook)* | 1826 |
| `gameplay_seatOccupants.onVehicleSpawned(vehId)` | Hook: reapplies weight and visuals for a vehicle that has just appeared. *(internal)* *(hook)* | 1793 |
| `gameplay_seatOccupants.onVehicleSwitched(oldId, newId, player)` | Hook: the player changes vehicle; updates their occupancy. *(internal)* *(hook)* | 1612 |
| `gameplay_seatOccupants.onVehicleTriggerActionLabel(data)` | Hook to customize the label and icon of the "enterSeat" action of a seat trigger ("Sit here", driver or passenger seat). *(internal)* *(hook)* | 1067 |
| `gameplay_seatOccupants.refreshOccupantMeshes(vehId)` | Reasserts the visibility of occupant meshes after a change made without going through the sync hooks (used by gameplay_traffic). | 646 |
| `gameplay_seatOccupants.requestEnterBestSeat(vehId, player, walkingPos)` | Picks a free seat (taking the walking position into account if any) and seats the player there. With no free seat, falls back to unseated presence if the default mode is 'unrestricted', otherwise shows "vehicle full". | 1202 |
| `gameplay_seatOccupants.requestEnterSeat(vehId, seatId, player, permissionOverride)` | Asks a player to sit in a given seat, entering the vehicle if needed (on foot or by switching vehicle). If the player is already in this seat, they exit (switch to walking mode). Shows a message if the seat is taken, if the player cannot leave their seat, or if the vehicle is not accessible. | 1138 |
| `gameplay_seatOccupants.requestUnseatedPresence(player, vehId, permissionMode)` | Places a player in the vehicle without a seat ("unseated" presence), with an optional permission mode. | 1217 |
| `gameplay_seatOccupants.salad(vehId)` | Removes 10 kg from each occupant (clamped to 49) and displays a message with the weight. | 1501 |
| `gameplay_seatOccupants.setDummyOccupant(vehId, seatId, weight)` | Places a dummy occupant (randomly colored mesh) with a weight in a free seat. | 1400 |
| `gameplay_seatOccupants.setOccupied(vehId, seatId, player, weight, permissionOverride)` | Places a player in a seat (no animation or vehicle change). Frees their other seats, records the presence, applies the weight, updates the controls and the camera. | 842 |
| `gameplay_seatOccupants.setPlayerPermissionMode(player, permissionMode)` | Changes the permission mode of a player already present in a vehicle. | 478 |
| `gameplay_seatOccupants.setVehicleOccupantsEnabledOverride(vehId, enabled)` | Forces the display (true) or hiding (false) of a vehicle's occupants, regardless of the global setting; nil removes the override. | 1718 |
| `gameplay_seatOccupants.showVehicleFullMessage(player)` | Shows the "vehicle full" UI message to the player. | 379 |
| `gameplay_seatOccupants.switchSeat(player, direction)` | Moves to the next free seat (direction > 0) or the previous one (direction < 0) of the current vehicle, with the driver at the head of the list. | 1254 |
| `gameplay_seatOccupants.toggleUnseated(player)` | Toggles between "seated" and "unseated" in the current vehicle. | 1300 |
| `gameplay_seatOccupants.usesSeatSystem(vehId)` | Indicates whether the vehicle uses the seat system (occupantSystem.enabled, otherwise presence of occupant slots in the vehicle data). Always false if debugDisableOccupantSystem. | 85 |

### Parameter details

#### `gameplay_seatOccupants.canEnterVehicle(vehId, player)`

Indicates whether the player can enter the vehicle (vehicle switching or walking allowed).

- `vehId` (*integer*) : Vehicle identifier.
- `player` (*integer|nil*) : Player index (0 by default).
- **returns**: boolean true if entering is possible.

#### `gameplay_seatOccupants.cheeseburger(vehId)`

Adds 10 kg to each occupant (clamped to 119) and displays a message with the weight.

- `vehId` (*integer|nil*) : Vehicle; default the player 0 vehicle.
- **returns**: number|nil Displayed weight, nil if no occupant.

#### `gameplay_seatOccupants.clearDummyOccupant(vehId, seatId)`

Removes the dummy occupant from a seat.

- `vehId` (*integer*) : Vehicle identifier.
- `seatId` (*string*) : Seat.
- **returns**: boolean true if removed.
- **returns**: string|nil 'notDummy' if there is nothing to remove.

#### `gameplay_seatOccupants.clearDummyOccupants(vehId)`

Removes all dummy occupants from a vehicle, or from all vehicles if vehId is nil.

- `vehId` (*integer|nil*) : Targeted vehicle.
- **returns**: integer Number of occupants removed.

#### `gameplay_seatOccupants.clearOccupied(vehId, seatIdOrPlayer)`

Frees seats. Without a second argument: all occupants of the vehicle. With a number: removes that player from all vehicles.

- `vehId` (*integer|nil*) : Vehicle identifier.
- `seatIdOrPlayer` (*string|integer|nil*) : Nil for the whole vehicle, a number for a player; a seat name is handled by the rest of the function (inferred from code).

#### `gameplay_seatOccupants.enterSeat(vehId, triggerId, player)`

Entry point of a seat's "enterSeat" trigger: finds the seat from the trigger then calls requestEnterSeat. In debug mode, enters 'unrestricted' without a seat.

- `vehId` (*integer*) : Vehicle identifier.
- `triggerId` (*any*) : Seat trigger identifier.
- `player` (*integer|nil*) : Player (0 by default).
- **returns**: boolean|nil true if seated.

#### `gameplay_seatOccupants.getDriverPlayer(vehId)`

Lowest player index allowed to drive the vehicle ('driver' or 'unrestricted' mode).

- `vehId` (*integer*) : Vehicle identifier.
- **returns**: integer|nil Driver index, nil if there are only passengers.

#### `gameplay_seatOccupants.getOccupantSystemVersion(vehId)`

Declared version of the occupant system in the vehicle data.

- `vehId` (*integer*) : Vehicle identifier.
- **returns**: any|nil Version, or nil if absent.

#### `gameplay_seatOccupants.getPlayerPresence(player)`

Copy of a player's presence in a vehicle.

- `player` (*integer|nil*) : Player index (0 by default).
- **returns**: table|nil {vehicleId, seatId?, permissionMode, permissionOverride?} or nil.

#### `gameplay_seatOccupants.getSeatExitData(player, vehId)`

Computes where the player exits the vehicle: a point beside the body, on the seat side (exitNode/exitSide of the slot, otherwise side inferred from the position), offset 0.7 m beyond the body.

- `player` (*integer|nil*) : Player (0 by default).
- `vehId` (*integer|nil*) : Vehicle; default the player's vehicle.
- **returns**: vec3|nil Exit position.
- **returns**: vec3|nil Seat position.

#### `gameplay_seatOccupants.getSeats(vehId)`

Lists the seats of a vehicle with their state.

- `vehId` (*integer*) : Vehicle identifier.
- **returns**: table[] Items {seatId, isDriver, occupied, occupantType ('player'|'dummy'), player, weight, color, permissionMode, displayName, defaultPermissionMode, cameraName, actionMaps, seatExitNode, seatExitSide, partPath, seatPartPath}.

#### `gameplay_seatOccupants.getVehiclePresences(vehId)`

List of player presences in a vehicle, sorted by player.

- `vehId` (*integer*) : Vehicle identifier.
- **returns**: table[] Items {player, seatId, permissionMode, unseated}.

#### `gameplay_seatOccupants.onBeforeVehicleReplaced(vehId)`

Hook before a vehicle is replaced: remembers whether it had no seat system.

- `vehId` (*integer*) : Vehicle identifier.

#### `gameplay_seatOccupants.onBeforeWalkingModeToggled(enabled, _, player)`

Hook before the walking mode toggle: if the player switches to walking, lifts the driving block.

- `enabled` (*boolean*) : true if switching to walking.
- `_` (*any*) : Not used.
- `player` (*integer|nil*) : Player index.

#### `gameplay_seatOccupants.onCameraChanged(player, camName, vid)`

Hook: a player's camera changes; updates occupant visibility (e.g. hide the head in first-person view).

- `player` (*integer|nil*) : Player index.
- `camName` (*string*) : Camera name.
- `vid` (*integer|nil*) : Camera vehicle.

#### `gameplay_seatOccupants.onDeserialized(data)`

Hook: restores the state after a Lua reload.

- `data` (*table*) : Data from onSerialize.

#### `gameplay_seatOccupants.onExtensionLoaded(data)`

Hook: restores the serialized state if it exists, otherwise occupies the existing players.

- `data` (*table|nil*) : Serialized data.

#### `gameplay_seatOccupants.onSerialize()`

Hook: serializes presences and occupied seats before a Lua reload.

- **returns**: table {version, playerPresence, seatClaims, occupancy}.

#### `gameplay_seatOccupants.onVehicleDestroyed(vehId)`

Hook: frees all occupancy and presence data of the destroyed vehicle.

- `vehId` (*integer*) : Vehicle identifier.

#### `gameplay_seatOccupants.onVehicleReplaced(vehId)`

Hook after replacement: reapplies the state and reassigns unseated players.

- `vehId` (*integer*) : Vehicle identifier.

#### `gameplay_seatOccupants.onVehicleResetted(vehId)`

Hook: reapplies weight and visuals after a reset.

- `vehId` (*integer*) : Vehicle identifier.

#### `gameplay_seatOccupants.onVehicleSpawned(vehId)`

Hook: reapplies weight and visuals for a vehicle that has just appeared.

- `vehId` (*integer*) : Vehicle identifier.

#### `gameplay_seatOccupants.onVehicleSwitched(oldId, newId, player)`

Hook: the player changes vehicle; updates their occupancy.

- `oldId` (*integer*) : Old vehicle.
- `newId` (*integer*) : New vehicle.
- `player` (*integer|nil*) : Player index.

#### `gameplay_seatOccupants.onVehicleTriggerActionLabel(data)`

Hook to customize the label and icon of the "enterSeat" action of a seat trigger ("Sit here", driver or passenger seat).

- `data` (*table*) : Modified table (actionName, vehicleId, player, title, icon).

#### `gameplay_seatOccupants.refreshOccupantMeshes(vehId)`

Reasserts the visibility of occupant meshes after a change made without going through the sync hooks (used by gameplay_traffic).

- `vehId` (*integer*) : Vehicle identifier.

#### `gameplay_seatOccupants.requestEnterBestSeat(vehId, player, walkingPos)`

Picks a free seat (taking the walking position into account if any) and seats the player there. With no free seat, falls back to unseated presence if the default mode is 'unrestricted', otherwise shows "vehicle full".

- `vehId` (*integer*) : Vehicle identifier.
- `player` (*integer|nil*) : Player.
- `walkingPos` (*vec3|nil*) : Position of the player on foot, used to pick the nearest seat.
- **returns**: boolean|nil nil if the vehicle does not use the seat system.

#### `gameplay_seatOccupants.requestEnterSeat(vehId, seatId, player, permissionOverride)`

Asks a player to sit in a given seat, entering the vehicle if needed (on foot or by switching vehicle). If the player is already in this seat, they exit (switch to walking mode). Shows a message if the seat is taken, if the player cannot leave their seat, or if the vehicle is not accessible.

- `vehId` (*integer*) : Vehicle identifier.
- `seatId` (*string*) : Targeted seat.
- `player` (*integer|nil*) : Player (0 by default).
- `permissionOverride` (*string|nil*) : Forced permission mode.
- **returns**: boolean|nil true if the player ends up in this seat (or exits); nil if vehId or seatId is missing.

#### `gameplay_seatOccupants.requestUnseatedPresence(player, vehId, permissionMode)`

Places a player in the vehicle without a seat ("unseated" presence), with an optional permission mode.

- `player` (*integer|nil*) : Player.
- `vehId` (*integer*) : Vehicle identifier.
- `permissionMode` (*string|nil*) : 'driver', 'passenger' or 'unrestricted'.
- **returns**: boolean true if the unseated presence is established.
- **returns**: string|nil 'invalidVehicle' or 'invalidPermissionMode' on failure.

#### `gameplay_seatOccupants.salad(vehId)`

Removes 10 kg from each occupant (clamped to 49) and displays a message with the weight.

- `vehId` (*integer|nil*) : Vehicle; default the player 0 vehicle.
- **returns**: number|nil Displayed weight, nil if no occupant.

#### `gameplay_seatOccupants.setDummyOccupant(vehId, seatId, weight)`

Places a dummy occupant (randomly colored mesh) with a weight in a free seat.

- `vehId` (*integer*) : Vehicle identifier.
- `seatId` (*string*) : Seat.
- `weight` (*number|nil*) : Weight; default 89, minimum 0.
- **returns**: boolean true if placed.
- **returns**: string|nil 'invalidVehicle', 'invalidSeat', 'occupied' or 'reserved'.

#### `gameplay_seatOccupants.setOccupied(vehId, seatId, player, weight, permissionOverride)`

Places a player in a seat (no animation or vehicle change). Frees their other seats, records the presence, applies the weight, updates the controls and the camera.

- `vehId` (*integer*) : Vehicle identifier.
- `seatId` (*string|nil*) : Seat; default the driver seat.
- `player` (*integer|nil*) : Player (0 by default).
- `weight` (*number|nil*) : Occupant weight (default 89).
- `permissionOverride` (*string|nil*) : Forced permission mode.
- **returns**: boolean false if invalid vehicle, invalid seat or unavailable seat.

#### `gameplay_seatOccupants.setPlayerPermissionMode(player, permissionMode)`

Changes the permission mode of a player already present in a vehicle.

- `player` (*integer|nil*) : Player index (0 by default).
- `permissionMode` (*string*) : 'driver', 'passenger' or 'unrestricted'.
- **returns**: boolean true if applied.
- **returns**: string|nil Failure cause: 'invalidPermissionMode' or 'noPresence'.

#### `gameplay_seatOccupants.setVehicleOccupantsEnabledOverride(vehId, enabled)`

Forces the display (true) or hiding (false) of a vehicle's occupants, regardless of the global setting; nil removes the override.

- `vehId` (*integer*) : Vehicle identifier.
- `enabled` (*boolean|nil*) : Override.
- **returns**: boolean false if the vehicle does not exist.

#### `gameplay_seatOccupants.showVehicleFullMessage(player)`

Shows the "vehicle full" UI message to the player.

- `player` (*integer|nil*) : Player index.

#### `gameplay_seatOccupants.switchSeat(player, direction)`

Moves to the next free seat (direction > 0) or the previous one (direction < 0) of the current vehicle, with the driver at the head of the list.

- `player` (*integer|nil*) : Player.
- `direction` (*integer|nil*) : Direction; 1 by default.
- **returns**: boolean true if a seat was taken.

#### `gameplay_seatOccupants.toggleUnseated(player)`

Toggles between "seated" and "unseated" in the current vehicle.

- `player` (*integer|nil*) : Player.
- **returns**: boolean Success.

#### `gameplay_seatOccupants.usesSeatSystem(vehId)`

Indicates whether the vehicle uses the seat system (occupantSystem.enabled, otherwise presence of occupant slots in the vehicle data). Always false if debugDisableOccupantSystem.

- `vehId` (*integer*) : Vehicle identifier.
- **returns**: boolean true if the vehicle has managed seats.

## Fields

| Field | Type | Description |
|---|---|---|
| `debugDisableOccupantSystem` | boolean | Debug: disables the whole seat system and reverts to the old behavior (false by default). |
| `debugDisableOccupantWeight` | boolean | Debug: disables adding the occupants' weight (false by default). |
| `dependencies` | string[] | Extensions loaded beforehand (core_camera, core_vehicle_manager, core_input_actionFilter, core_gamestate, core_multiseat, ui_vehicleSelector_vehicleSpecifications). |
| `enablePresenceDebugMessages` | boolean | Displays a message on each presence change (false by default). |
| `enableSeatEjection` | boolean | If true, enterSeat ejects (walking mode) the player already seated in this seat (false by default). |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onPlayerVehiclePresenceChanged` — listened to by 2 module(s)
- `onResolveVehiclePresenceMode`
- `onSeatOccupantEnter` — listened to by 2 module(s)
- `onSeatOccupantExit` — listened to by 2 module(s)

**UI events (guihooks.trigger):** `Message`

## Calls into the engine (C++)

- `be:` `enterVehicle`, `getObjectOOBBCenterXYZ`, `getObjectOOBBHalfAxisXYZ`, `getObjectOOBBIsInitialized`, `getPlayerVehicle`, `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/seatOccupants.lua`.*
