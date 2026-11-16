# `ui_pause_vehicleConfigurationOccupants`

*File: `lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua` · VM: Game Engine (GE) · 268 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_pause_vehicleConfigurationOccupants`: `extensions.load("ui_pause_vehicleConfigurationOccupants")`, then the global `ui_pause_vehicleConfigurationOccupants`

GE extension that feeds the "Occupants" tab of the vehicle configuration screen (pause menu). It lists the seats of the configured vehicle (via gameplay_seatOccupants), the available players (core_multiseat / core_playerPersonas) and lets you seat a player, a dummy or nobody on each seat. The targeted vehicle is the session's (sessionVehicleId) or, failing that, the one resolved by core_vehicle_configTarget. Each change triggers the UI hook VehicleConfigOccupantsStateChanged.

## Example

```lua
extensions.load('ui_pause_vehicleConfigurationOccupants')
local st = ui_pause_vehicleConfigurationOccupants.beginSession(true)
ui_pause_vehicleConfigurationOccupants.setSeatOccupant(st.seats[1].seatId, 'dummy')
ui_pause_vehicleConfigurationOccupants.endSession()
```

## Notes

- An occupant's weight is seat.weight if present, otherwise defaultWeight = 89 (kg, local value in the file).
- Format of the occupant parameter of setSeatOccupant: 'empty', 'dummy' or 'player:<index>' (player index, 0 for the solo player).
- During a session, an override is set on the vehicle (setVehicleOccupantsEnabledOverride): occupants stay active if the Occupants tab is open or if enabledWhileConfiguring is true; endSession removes the override.
- onVehicleReplaced and onVehicleResetted are simple aliases of onVehicleSpawned.

**Dependencies (loaded first):** `gameplay_seatOccupants`, `core_multiseat`, `core_playerPersonas`, `core_vehicle_configTarget`, `core_vehicle_manager`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_pause_vehicleConfigurationOccupants.beginSession(enabled)` | Starts a configuration session on the targeted vehicle. Removes the override from the old vehicle if it changed, stores the new one and applies the occupants override. | 118 |
| `ui_pause_vehicleConfigurationOccupants.endSession()` | Ends the session: removes the occupants override on the session vehicle and resets the local state (sessionVehicleId, active tab). | 129 |
| `ui_pause_vehicleConfigurationOccupants.fillEmptySeatsWithDummies()` | Places an 89 kg dummy on each free seat of the targeted vehicle. | 202 |
| `ui_pause_vehicleConfigurationOccupants.getState()` | Returns the state displayed by the tab: vehicle id, seats, players, multi-seat mode, installed part paths (partPath), and enabledWhileConfiguring. If no valid vehicle is targeted, returns {vehicleId=nil, seats={}, players={}}. | 102 |
| `ui_pause_vehicleConfigurationOccupants.onExtensionUnloaded()` | Hook called when the extension is unloaded; calls endSession. *(internal)* *(hook)* | 263 |
| `ui_pause_vehicleConfigurationOccupants.onLocalParticipantsChanged()` | Hook called when the list of local participants (multi-seat) changes; notifies the UI if a session is in progress. *(internal)* *(hook)* | 232 |
| `ui_pause_vehicleConfigurationOccupants.onSeatOccupantEnter(_, vehId)` | Hook called when an occupant sits down; notifies the UI if it is the session vehicle. *(internal)* *(hook)* | 224 |
| `ui_pause_vehicleConfigurationOccupants.onSeatOccupantExit(_, vehId)` | Hook called when an occupant leaves a seat; notifies the UI if it is the session vehicle. *(internal)* *(hook)* | 228 |
| `ui_pause_vehicleConfigurationOccupants.onVehicleConfigTargetChanged()` | Hook called when the configuration target changes: removes the override from the old vehicle, switches to the new one and notifies the UI. *(internal)* *(hook)* | 252 |
| `ui_pause_vehicleConfigurationOccupants.onVehicleDestroyed(vehId)` | Hook called when a vehicle is destroyed; if it is the session's, forgets the session and notifies the UI. *(internal)* *(hook)* | 246 |
| `ui_pause_vehicleConfigurationOccupants.onVehicleSpawned(vehId)` | Hook called when a vehicle spawns; if it is the session's, reapplies the override and notifies the UI. *(internal)* *(hook)* | 236 |
| `ui_pause_vehicleConfigurationOccupants.removeAllDummies()` | Removes all dummies from the targeted vehicle. | 216 |
| `ui_pause_vehicleConfigurationOccupants.setEnabledWhileConfiguring(enabled)` | Enables or disables occupants during configuration and reapplies the override. | 137 |
| `ui_pause_vehicleConfigurationOccupants.setOccupantTabActive(active)` | Indicates whether the Occupants tab is displayed; as long as it is, occupants stay active even if enabledWhileConfiguring is false. | 143 |
| `ui_pause_vehicleConfigurationOccupants.setSeatOccupant(seatId, occupant)` | Sets a seat's occupant: empty, dummy or player. Frees the seat if needed before reoccupying it, then notifies the UI. | 148 |
| `ui_pause_vehicleConfigurationOccupants.unseatAll()` | Empties all seats of the targeted vehicle and notifies the UI. | 194 |

### Parameter details

#### `ui_pause_vehicleConfigurationOccupants.beginSession(enabled)`

Starts a configuration session on the targeted vehicle. Removes the override from the old vehicle if it changed, stores the new one and applies the occupants override.

- `enabled` (*boolean|nil*) : false to disable occupants during configuration; any other value (including nil) enables them.
- **returns**: table The result of getState().

#### `ui_pause_vehicleConfigurationOccupants.fillEmptySeatsWithDummies()`

Places an 89 kg dummy on each free seat of the targeted vehicle.

- **returns**: integer Number of dummies added (0 if no vehicle).

#### `ui_pause_vehicleConfigurationOccupants.getState()`

Returns the state displayed by the tab: vehicle id, seats, players, multi-seat mode, installed part paths (partPath), and enabledWhileConfiguring. If no valid vehicle is targeted, returns {vehicleId=nil, seats={}, players={}}.

- **returns**: table {vehicleId, seats, players, multiseatActive, vehiclePartPaths, enabledWhileConfiguring}. players: sorted list of {id, label, color '#RRGGBB', icon}.

#### `ui_pause_vehicleConfigurationOccupants.onSeatOccupantEnter(_, vehId)`

Hook called when an occupant sits down; notifies the UI if it is the session vehicle.

- `_` (*any*) : Ignored (inferred from code).
- `vehId` (*integer*) : Id of the vehicle concerned.

#### `ui_pause_vehicleConfigurationOccupants.onSeatOccupantExit(_, vehId)`

Hook called when an occupant leaves a seat; notifies the UI if it is the session vehicle.

- `_` (*any*) : Ignored (inferred from code).
- `vehId` (*integer*) : Id of the vehicle concerned.

#### `ui_pause_vehicleConfigurationOccupants.onVehicleDestroyed(vehId)`

Hook called when a vehicle is destroyed; if it is the session's, forgets the session and notifies the UI.

- `vehId` (*integer*) : Vehicle id.

#### `ui_pause_vehicleConfigurationOccupants.onVehicleSpawned(vehId)`

Hook called when a vehicle spawns; if it is the session's, reapplies the override and notifies the UI.

- `vehId` (*integer*) : Vehicle id.

#### `ui_pause_vehicleConfigurationOccupants.removeAllDummies()`

Removes all dummies from the targeted vehicle.

- **returns**: integer Number removed, as returned by gameplay_seatOccupants.clearDummyOccupants (0 if no vehicle).

#### `ui_pause_vehicleConfigurationOccupants.setEnabledWhileConfiguring(enabled)`

Enables or disables occupants during configuration and reapplies the override.

- `enabled` (*boolean|nil*) : false to disable, otherwise enabled.
- **returns**: boolean The value retained.

#### `ui_pause_vehicleConfigurationOccupants.setOccupantTabActive(active)`

Indicates whether the Occupants tab is displayed; as long as it is, occupants stay active even if enabledWhileConfiguring is false.

- `active` (*boolean*) : true if the tab is open.

#### `ui_pause_vehicleConfigurationOccupants.setSeatOccupant(seatId, occupant)`

Sets a seat's occupant: empty, dummy or player. Frees the seat if needed before reoccupying it, then notifies the UI.

- `seatId` (*string*) : Seat identifier (seat.seatId).
- `occupant` (*string*) : 'empty', 'dummy' or 'player:<index>'.
- **returns**: table {success=boolean, reason=string|nil}. Reasons: seatMissing, invalidOccupant, enterFailed, occupied, or the reason returned by setDummyOccupant.

#### `ui_pause_vehicleConfigurationOccupants.unseatAll()`

Empties all seats of the targeted vehicle and notifies the UI.

- **returns**: boolean false if no vehicle is targeted, otherwise true.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before this one: gameplay_seatOccupants, core_multiseat, core_playerPersonas, core_vehicle_configTarget, core_vehicle_manager. |
| `onVehicleReplaced` | function | Alias of onVehicleSpawned: reapplies the override and notifies the UI if the replaced vehicle is the session's. |
| `onVehicleResetted` | function | Alias of onVehicleSpawned: same behavior after a vehicle reset. |

**UI events (guihooks.trigger):** `VehicleConfigOccupantsStateChanged`

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/pause/vehicleConfigurationOccupants.lua`.*
