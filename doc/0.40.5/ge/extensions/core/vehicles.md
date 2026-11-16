# `core_vehicles`

*File: `lua/ge/extensions/core/vehicles.lua` · VM: Game Engine (GE) · 3330 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_vehicles`: `extensions.load("core_vehicles")`, then the global `core_vehicles`

Vehicle catalog and spawning on the GE side. It reads the /vehicles/<model>/ folders (info.json, .pc files, images, paints, jbeam) to build the list of models and configurations with their filtering aggregates (cache invalidated when files change), and provides the functions to spawn/replace/delete vehicles (including multi-vehicle configurations, .pc format 4: trailers, etc.). It also tracks the couplings (hitches) between vehicles, the "vehicle collections" (main vehicle + trailers to be repositioned together), who drives which vehicle (vehiclePlayersMap) and the license plate. A modder uses it to list the models (getModelList, getConfig), spawn or replace a car (spawnNewVehicle, replaceVehicle) and change the plate (setPlateText).

## Example

```lua
-- spawn a pickup with its default configuration, then change the plate
local veh = core_vehicles.spawnNewVehicle('pickup', {config = 'd15_4wd_A', autoEnterVehicle = true})
if veh then core_vehicles.setPlateText('BEAM-123', veh:getID()) end

-- read a model's info
local m = core_vehicles.getModel('etk800')
print(m.model.Name, tableSize(m.configs))
```

## Notes

- Format of getModel(key): {model = table of model info (Name, Brand, Type, preview, logo, key, default_pc, paints, aggregates...), configs = table keyed by configuration key (Name, key, model_key, preview, aggregates, pcFilename...)}. An unknown key returns {} (and logs an error).
- The result of getModel is cached (clearCache empties everything). The cache is invalidated automatically by onFileChanged/onFileChangedEnd if a .json, .jbeam, .pc, .jpg or .png file under /vehicles/ or /mods/ changes, and by onLanguageChanged.
- The default model (defaultVehicleModel) is 'pickup', or 'etk800' if beamng_appname contains 'tech'.
- Usual spawn options (opt): config (name or .pc path, or table in format 4), model, paint/paint2/paint3, pos, rot, licenseText, vehicleName, autoEnterVehicle (true by default for the first vehicle, false for the following vehicles of a collection), canSpawnAnotherVehicleCheck (false to ignore the limit), safeSpawn, additionalVehicleData.
- Vehicle collections: vehCollections[mainId] = {mainVehData, vehsData, resetState...}; initVehCollections keeps the initial state; vehIdToVehCollection finds a vehicle's collection. The tables are rebuilt (buildVehCollectionCache) after onDeserialized, and vehsData is removed before serialization.
- Plate: the text is stored in the vehicle's dynData (licenseText, licenseDesign, licenseFormats). A double quote '"' makes the text invalid (isLicensePlateValid). The text is truncated to design.vars.plate.maxLength (32 by default), counting UTF-8 characters. If the file settings/cloud/forceLicencePlate.txt exists, its content is used as the text.
- Bug: M.removeAllWithProperty = removeAllWithProperty references a local variable that is never defined: the field is nil.
- Bug: in spawnNewVehicle, `opt.canSpawnAnotherVehicleCheck` is read before `opt = deepcopy(opt) or {}`: calling spawnNewVehicle(model) without an opt table causes a Lua error (replaceVehicle does not have this problem because the copy is made beforehand).
- spawnNewVehicle returns false if the vehicle limit is reached, nil if the model or the spawn fails, otherwise (first vehicle, list of all created vehicles).
- The default vehicle loading code in VariableRegistry (loadDefaultVehicle, etc.) is commented out or in a commented block: "no longer used". getDefaultVehicleParams remains exported and reads parseArgs.args.vehicleConfig, $beamngVehicleArgs and the default collection file.
- extractProperties and extractVehicles are development tools (printing of translation keys, list of configurations whose .pc paints do not match info): they are not used in game.
- The keys listed in getAttributesWhiteList (Drivetrain, Type, Transmission, Country, Value, Brand...) are the attributes aggregated for the filters; getAttributesConvertToRange and getAttributesConvertToDict indicate which ones are converted to a range (Value, Weight, Top Speed, 0-100 km/h...) or to a dictionary (Region, InsuranceClass).

**Dependencies (loaded first):** `core_vehiclePaints`, `core_locales`, `core_skiaTemplate`

## Functions

| Function | Description | Line |
|---|---|---|
| `core_vehicles.changeMeshVisibility(delta)` | Called by the mesh visibility keys: changes the transparency of highlighted parts through core_vehicle_partmgmt. Do not use elsewhere. *(internal)* | 2943 |
| `core_vehicles.clearCache()` | Empties all caches (files, models, model data); they are rebuilt on demand. | 2019 |
| `core_vehicles.cloneCurrent()` | Spawns a copy of player 0's vehicle (same model, config, paints), emits onPlayerVehicleCloned. Refuses if there is no vehicle, if the vehicle limit is reached or if the player is walking. | 1986 |
| `core_vehicles.convertVehicleInfo(info, infoFilename)` | Converts an info.json to the new format: textual colors (colors) become paints (paints), old default colors (default_color...) become defaultPaintName1/2/3. | 572 |
| `core_vehicles.createFilters(list)` | Builds the interface filters (min/max range or set of possible values per attribute) from the aggregates of a list of models or configurations. | 966 |
| `core_vehicles.enterFreecamIfNoVehicles()` | Switches to free camera if there is no enterable vehicle left (unless the player is the unicycle). | 1900 |
| `core_vehicles.extractProperties()` | Development tool: displays the property values of all models/configurations and the matching translation lines. | 3149 |
| `core_vehicles.extractVehicles()` | Development tool: goes through all models and configurations to compare the paints of the .pc files and of the infos. | 3227 |
| `core_vehicles.generateAttachedVehiclesTree(vehId)` | Builds the tree of coupled vehicles from a vehicle (parents and children through the couplings). | 1504 |
| `core_vehicles.getAttributesConvertToDict()` | List of attributes converted to a dictionary for the aggregates (Region, InsuranceClass). | 2953 |
| `core_vehicles.getAttributesConvertToRange()` | List of attributes converted to a range for the aggregates (Value, Weight, Top Speed, 0-100 km/h, 0-60 mph, Weight/Power, Off-Road Score). | 2954 |
| `core_vehicles.getAttributesWhiteList()` | List of attributes allowed as filters of the vehicle list (Drivetrain, Type, Transmission, Country, Brand, Body Style, Source...). | 2952 |
| `core_vehicles.getConfig(modelName, configKey)` | Returns the configuration of a model by its key. | 1057 |
| `core_vehicles.getConfigList(array)` | Lists all configurations of all models, with the associated filters. | 1038 |
| `core_vehicles.getCouplerOffset(vehId, couplerTag)` | Offset (x, y, z) of a vehicle's coupler nodes relative to its reference node, filtered by tag. | 1510 |
| `core_vehicles.getCurrentVehicleDetails()` | Details of player 0's vehicle (equivalent to getVehicleDetails(be:getPlayerVehicleID(0))). You can also use playerVehicle:getJBeamFilename(). | 961 |
| `core_vehicles.getDefaultVehicleParams()` | Determines the default vehicle to launch at startup: vehicleConfig command-line argument, otherwise $beamngVehicleArgs, otherwise the default configuration of the vehicles folder, otherwise the pickup (or etk800). *(internal)* | 2312 |
| `core_vehicles.getFilesJson()` | Cache of the vehicles' info JSON files (computed on the first call). | 388 |
| `core_vehicles.getFilesParsed()` | Cache of the JSON/PC files already read, keyed by path (e.g. /vehicles/pickup/info.json). | 404 |
| `core_vehicles.getModel(key)` | All the info of a model: model sheet, configurations, paints, previews, aggregates. Result cached. An invalid name (non-string) returns {}; an unknown model logs an error and returns {}. | 771 |
| `core_vehicles.getModelList(array)` | List of all available models with the filters and display information. | 1002 |
| `core_vehicles.getModelsData()` | Scans /vehicles and returns the models found with their files (info, .pc, jbeam, images). Result cached until clearCache. | 433 |
| `core_vehicles.getPaintFiles()` | Cache of the paint files found. | 410 |
| `core_vehicles.getVehicleDetails(id)` | Details of a vehicle: model key, .pc file, position, color, configuration key, model and configuration sheet. | 939 |
| `core_vehicles.getVehicleLicenseText(veh)` | Current plate text of a vehicle (dynData licenseText). | 2152 |
| `core_vehicles.getVehicleList()` | List of vehicles (full sheets of each model) and filters, format used by the old interface (ui2). | 1167 |
| `core_vehicles.getVehiclePersona(vehId)` | Persona (player profile) id associated with a vehicle. | 2644 |
| `core_vehicles.isLicensePlateValid(text)` | Checks that a plate text is acceptable (nil accepted; the double quote is forbidden). | 2160 |
| `core_vehicles.isModelListLoaded()` | Indicates whether all models are already in the getModel cache. | 1029 |
| `core_vehicles.isModelsDataLoaded()` | Indicates whether getModelsData has already been computed. | 546 |
| `core_vehicles.loadCustomVehicle(modelName, data)` | Writes the model and config into the $beamngVehicle and $beamngVehicleConfig variables of the VariableRegistry (startup with a given vehicle). *(internal)* | 2302 |
| `core_vehicles.loadModelListNoGarbage()` | Loads all models into the cache (getModel for each) without building a large list. | 1021 |
| `core_vehicles.makeVehicleLicenseText(veh, designPath)` | Determines a vehicle's plate text: forced text (forceLicenceStr or file settings/cloud/forceLicencePlate.txt), text already stored (licenseText), Steam name if the useSteamName option is active in freeroam (only once), otherwise text generated by core_skiaTemplate.generateText. | 2100 |
| `core_vehicles.onCouplerAttached(objId1, objId2, nodeId, obj2nodeId)` | Hook called when a coupler attaches: records the pair in attachedCouplers and vehsCouplings. *(internal)* *(hook)* | 2829 |
| `core_vehicles.onCouplerDetached(obj1id, obj2id, nodeId, obj2nodeId)` | Hook called when a coupler detaches (in any way): removes the pair from the tracking tables. *(internal)* *(hook)* | 2910 |
| `core_vehicles.onDeserialized(data)` | Hook called after an extensions reload: restores the tracking tables (players, personas, couplings, collections) and rebuilds the collection caches. *(internal)* *(hook)* | 2988 |
| `core_vehicles.onFileChanged(filename, type)` | Hook called when a file changes on disk: marks the cache as stale if the file is a .json, .jbeam, .pc, .jpg or .png under /vehicles/ or /mods/. *(internal)* *(hook)* | 2069 |
| `core_vehicles.onFileChangedEnd()` | Hook called after a series of file changes: empties the cache if a relevant file changed. *(internal)* *(hook)* | 2082 |
| `core_vehicles.onInstabilityDetected(vid, returnData)` | Hook called when a vehicle's physics becomes unstable: if the pauseGameOnInstability setting is active (and outside multiplayer), resets the vehicle, pauses the game and sets returnData.instabilityHandled = true. *(internal)* *(hook)* | 3010 |
| `core_vehicles.onLanguageChanged()` | Hook called on language change: empties the cache (translated names). *(internal)* *(hook)* | 2096 |
| `core_vehicles.onLocalParticipantsChanged()` | Hook called when the local participants (multi-seat) change: resynchronizes the persona of each occupied vehicle. *(internal)* *(hook)* | 2681 |
| `core_vehicles.onPersonaSettingsChanged(persona)` | Hook called when a persona's settings change: asks the vehicles that use it to re-read their settings (onSettingsChanged on the vehicle side). *(internal)* *(hook)* | 2669 |
| `core_vehicles.onPreVehicleSpawned(vehId)` | Hook called before a vehicle spawns: initializes the coupling tables (couplings, couplerCache, couplerTags, couplerOffset) from the vehicle's nodes that have a couplerTag or tag, and vehiclePlayersMap. *(internal)* *(hook)* | 2599 |
| `core_vehicles.onSerialize()` | Hook called before an extensions reload: returns the tracking tables of players, personas, couplings and collections (without vehsData). *(internal)* *(hook)* | 2956 |
| `core_vehicles.onSettingsChanged()` | Hook called when settings change: the showStandalonePcs logic is frozen to true in the code (the comparison in practice only triggers on the first call). *(internal)* *(hook)* | 2088 |
| `core_vehicles.onVehicleDestroyed(vid)` | Hook called when a vehicle is destroyed: removes its couplers, couplings, collections and player tracking entries. *(internal)* *(hook)* | 2709 |
| `core_vehicles.onVehicleSwitched(oldId, newId, player)` | Hook called when a player changes vehicle: updates vehiclePlayersMap and playerVehicleMap and resynchronizes the personas. *(internal)* *(hook)* | 2687 |
| `core_vehicles.openPartsSelectorUI()` | Opens the parts configuration screen (route pause.vehicle.configurationcombined or vehicleconfig module). Does nothing in the main menu or without a player vehicle; may return false if the guided first drive forbids it. | 1079 |
| `core_vehicles.openSelectorUI()` | Opens the vehicle selector (new interface depending on whether pause menu V2 is used). Does nothing in the main menu. | 1067 |
| `core_vehicles.openSelectorUI_legcay()` | Opens the old vehicle selector (guihook MenuOpenModule 'vehicleselect'). The name contains a typo (legcay). | 1101 |
| `core_vehicles.paintSignature(paint)` | JSON text identifying a paint (baseColor, clearcoat, clearcoatRoughness, metallic, roughness, to 5 decimals), useful to compare paints. | 3131 |
| `core_vehicles.regenerateVehicleLicenseText(veh)` | Generates a new random plate text for a vehicle without changing the stored text. | 2140 |
| `core_vehicles.reloadVehicle(playerId)` | Called when a player's vehicle is reloaded: frees SteamLicensePlateVehicleId if it was that vehicle (so another one can carry the Steam name). *(internal)* | 2935 |
| `core_vehicles.removeAll()` | Deletes all vehicles; first switches to free camera if player 0 had a vehicle. | 2009 |
| `core_vehicles.removeAllExceptCurrent()` | Deletes all vehicles except player 0's. | 1976 |
| `core_vehicles.removeCurrent()` | Deletes player 0's vehicle (logs an error if there is none); switches to free camera if there is no enterable vehicle left. | 1888 |
| `core_vehicles.replaceVehicle(modelName, opt, otherVeh, replaceWholeCollection)` | Replaces a vehicle (player 0's by default) with another model/config, reusing the existing vehicle object. If no vehicle exists, creates one (subject to the limit). Deletes the remaining vehicles of the replaced collection. Called directly by the interface. | 1908 |
| `core_vehicles.requestList()` | Sends the list of models and configurations to the interface (guihook sendVehicleList). In career in the garage "myCars" menu, sends the inventory vehicles instead of the configurations. *(internal)* | 1114 |
| `core_vehicles.requestListEnd()` | Ends the profiling of the vehicle list (called by the interface at the end). *(internal)* | 1161 |
| `core_vehicles.setMeshVisibility(alpha)` | Called by the configuration's mesh visibility buttons: sets the transparency of highlighted parts through core_vehicle_partmgmt. Do not use elsewhere. *(internal)* | 2948 |
| `core_vehicles.setPlateText(txt, vehId, designPath, formats)` | Sets a vehicle's plate text, design and formats, then renders the plate textures through core_skiaTemplate (unless SkipGenerateLicencePlate, licenseNoGen or headless mode: default plate "BEAMNG"). Emits onLicensePlateChanged(txt, vehId, designPath, formats). nil values keep the current values. | 2197 |
| `core_vehicles.setVehiclePersona(vehId, persona)` | Associates a persona (profile) with a vehicle and informs the vehicle (setPlayerPersona + onSettingsChanged on the vehicle side). | 2635 |
| `core_vehicles.spawnDefault(options)` | Spawns the user's default vehicle (file pathDefaultConfig) or, failing that, the game's default model; replaces the current vehicle if there is one. Emits onSpawnDefaultVehicle. | 2574 |
| `core_vehicles.spawnNewVehicle(modelName, opt)` | Spawns a new vehicle (or several for a multi-vehicle configuration). Switches to the game camera if there was no player vehicle. Called directly by the interface. | 1854 |

### Parameter details

#### `core_vehicles.changeMeshVisibility(delta)`

Called by the mesh visibility keys: changes the transparency of highlighted parts through core_vehicle_partmgmt. Do not use elsewhere.

- `delta` (*number*) : Visibility change.

#### `core_vehicles.cloneCurrent()`

Spawns a copy of player 0's vehicle (same model, config, paints), emits onPlayerVehicleCloned. Refuses if there is no vehicle, if the vehicle limit is reached or if the player is walking.

- **returns**: table|boolean|nil Result of spawnNewVehicle (vehicle object) or false if refused.

#### `core_vehicles.convertVehicleInfo(info, infoFilename)`

Converts an info.json to the new format: textual colors (colors) become paints (paints), old default colors (default_color...) become defaultPaintName1/2/3.

- `info` (*table*) : Content of an info.json (modified in place).
- `infoFilename` (*string*) : File path (for messages).
- **returns**: table The same table, converted.

#### `core_vehicles.createFilters(list)`

Builds the interface filters (min/max range or set of possible values per attribute) from the aggregates of a list of models or configurations.

- `list` (*table|nil*) : List or dictionary of elements that have an aggregates field.
- **returns**: table<string, table> Filters keyed by attribute name.

#### `core_vehicles.generateAttachedVehiclesTree(vehId)`

Builds the tree of coupled vehicles from a vehicle (parents and children through the couplings).

- `vehId` (*integer*) : Id of the starting vehicle.
- **returns**: table|nil Root entry of the tree (inferred from code).

#### `core_vehicles.getAttributesConvertToDict()`

List of attributes converted to a dictionary for the aggregates (Region, InsuranceClass).

- **returns**: string[] Attribute names.

#### `core_vehicles.getAttributesConvertToRange()`

List of attributes converted to a range for the aggregates (Value, Weight, Top Speed, 0-100 km/h, 0-60 mph, Weight/Power, Off-Road Score).

- **returns**: string[] Attribute names.

#### `core_vehicles.getAttributesWhiteList()`

List of attributes allowed as filters of the vehicle list (Drivetrain, Type, Transmission, Country, Brand, Body Style, Source...).

- **returns**: string[] Attribute names.

#### `core_vehicles.getConfig(modelName, configKey)`

Returns the configuration of a model by its key.

- `modelName` (*string*) : Model key (folder name in /vehicles).
- `configKey` (*string*) : Configuration key (name of the .pc without extension).
- **returns**: table|nil Configuration data, nil if absent.

#### `core_vehicles.getConfigList(array)`

Lists all configurations of all models, with the associated filters.

- `array` (*boolean|nil*) : true: list as an array; otherwise keyed by "model_key".
- **returns**: table {configs, filters, displayInfo}

#### `core_vehicles.getCouplerOffset(vehId, couplerTag)`

Offset (x, y, z) of a vehicle's coupler nodes relative to its reference node, filtered by tag.

- `vehId` (*integer*) : Vehicle id.
- `couplerTag` (*string|nil*) : Tag searched for (couplerTag or tag); empty or nil = all.
- **returns**: table<integer, table>|nil Table keyed by node id: {x, y, z, couplerTag, tag}.

#### `core_vehicles.getCurrentVehicleDetails()`

Details of player 0's vehicle (equivalent to getVehicleDetails(be:getPlayerVehicleID(0))). You can also use playerVehicle:getJBeamFilename().

- **returns**: table {current = {key, pc_file, position, color, config_key}, model, configs, userDefault}

#### `core_vehicles.getDefaultVehicleParams()`

Determines the default vehicle to launch at startup: vehicleConfig command-line argument, otherwise $beamngVehicleArgs, otherwise the default configuration of the vehicles folder, otherwise the pickup (or etk800).

- **returns**: table|boolean|nil {model, {config = .pc path}} or true/nil depending on the case (heterogeneous return value).

#### `core_vehicles.getFilesJson()`

Cache of the vehicles' info JSON files (computed on the first call).

- **returns**: table List of file paths (inferred from code).

#### `core_vehicles.getFilesParsed()`

Cache of the JSON/PC files already read, keyed by path (e.g. /vehicles/pickup/info.json).

- **returns**: table<string, table> Decoded content of the files.

#### `core_vehicles.getModel(key)`

All the info of a model: model sheet, configurations, paints, previews, aggregates. Result cached. An invalid name (non-string) returns {}; an unknown model logs an error and returns {}.

- `key` (*string*) : Model key (folder name in /vehicles).
- **returns**: table {model = table, configs = table<string, table>}, or {} if not found.

#### `core_vehicles.getModelList(array)`

List of all available models with the filters and display information.

- `array` (*boolean|nil*) : true: array; otherwise table keyed by model key.
- **returns**: table {models, filters, displayInfo}

#### `core_vehicles.getModelsData()`

Scans /vehicles and returns the models found with their files (info, .pc, jbeam, images). Result cached until clearCache.

- **returns**: table<string, table> Raw data per model key.

#### `core_vehicles.getPaintFiles()`

Cache of the paint files found.

- **returns**: table Paint files (inferred from code).

#### `core_vehicles.getVehicleDetails(id)`

Details of a vehicle: model key, .pc file, position, color, configuration key, model and configuration sheet.

- `id` (*integer*) : Vehicle object id.
- **returns**: table {current = {key, pc_file, position, color, config_key}, model, configs, userDefault (true if the .pc is the user's default config)}

#### `core_vehicles.getVehicleLicenseText(veh)`

Current plate text of a vehicle (dynData licenseText).

- `veh` (*userdata|nil*) : Vehicle object.
- **returns**: string Plate text, empty string without a vehicle.

#### `core_vehicles.getVehicleList()`

List of vehicles (full sheets of each model) and filters, format used by the old interface (ui2).

- **returns**: table {vehicles, filters}

#### `core_vehicles.getVehiclePersona(vehId)`

Persona (player profile) id associated with a vehicle.

- `vehId` (*integer*) : Vehicle id.
- **returns**: string|nil Persona id or nil.

#### `core_vehicles.isLicensePlateValid(text)`

Checks that a plate text is acceptable (nil accepted; the double quote is forbidden).

- `text` (*string|nil*) : Text to check.
- **returns**: boolean true if valid.

#### `core_vehicles.isModelListLoaded()`

Indicates whether all models are already in the getModel cache.

- **returns**: boolean true if the list is fully loaded.

#### `core_vehicles.isModelsDataLoaded()`

Indicates whether getModelsData has already been computed.

- **returns**: boolean true if cached.

#### `core_vehicles.loadCustomVehicle(modelName, data)`

Writes the model and config into the $beamngVehicle and $beamngVehicleConfig variables of the VariableRegistry (startup with a given vehicle).

- `modelName` (*string*) : Model key.
- `data` (*table*) : Table with the config field (.pc path).

#### `core_vehicles.loadModelListNoGarbage()`

Loads all models into the cache (getModel for each) without building a large list.

- **returns**: boolean true.

#### `core_vehicles.makeVehicleLicenseText(veh, designPath)`

Determines a vehicle's plate text: forced text (forceLicenceStr or file settings/cloud/forceLicencePlate.txt), text already stored (licenseText), Steam name if the useSteamName option is active in freeroam (only once), otherwise text generated by core_skiaTemplate.generateText.

- `veh` (*userdata|integer|nil*) : Vehicle object or id (player 0 by default).
- `designPath` (*string|nil*) : Path of the plate design (sktemplate).
- **returns**: string Plate text ('' without a vehicle).

#### `core_vehicles.onCouplerAttached(objId1, objId2, nodeId, obj2nodeId)`

Hook called when a coupler attaches: records the pair in attachedCouplers and vehsCouplings.

- `objId1` (*integer*) : Id of the first vehicle.
- `objId2` (*integer*) : Id of the second vehicle.
- `nodeId` (*integer*) : Coupler node of the first vehicle.
- `obj2nodeId` (*integer*) : Coupler node of the second vehicle.

#### `core_vehicles.onCouplerDetached(obj1id, obj2id, nodeId, obj2nodeId)`

Hook called when a coupler detaches (in any way): removes the pair from the tracking tables.

- `obj1id` (*integer*) : Id of the first vehicle.
- `obj2id` (*integer*) : Id of the second vehicle.
- `nodeId` (*integer*) : Node of the first vehicle.
- `obj2nodeId` (*integer*) : Node of the second vehicle.

#### `core_vehicles.onDeserialized(data)`

Hook called after an extensions reload: restores the tracking tables (players, personas, couplings, collections) and rebuilds the collection caches.

- `data` (*table*) : Data from onSerialize.

#### `core_vehicles.onFileChanged(filename, type)`

Hook called when a file changes on disk: marks the cache as stale if the file is a .json, .jbeam, .pc, .jpg or .png under /vehicles/ or /mods/.

- `filename` (*string*) : Path of the modified file.
- `type` (*string*) : Type of change (unused).

#### `core_vehicles.onInstabilityDetected(vid, returnData)`

Hook called when a vehicle's physics becomes unstable: if the pauseGameOnInstability setting is active (and outside multiplayer), resets the vehicle, pauses the game and sets returnData.instabilityHandled = true.

- `vid` (*integer*) : Id of the unstable vehicle.
- `returnData` (*table|nil*) : Return table where instabilityHandled is set to true.

#### `core_vehicles.onPersonaSettingsChanged(persona)`

Hook called when a persona's settings change: asks the vehicles that use it to re-read their settings (onSettingsChanged on the vehicle side).

- `persona` (*table|string*) : Persona or its id.

#### `core_vehicles.onPreVehicleSpawned(vehId)`

Hook called before a vehicle spawns: initializes the coupling tables (couplings, couplerCache, couplerTags, couplerOffset) from the vehicle's nodes that have a couplerTag or tag, and vehiclePlayersMap.

- `vehId` (*integer*) : Vehicle id.

#### `core_vehicles.onSerialize()`

Hook called before an extensions reload: returns the tracking tables of players, personas, couplings and collections (without vehsData).

- **returns**: table Data restored by onDeserialized.

#### `core_vehicles.onVehicleDestroyed(vid)`

Hook called when a vehicle is destroyed: removes its couplers, couplings, collections and player tracking entries.

- `vid` (*integer*) : Id of the destroyed vehicle.

#### `core_vehicles.onVehicleSwitched(oldId, newId, player)`

Hook called when a player changes vehicle: updates vehiclePlayersMap and playerVehicleMap and resynchronizes the personas.

- `oldId` (*integer*) : Old vehicle (-1 if none).
- `newId` (*integer*) : New vehicle (-1 if none).
- `player` (*integer*) : Player index.

#### `core_vehicles.openPartsSelectorUI()`

Opens the parts configuration screen (route pause.vehicle.configurationcombined or vehicleconfig module). Does nothing in the main menu or without a player vehicle; may return false if the guided first drive forbids it.

- **returns**: boolean|nil false if refused by the first drive session.

#### `core_vehicles.paintSignature(paint)`

JSON text identifying a paint (baseColor, clearcoat, clearcoatRoughness, metallic, roughness, to 5 decimals), useful to compare paints.

- `paint` (*table*) : Paint {baseColor = {r,g,b,a}, metallic, roughness, clearcoat, clearcoatRoughness}.
- **returns**: string JSON string.

#### `core_vehicles.regenerateVehicleLicenseText(veh)`

Generates a new random plate text for a vehicle without changing the stored text.

- `veh` (*userdata|nil*) : Vehicle object.
- **returns**: string Generated text ('' without a vehicle).

#### `core_vehicles.reloadVehicle(playerId)`

Called when a player's vehicle is reloaded: frees SteamLicensePlateVehicleId if it was that vehicle (so another one can carry the Steam name).

- `playerId` (*integer*) : Player index.

#### `core_vehicles.replaceVehicle(modelName, opt, otherVeh, replaceWholeCollection)`

Replaces a vehicle (player 0's by default) with another model/config, reusing the existing vehicle object. If no vehicle exists, creates one (subject to the limit). Deletes the remaining vehicles of the replaced collection. Called directly by the interface.

- `modelName` (*string*) : Model key.
- `opt` (*table|nil*) : Spawn options (config, paint, pos, rot, licenseText, autoEnterVehicle...).
- `otherVeh` (*userdata|nil*) : Vehicle to replace (player 0 by default).
- `replaceWholeCollection` (*boolean|nil*) : true: reuses all vehicles of the collection (trailers).
- **returns**: userdata|boolean|nil First vehicle; second return: list of all. false if the vehicle limit is reached, nil on failure.

#### `core_vehicles.setMeshVisibility(alpha)`

Called by the configuration's mesh visibility buttons: sets the transparency of highlighted parts through core_vehicle_partmgmt. Do not use elsewhere.

- `alpha` (*number*) : Opacity.

#### `core_vehicles.setPlateText(txt, vehId, designPath, formats)`

Sets a vehicle's plate text, design and formats, then renders the plate textures through core_skiaTemplate (unless SkipGenerateLicencePlate, licenseNoGen or headless mode: default plate "BEAMNG"). Emits onLicensePlateChanged(txt, vehId, designPath, formats). nil values keep the current values.

- `txt` (*string|nil*) : Text (generated if nil; no double quote).
- `vehId` (*integer|nil*) : Vehicle id (player 0 by default).
- `designPath` (*string|nil*) : Path of the .sktemplate.json (current value, then the level's design, then the default design as a fallback).
- `formats` (*string[]|nil*) : Formats to render ("30-15" by default).

#### `core_vehicles.setVehiclePersona(vehId, persona)`

Associates a persona (profile) with a vehicle and informs the vehicle (setPlayerPersona + onSettingsChanged on the vehicle side).

- `vehId` (*integer*) : Vehicle id.
- `persona` (*table|string|nil*) : Persona or its id (nil to remove).
- **returns**: boolean false if the persona was already that one, true if it changed.

#### `core_vehicles.spawnDefault(options)`

Spawns the user's default vehicle (file pathDefaultConfig) or, failing that, the game's default model; replaces the current vehicle if there is one. Emits onSpawnDefaultVehicle.

- `options` (*table|nil*) : Spawn options (config and licenseText are added).
- **returns**: userdata|boolean|nil Vehicle created, false if the limit is reached.

#### `core_vehicles.spawnNewVehicle(modelName, opt)`

Spawns a new vehicle (or several for a multi-vehicle configuration). Switches to the game camera if there was no player vehicle. Called directly by the interface.

- `modelName` (*string*) : Model key.
- `opt` (*table*) : Spawn options: config, paint, paint2, paint3, pos, rot, licenseText, vehicleName, autoEnterVehicle, canSpawnAnotherVehicleCheck, safeSpawn, additionalVehicleData... (do not pass nil, see notes).
- **returns**: userdata|boolean|nil First vehicle created; second return: list of all. false if limit reached, nil on failure.

## Fields

| Field | Type | Description |
|---|---|---|
| `attachedCouplers` | table[] | List of currently attached couplings: {vehicleId1, vehicleId2, node1, node2}. Updated by onCouplerAttached/onCouplerDetached. |
| `couplerTagsOptions` | table<string, string|boolean> | Known coupler tags (tow_hitch, fifthwheel, gooseneck_hitch, pintle = 'autoCouple'; fifthwheel_v2 = true). |
| `defaultVehicleModel` | string | Default model: 'pickup' (or 'etk800' for the tech version). |
| `dependencies` | string[] | core_vehiclePaints, core_locales, core_skiaTemplate. |
| `finalRanges` | string[] | Attributes that the interface must read as ranges (Years, Value, Weight, Top Speed, 0-100 km/h, 0-60 mph, Weight/Power, Off-Road Score). |
| `initVehCollections` | table | Vehicle collections in their initial state, keyed by main vehicle id. |
| `initVehIdToVehCollection` | table | Vehicle id -> initial collection (defined but not populated in this file). |
| `playerVehicleMap` | table<integer, integer> | Player index -> id of the vehicle they occupy. |
| `removeAllWithProperty` | nil | Always nil (undefined reference). ⚠ reference `removeAllWithProperty` not defined in the file (probably nil) |
| `resetVehCollectionEnabled` | boolean | true: re-enables repositioning of vehicle collections on reset (serialized). |
| `vehCollections` | table | Current vehicle collections, keyed by main vehicle id. |
| `vehIdToVehCollection` | table | Vehicle id -> collection it belongs to. |
| `vehiclePersonaMap` | table<integer, string> | Vehicle id -> persona (profile) id of the player occupying it. |
| `vehiclePlayersMap` | table<integer, table<integer, boolean>> | Vehicle id -> set of indexes of the players occupying it. |
| `vehsCouplerCache` | table | [vehicleId][nodeId] = copy of the coupler node data (couplerTag, tag, cid...). |
| `vehsCouplerOffset` | table | [vehicleId][nodeId] = vec3 offset of the coupler node relative to the reference node. |
| `vehsCouplerTags` | table | [vehicleId][nodeId] = couplerTag. |
| `vehsCouplings` | table | Adjacency of coupled vehicles: vehsCouplings[id][otherId] = true. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onBeforeVehicleReplaced` — listened to by 3 module(s)
- `onLicensePlateChanged`
- `onPlayerVehicleCloned` — listened to by 1 module(s)
- `onSpawnDefaultVehicle` — listened to by 1 module(s)
- `onVehicleCollectionReset`
- `onVehicleReplaced` — listened to by 6 module(s)

**UI events (guihooks.trigger):** `MenuOpenModule`, `Message`, `sendVehicleList`

## Calls into the engine (C++)

- `FS:` `directoryExists`, `directoryList`, `fileExists`, `findFiles`, `getFileOriginInfo`, `getGamePath`
- `be:` `enterNextVehicle`, `enterVehicle`, `getEnterableObjectCount`, `getObject`, `getObjectCount`, `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/vehicles.lua`.*
