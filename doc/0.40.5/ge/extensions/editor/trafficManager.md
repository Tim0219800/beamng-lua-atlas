# `editor_trafficManager`

*File: `lua/ge/extensions/editor/trafficManager.lua` · VM: Game Engine (GE) · 2601 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_trafficManager`: `extensions.load("editor_trafficManager")`, then the global `editor_trafficManager`

Editor "Traffic Manager": lets you compose a traffic session (vehicles and props placed on the map, traffic lights, signs), start/stop the simulation (AI of unlocked vehicles, signals), then save the session as JSON with an associated prefab. Windows: main (trafficEditMode edit mode), "Traffic Vehicles & Props", "Traffic Lights", "Traffic Signs" and "Options". Created objects are stored in the "TrafficSession" SimGroup. A modder uses it through the editor menu; the public Lua API is limited to loading/saving a session, reading the data and the simulation.

## Example

```lua
editor_trafficManager.loadSession('/levels/west_coast_usa/traffic/ma_session.json')
editor_trafficManager.enableSimulation()
local session = editor_trafficManager.getSessionData()
```

## Notes

- The session file contains: name, author, description, level, version (1), includePlayerVehicle, signalsKeepOriginal, signalsSaveApart, debugMode, vehicles, signals {instances, controllers, sequences}.
- loadSession and saveSession replace .prefab.json with .json in the path (unescaped pattern: the dot is a wildcard) to work on the data file; a prefab of the same name is generated/loaded alongside.
- If the file's level differs from the current level and M.assertLevel is true, a confirmation is requested; accepting disables assertLevel until it is re-enabled.
- saveSession refuses to write (notification "Missing session data!") if there is no vehicle, no light and no sign.
- On save, each vehicle is teleported in place (spawn.safeTeleport) and the fields aiActive, stats and _tempData are not written.
- onSerialize returns an empty table and onDeserialize does nothing: the session is not kept across a Lua reload.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_trafficManager.disableSimulation()` | Stops the simulation: disables the AI of unlocked vehicles and the signals, sets session.play to false. | 603 |
| `editor_trafficManager.enableSimulation()` | Starts the simulation: enables the AI of all unlocked vehicles and the signals, reloads the collision if the editor is modified, sets session.play to true. | 586 |
| `editor_trafficManager.getSessionData()` | Returns the current session table (vehicles, lights, signs, name, author, play...), not copied. | 2305 |
| `editor_trafficManager.loadSession(filePath)` | Loads a session from a JSON file: resets the session, restores options and metadata, loads the associated prefab if it exists then recreates vehicles and signals. Without an argument, resumes the remembered file after a level confirmation request (and disables assertLevel). Failure notification if the file is unreadable. | 2088 |
| `editor_trafficManager.onDeserialized(data)` | Hook after Lua reload; does nothing. *(internal)* *(hook)* | 2554 |
| `editor_trafficManager.onEditorGui()` | Editor frame hook: draws the Traffic Manager windows (only when the current edit mode is Traffic Manager) and the debug. *(internal)* *(hook)* | 2341 |
| `editor_trafficManager.onEditorInitialized()` | Editor initialization hook: creates the trafficEditMode edit mode (shortcuts click, Shift+click move, Alt) and registers the windows. *(internal)* *(hook)* | 2566 |
| `editor_trafficManager.onSerialize()` | Hook before Lua reload; returns an empty table. *(internal)* *(hook)* | 2549 |
| `editor_trafficManager.onUpdate(dt, dtSim)` | Update hook: if the SimGroup has disappeared, resets the session; otherwise stores the vehicles that appeared in the SimGroup, updates the statistics and a 0.25 s timer. *(internal)* *(hook)* | 2423 |
| `editor_trafficManager.onVehicleResetted(vehId)` | Hook called when a vehicle is reset: recreates its session data (statistics reset to zero). *(internal)* *(hook)* | 2526 |
| `editor_trafficManager.onVehicleSpawned(vehId)` | Hook called when a vehicle spawns: if the vehicles or signs window is active, creates the SimGroup if needed and queues the vehicle to be added to the session on the next frame. *(internal)* *(hook)* | 2513 |
| `editor_trafficManager.onWindowMenuItem()` | Menu hook: creates the session and checks the SimGroup if needed, clears the selection and shows the main window. *(internal)* *(hook)* | 2557 |
| `editor_trafficManager.saveSession(filePath)` | Saves the session to a JSON file and a prefab of the same name. No effect without a path. | 2212 |

### Parameter details

#### `editor_trafficManager.disableSimulation()`

Stops the simulation: disables the AI of unlocked vehicles and the signals, sets session.play to false.

- **returns**: boolean False if no session exists, true otherwise.

#### `editor_trafficManager.enableSimulation()`

Starts the simulation: enables the AI of all unlocked vehicles and the signals, reloads the collision if the editor is modified, sets session.play to true.

- **returns**: boolean False if no session exists, true otherwise.

#### `editor_trafficManager.getSessionData()`

Returns the current session table (vehicles, lights, signs, name, author, play...), not copied.

- **returns**: table|nil Session, nil until it is created.

#### `editor_trafficManager.loadSession(filePath)`

Loads a session from a JSON file: resets the session, restores options and metadata, loads the associated prefab if it exists then recreates vehicles and signals. Without an argument, resumes the remembered file after a level confirmation request (and disables assertLevel). Failure notification if the file is unreadable.

- `filePath` (*string|nil*) : Path of the .json file (or .prefab.json, converted).

#### `editor_trafficManager.onDeserialized(data)`

Hook after Lua reload; does nothing.

- `data` (*table*) : Value of onSerialize.

#### `editor_trafficManager.onSerialize()`

Hook before Lua reload; returns an empty table.

- **returns**: table Empty table.

#### `editor_trafficManager.onUpdate(dt, dtSim)`

Update hook: if the SimGroup has disappeared, resets the session; otherwise stores the vehicles that appeared in the SimGroup, updates the statistics and a 0.25 s timer.

- `dt` (*number*) : Real-time delta (s).
- `dtSim` (*number*) : Simulation time delta (s).

#### `editor_trafficManager.onVehicleResetted(vehId)`

Hook called when a vehicle is reset: recreates its session data (statistics reset to zero).

- `vehId` (*integer*) : Vehicle identifier.

#### `editor_trafficManager.onVehicleSpawned(vehId)`

Hook called when a vehicle spawns: if the vehicles or signs window is active, creates the SimGroup if needed and queues the vehicle to be added to the session on the next frame.

- `vehId` (*integer*) : Vehicle identifier.

#### `editor_trafficManager.saveSession(filePath)`

Saves the session to a JSON file and a prefab of the same name. No effect without a path.

- `filePath` (*string*) : Path of the .json file (or .prefab.json, converted).

## Fields

| Field | Type | Description |
|---|---|---|
| `assertLevel` | boolean | True by default: loadSession compares the file's level with the current level and asks for confirmation if they differ. |
| `debugMode` | boolean | False by default: enables debug drawing (AI target, box under the vehicle) even for active vehicles; copied from the loaded file. |

## Calls into the engine (C++)

- `FS:` `fileExists`
- `be:` `enterVehicle`, `getEnabled`, `getPlayerVehicleID`, `getSurfaceHeightBelow`, `reloadCollision`
- `debugDrawer:` `drawCylinder`, `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`
- `obj:` `getClassName`, `getDirectionVector`, `getDirectionVectorUp`, `getID`, `getName`, `getPosition`, `setInternalName`, `setName`
- `scenetree.` `findObject`, `findObjectById`, `objectExists`, `objectExistsById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/trafficManager.lua`.*
