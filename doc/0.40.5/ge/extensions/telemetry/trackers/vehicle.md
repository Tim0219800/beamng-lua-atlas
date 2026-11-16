# `telemetry_trackers_vehicle`

*File: `lua/ge/extensions/telemetry/trackers/vehicle.lua` · VM: Game Engine (GE) · 106 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_trackers_vehicle`: `extensions.load("telemetry_trackers_vehicle")`, then the global `telemetry_trackers_vehicle`

Vehicle telemetry tracker. It records which vehicles are spawned (`vehicleSpawned` event), driven and for how long (`vehicleUsed` activity), and resets (`vehicleReset` event). Custom configurations are reported as ":custom" instead of the configuration contents. Relies on `telemetry_core`, `telemetry_vehicleInfo` and `telemetry_configManager`.

## Notes

- Only player 0 is tracked (`player ~= 0` is ignored in onVehicleSwitched). `newId == -1` means the player is no longer in a vehicle.
- Resets are the noisiest event: `trackVehReset` does nothing if the `vehicle` module config has `trackResets == false`.
- After a Lua reload, onVehicleSwitched does not fire again; onExtensionLoaded therefore reopens the activity of the vehicle currently driven.
- `trackVehReset` is not called by any hook in this file: the caller is external (inferred from code).

**Dependencies (loaded first):** `telemetry_core`

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_trackers_vehicle.onClientEndMission()` | Hook called at the end of the mission/level on the client side. Closes the `vehicleUsed` activity. *(internal)* *(hook)* | 78 |
| `telemetry_trackers_vehicle.onExit()` | Hook called when the game exits. Closes the `vehicleUsed` activity. *(internal)* *(hook)* | 91 |
| `telemetry_trackers_vehicle.onExtensionLoaded()` | Hook called when the extension loads. Sets the extension to manual unload and, if player 0 is already driving a vehicle, opens its `vehicleUsed` activity. *(internal)* *(hook)* | 82 |
| `telemetry_trackers_vehicle.onExtensionUnloaded()` | Hook called when the extension is unloaded (a Lua reload does not go through onExit). Closes the `vehicleUsed` activity. *(internal)* *(hook)* | 21 |
| `telemetry_trackers_vehicle.onVehicleSpawned(vid)` | Hook called when a vehicle is spawned. Sends the `vehicleSpawned` event with the model, configuration and current level. Does nothing if the vehicle info cannot be found. *(internal)* *(hook)* | 37 |
| `telemetry_trackers_vehicle.onVehicleSwitched(oldId, newId, player)` | Hook called when the controlled vehicle changes. For player 0, closes the current `vehicleUsed` activity then opens one for the new vehicle (or only closes it if newId is -1). *(internal)* *(hook)* | 49 |
| `telemetry_trackers_vehicle.trackVehReset()` | Sends the `vehicleReset` event (model and damage of player 0's vehicle, read from `map.objects[vid].damage`). Can be disabled via `trackResets = false` in the `vehicle` module config. Ignored if the player has no vehicle. *(internal)* | 61 |

### Parameter details

#### `telemetry_trackers_vehicle.onVehicleSpawned(vid)`

Hook called when a vehicle is spawned. Sends the `vehicleSpawned` event with the model, configuration and current level. Does nothing if the vehicle info cannot be found.

- `vid` (*integer*) : Id of the created vehicle.

#### `telemetry_trackers_vehicle.onVehicleSwitched(oldId, newId, player)`

Hook called when the controlled vehicle changes. For player 0, closes the current `vehicleUsed` activity then opens one for the new vehicle (or only closes it if newId is -1).

- `oldId` (*integer*) : Id of the old vehicle.
- `newId` (*integer*) : ID of the new vehicle, -1 if the player is no longer in a vehicle.
- `player` (*integer*) : Player index; only 0 is handled.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions to load before this one: `{'telemetry_core'}`. |

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/trackers/vehicle.lua`.*
