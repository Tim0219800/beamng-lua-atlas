# `core_vehicle_manager`

*File: `lua/ge/extensions/core/vehicle/manager.lua` · VM: Game Engine (GE) · 415 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_vehicle_manager`: `extensions.load("core_vehicle_manager")`, then the global `core_vehicle_manager`

GE extension `core_vehicle_manager`: GE-side vehicle loader. When the engine creates a vehicle object, it calls `_spawnCCallback`: loads the materials from the model folder, builds the config (core_vehicle_partmgmt.buildConfigFromString), runs stage 1 of the jbeam loader (jbeam/loader), finishes the meshes, notifies the UI (VehicleChange), makes the player enter if autoEnterVehicle, then sends the physics data to the vehicle (spawnPhysics). Keeps for each vehicle its "bundle" (vdata = jbeam data, config, ioCtx...) accessible through getVehicleData, and applies paint changes live.

## Example

```lua
local d = core_vehicle_manager.getVehicleData(be:getPlayerVehicleID(0))
print(d.vehicleDirectory, d.model, d.config.partConfigFilename)
dump(d.vdata.nodes[0].pos)
-- paints by name
core_vehicle_manager.setVehicleColorsNames(vehId, {'Black', 'White', 'Red'})
```

## Notes

- getVehicleData(id) returns the "bundle" of vehicles[id]: a table with at least vdata, config, ioCtx, vehicleDirectory, model, mainPartName, activePlayer (fields read elsewhere in the code; the exact detail comes from jbeam/loader).
- BUG: setVehicleColorsNames tests `vehicle.color == vehicle.colorPalette0 == vehicle.colorPalette1`, which compares a boolean to a color and is always false: the `optional` parameter therefore never protects anything.
- Probable BUG: in _spawnCCallback, `additionalVehicleData and not additionalDataId or additionalDataId == objID` mixes and/or without parentheses; if additionalDataId is nil, the condition is true when additionalVehicleData exists (intended) but also true if additionalDataId == objID.
- setVehiclePaintsNames is an alias of setVehicleColorsNames.
- The "Vehicle Manager" editor (onEditorGui) is marked obsolete in the code: it only displays the -debugVehicleLoading command-line argument to use instead. The -profileVehicleLoading and -debugVehicleLoading arguments are read when the module loads.
- onUpdate calls spawn.clearCache() every frame (placement cache of spawn.lua).

## Functions

| Function | Description | Line |
|---|---|---|
| `core_vehicle_manager._spawnCCallback(objID, vehicleDir, configDataIn, reloading)` | Called by the C++ engine when a vehicle object is created or reloaded: loads materials, config and jbeam (stage 1), notifies, makes the player enter (autoEnterVehicle / autoEnterVehiclePlayer) and starts the physics. Emits the onSpawnCCallback(objID) hook and calls vehicleSpawned(objID). *(internal)* | 111 |
| `core_vehicle_manager.getDebug()` | Indicates whether the vehicle loading debug mode is active. | 20 |
| `core_vehicle_manager.getPlayerVehicleData()` | Data bundle of player 0's vehicle. | 248 |
| `core_vehicle_manager.getVehicleData(id)` | Data bundle of a vehicle (jbeam vdata, config, ioCtx...). | 252 |
| `core_vehicle_manager.liveUpdateVehicleColors(objID, _vehicleObj, index, paint)` | Changes the paint of a slot on the vehicle object (color, colorPalette0, colorPalette1 + metallic data) without respawn, then emits onVehicleColorChanged(objID, index, paint). Does nothing if the vehicle has no config.paints. | 256 |
| `core_vehicle_manager.onClientEndMission()` | Hook: end of the level; invalidates the loaded materials cache. *(internal)* *(hook)* | 52 |
| `core_vehicle_manager.onDeserialized(data)` | Hook: restores the bundles encoded by onSerialize. *(internal)* *(hook)* | 296 |
| `core_vehicle_manager.onDespawnObject(id, isReloading)` | Hook: a vehicle object is removed. Forgets its bundle unless it is a reload (isReloading true). *(internal)* *(hook)* | 242 |
| `core_vehicle_manager.onEditorGui()` | Editor hook: displays an obsolescence message recommending -debugVehicleLoading. *(internal)* *(hook)* | 333 |
| `core_vehicle_manager.onEditorInitialized()` | Editor hook: registers the obsolete "Vehicle Manager" window. *(internal)* *(hook)* | 369 |
| `core_vehicle_manager.onFileChanged(filename, type)` | Hook: a file changed. Notifies jbeam/io for .jbeam files and invalidates the materials cache of a vehicle folder if a .materials.json changes there. *(internal)* *(hook)* | 63 |
| `core_vehicle_manager.onFilesChanged(files)` | Hook: files modified; notifies jbeam/loader. *(internal)* *(hook)* | 57 |
| `core_vehicle_manager.onSerialize()` | Hook: encodes (lpack) the bundles before a Lua reload. *(internal)* *(hook)* | 304 |
| `core_vehicle_manager.onUpdate()` | Per-frame hook: empties the placement cache of spawn.lua. *(internal)* *(hook)* | 375 |
| `core_vehicle_manager.onVehicleSwitched(oldID, newID, player)` | Hook: the player changes vehicle. Updates activePlayer of the bundles and releases the clutch (input.event('clutch', 0, 0)) of the old vehicle. *(internal)* *(hook)* | 229 |
| `core_vehicle_manager.queueAdditionalVehicleData(data, vehId)` | Prepares a table of additional data that will be added to the config of the next loaded vehicle (config.additionalVehicleData, removed afterwards). Called by core_vehicles on spawn/replacement. | 76 |
| `core_vehicle_manager.reloadAllVehicles()` | Reloads all vehicles (be:reloadAllVehicles). | 326 |
| `core_vehicle_manager.reloadVehicle(playerId)` | Reloads a player's vehicle: notifies core_vehicles.reloadVehicle then be:reloadVehicle(playerId). | 319 |
| `core_vehicle_manager.setDebug(enabled)` | Enables/disables loading debug (passed in additionalVehicleData.debugEnabled) and notifies the UI (guihook debugSpawnChanged). | 24 |
| `core_vehicle_manager.setVehicleColorsNames(id, paintNames, optional)` | Applies up to 3 named paints (from model.paints) to a vehicle, live. | 279 |
| `core_vehicle_manager.setVehiclePaintsNames(id, paintNames, optional)` | Alias of setVehicleColorsNames. | 279 |
| `core_vehicle_manager.spawnPhysicsForVehicle(objID, vehicleObj, vehicleBundle)` | Sends the vehicle (vehicleObj:spawnPhysics) its encoded physics data (vdata + config); sends an empty packet if the bundle is absent. | 81 |
| `core_vehicle_manager.toggleDebug()` | Toggles the debug mode. | 29 |
| `core_vehicle_manager.toggleModifyKey()` | Shows/hides the vehicle in-place editing window (core_vehicle_inplaceEdit). | 315 |

### Parameter details

#### `core_vehicle_manager._spawnCCallback(objID, vehicleDir, configDataIn, reloading)`

Called by the C++ engine when a vehicle object is created or reloaded: loads materials, config and jbeam (stage 1), notifies, makes the player enter (autoEnterVehicle / autoEnterVehiclePlayer) and starts the physics. Emits the onSpawnCCallback(objID) hook and calls vehicleSpawned(objID).

- `objID` (*integer*) : vehicle object id
- `vehicleDir` (*string*) : model folder (e.g. '/vehicles/pickup/')
- `configDataIn` (*table|string*) : config received (vehicle partConfig)
- `reloading` (*boolean*) : true on a reload (not used in the code)

#### `core_vehicle_manager.getDebug()`

Indicates whether the vehicle loading debug mode is active.

- **returns**: boolean state

#### `core_vehicle_manager.getPlayerVehicleData()`

Data bundle of player 0's vehicle.

- **returns**: table|nil same structure as getVehicleData

#### `core_vehicle_manager.getVehicleData(id)`

Data bundle of a vehicle (jbeam vdata, config, ioCtx...).

- `id` (*integer*) : vehicle id
- **returns**: table|nil bundle; nil if the vehicle is unknown

#### `core_vehicle_manager.liveUpdateVehicleColors(objID, _vehicleObj, index, paint)`

Changes the paint of a slot on the vehicle object (color, colorPalette0, colorPalette1 + metallic data) without respawn, then emits onVehicleColorChanged(objID, index, paint). Does nothing if the vehicle has no config.paints.

- `objID` (*integer*) : vehicle id
- `_vehicleObj` (*userdata|nil*) : vehicle object (looked up if nil)
- `index` (*integer*) : slot 1, 2 or 3
- `paint` (*table*) : paint {baseColor, metallic, roughness, clearcoat, clearcoatRoughness}

#### `core_vehicle_manager.onDeserialized(data)`

Hook: restores the bundles encoded by onSerialize.

- `data` (*table*) : data from onSerialize

#### `core_vehicle_manager.onDespawnObject(id, isReloading)`

Hook: a vehicle object is removed. Forgets its bundle unless it is a reload (isReloading true).

- `id` (*integer*) : vehicle
- `isReloading` (*boolean*) : true if reloading

#### `core_vehicle_manager.onFileChanged(filename, type)`

Hook: a file changed. Notifies jbeam/io for .jbeam files and invalidates the materials cache of a vehicle folder if a .materials.json changes there.

- `filename` (*string*) : path
- `type` (*string*) : type of change

#### `core_vehicle_manager.onFilesChanged(files)`

Hook: files modified; notifies jbeam/loader.

- `files` (*table*) : list of modified files

#### `core_vehicle_manager.onSerialize()`

Hook: encodes (lpack) the bundles before a Lua reload.

- **returns**: table {vehicles, autoSpawnPhysics}

#### `core_vehicle_manager.onVehicleSwitched(oldID, newID, player)`

Hook: the player changes vehicle. Updates activePlayer of the bundles and releases the clutch (input.event('clutch', 0, 0)) of the old vehicle.

- `oldID` (*integer*) : old vehicle
- `newID` (*integer*) : new vehicle
- `player` (*integer*) : player

#### `core_vehicle_manager.queueAdditionalVehicleData(data, vehId)`

Prepares a table of additional data that will be added to the config of the next loaded vehicle (config.additionalVehicleData, removed afterwards). Called by core_vehicles on spawn/replacement.

- `data` (*table|nil*) : data; nil cancels
- `vehId` (*integer|nil*) : if given, only this vehicle will receive the data

#### `core_vehicle_manager.reloadVehicle(playerId)`

Reloads a player's vehicle: notifies core_vehicles.reloadVehicle then be:reloadVehicle(playerId).

- `playerId` (*integer*) : player index

#### `core_vehicle_manager.setDebug(enabled)`

Enables/disables loading debug (passed in additionalVehicleData.debugEnabled) and notifies the UI (guihook debugSpawnChanged).

- `enabled` (*boolean*) : desired state

#### `core_vehicle_manager.setVehicleColorsNames(id, paintNames, optional)`

Applies up to 3 named paints (from model.paints) to a vehicle, live.

- `id` (*integer|nil*) : vehicle; nil = player 0
- `paintNames` (*string[]*) : {name1, name2, name3}
- `optional` (*any*) : if non-nil, was meant to cancel the action when the vehicle's 3 colors are identical (ineffective, see notes)

#### `core_vehicle_manager.setVehiclePaintsNames(id, paintNames, optional)`

Alias of setVehicleColorsNames.

- `id` (*integer|nil*) : vehicle; nil = player 0
- `paintNames` (*string[]*) : paint names
- `optional` (*any*) : see setVehicleColorsNames

#### `core_vehicle_manager.spawnPhysicsForVehicle(objID, vehicleObj, vehicleBundle)`

Sends the vehicle (vehicleObj:spawnPhysics) its encoded physics data (vdata + config); sends an empty packet if the bundle is absent.

- `objID` (*integer|nil*) : vehicle; nil = player 0
- `vehicleObj` (*userdata|nil*) : vehicle object (looked up if nil)
- `vehicleBundle` (*table|nil*) : bundle to send (default: the stored one)

## Fields

| Field | Type | Description |
|---|---|---|
| `autoSpawnPhysics` | boolean | true by default; if false, physics is not sent to the vehicle after loading (spawnPhysicsForVehicle must be called by hand). Also disabled for a vehicle whose NoPhysics == 'true'. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onSpawnCCallback` — listened to by 3 module(s)
- `onVehicleColorChanged` — listened to by 1 module(s)

**UI events (guihooks.trigger):** `VehicleChange`, `debugSpawnChanged`

## Calls into the engine (C++)

- `Engine.` `getStartingArgs`
- `FS:` `findFiles`
- `TorqueScriptLua.` `exec`
- `be:` `addObject`, `enterVehicle`, `getPlayerVehicleID`, `reloadAllVehicles`, `reloadVehicle`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/vehicle/manager.lua`.*
