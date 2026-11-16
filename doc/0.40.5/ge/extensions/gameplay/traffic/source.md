# `gameplay_traffic_source`

*File: `lua/ge/extensions/gameplay/traffic/source.lua` · VM: Game Engine (GE) · 193 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_traffic_source`: `extensions.load("gameplay_traffic_source")`, then the global `gameplay_traffic_source`

Manages the traffic manager's "sources" (focuses), useful when several players (split screen) must each have traffic around them. A source is a vehicle or a fixed position; the module rotates the traffic focus (gameplay_traffic.setFocus) from source to source at regular intervals. Loaded on demand.

## Example

```lua
gameplay_traffic_source.autoAddPlayers('default') -- one source per player, rotation every 5 s
```

## Notes

- The update mode is 'off' or 'default' (only 'default' rotates the sources).
- autoAddPlayers does nothing if there are fewer than 2 players (core_multiseat.getJoinedPlayers()[2] nil); it sets trafficClearRadius = 160 on each player vehicle and disables the traffic's enableDynamicValues.
- In 'default' mode, after each source change the timer is frozen at -1 until an AI traffic vehicle is reset (onVehicleResetted).
- addSource returns the created entry or false; a 'custom' source requires data.pos and data.dir.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_traffic_source.addSource(mode, data)` | Adds a source to traffic. 'vehicle' mode: data is a vehicle id or a {vehId} table. 'custom' mode: data = {pos, dir, speed?}. Other mode (e.g. 'camera'): entry without data. | 34 |
| `gameplay_traffic_source.autoAddPlayers(defaultMode)` | Resets the sources then adds each player's vehicle as a source (multiseat), if at least 2 players have joined. Then enables the update mode. | 118 |
| `gameplay_traffic_source.getSources()` | Returns the table of current sources (direct reference, not a copy). | 72 |
| `gameplay_traffic_source.onUpdate(dt, dtSim)` | Hook called every frame. Advances the timer; at the interval, calls updateSource then freezes the timer (-1). *(internal)* *(hook)* | 167 |
| `gameplay_traffic_source.onVehicleResetted(vehId)` | Hook called when a vehicle is reset. If the rotation timer is frozen (-1) and the vehicle is an AI traffic vehicle, restarts the timer at 0. *(internal)* *(hook)* | 157 |
| `gameplay_traffic_source.onVehicleSwitched(oldId, newId, player)` | Hook called when a player changes vehicle. In split screen, autoAddPlayers is often called before everyone is seated: if the new vehicle is not already a source and there are at least 2 players, calls autoAddPlayers again. *(internal)* *(hook)* | 151 |
| `gameplay_traffic_source.removeSource(index)` | Removes the source at the given index; if it was the current rotation index, the rotation restarts at 1. | 65 |
| `gameplay_traffic_source.resetSources()` | Removes all sources (resets trafficClearRadius to 0 on the affected vehicles), restores the default traffic focus and re-enables enableDynamicValues. | 17 |
| `gameplay_traffic_source.setSourceMode(mode, options)` | Sets the sources update mode and resets the rotation state. In 'default' mode, creates a timer and an interval (minimum 1 s, 5 s by default). | 76 |
| `gameplay_traffic_source.updateSource(index)` | Moves to the next source (favoring a source whose vehicle is moving faster than 1 m/s) or to the given index, then calls gameplay_traffic.setFocus(mode, source). Called automatically by onUpdate or manually. | 96 |

### Parameter details

#### `gameplay_traffic_source.addSource(mode, data)`

Adds a source to traffic. 'vehicle' mode: data is a vehicle id or a {vehId} table. 'custom' mode: data = {pos, dir, speed?}. Other mode (e.g. 'camera'): entry without data.

- `mode` (*string*) : 'camera', 'vehicle' or 'custom'.
- `data` (*integer|table|nil*) : Vehicle id, or table {vehId=...} or {pos=vec3, dir=vec3, speed=number}.
- **returns**: table|boolean The added source entry, or false if the data is invalid (nonexistent vehicle, missing pos/dir).

#### `gameplay_traffic_source.autoAddPlayers(defaultMode)`

Resets the sources then adds each player's vehicle as a source (multiseat), if at least 2 players have joined. Then enables the update mode.

- `defaultMode` (*string|nil*) : Update mode, 'default' if nil.

#### `gameplay_traffic_source.getSources()`

Returns the table of current sources (direct reference, not a copy).

- **returns**: table List of entries {mode, auto, vehId?, pos?, dirVec?, speed?}.

#### `gameplay_traffic_source.onUpdate(dt, dtSim)`

Hook called every frame. Advances the timer; at the interval, calls updateSource then freezes the timer (-1).

- `dt` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulation delta time (s), used by the timer.

#### `gameplay_traffic_source.onVehicleResetted(vehId)`

Hook called when a vehicle is reset. If the rotation timer is frozen (-1) and the vehicle is an AI traffic vehicle, restarts the timer at 0.

- `vehId` (*integer*) : Id of the reset vehicle.

#### `gameplay_traffic_source.onVehicleSwitched(oldId, newId, player)`

Hook called when a player changes vehicle. In split screen, autoAddPlayers is often called before everyone is seated: if the new vehicle is not already a source and there are at least 2 players, calls autoAddPlayers again.

- `oldId` (*integer*) : Old vehicle id.
- `newId` (*integer*) : New vehicle id.
- `player` (*integer*) : Player concerned (unused).

#### `gameplay_traffic_source.removeSource(index)`

Removes the source at the given index; if it was the current rotation index, the rotation restarts at 1.

- `index` (*integer*) : Index (starting at 1) in the sources list.

#### `gameplay_traffic_source.setSourceMode(mode, options)`

Sets the sources update mode and resets the rotation state. In 'default' mode, creates a timer and an interval (minimum 1 s, 5 s by default).

- `mode` (*string*) : 'off' or 'default'.
- `options` (*table|nil*) : Options; options.interval = rotation interval in seconds.

#### `gameplay_traffic_source.updateSource(index)`

Moves to the next source (favoring a source whose vehicle is moving faster than 1 m/s) or to the given index, then calls gameplay_traffic.setFocus(mode, source). Called automatically by onUpdate or manually.

- `index` (*integer|nil*) : Forced index; if nil, advances to the next source.

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/traffic/source.lua`.*
