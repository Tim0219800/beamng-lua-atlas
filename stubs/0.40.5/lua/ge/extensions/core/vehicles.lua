---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/vehicles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Vehicle catalog and spawning on the GE side. It reads the /vehicles/<model>/ folders (info.json, .pc files, images, paints, jbeam) to build the list of models and configurations with their filtering aggregates (cache invalidated when files change), and provides the functions to spawn/replace/delete vehicles (including multi-vehicle configurations, .pc format 4: trailers, etc.). It also tracks the couplings (hitches) between vehicles, the "vehicle collections" (main vehicle + trailers to be repositioned together), who drives which vehicle (vehiclePlayersMap) and the license plate. A modder uses it to list the models (getModelList, getConfig), spawn or replace a car (spawnNewVehicle, replaceVehicle) and change the plate (setPlateText).
--- Access: extension `core_vehicles`: `extensions.load("core_vehicles")`, then the global `core_vehicles`
---@class core_vehicles
---@field attachedCouplers table[] List of currently attached couplings: {vehicleId1, vehicleId2, node1, node2}. Updated by onCouplerAttached/onCouplerDetached.
---@field couplerTagsOptions table<string, string|boolean> Known coupler tags (tow_hitch, fifthwheel, gooseneck_hitch, pintle = 'autoCouple'; fifthwheel_v2 = true).
---@field defaultVehicleModel string Default model: 'pickup' (or 'etk800' for the tech version).
---@field dependencies string[] core_vehiclePaints, core_locales, core_skiaTemplate.
---@field finalRanges string[] Attributes that the interface must read as ranges (Years, Value, Weight, Top Speed, 0-100 km/h, 0-60 mph, Weight/Power, Off-Road Score).
---@field initVehCollections table Vehicle collections in their initial state, keyed by main vehicle id.
---@field initVehIdToVehCollection table Vehicle id -> initial collection (defined but not populated in this file).
---@field playerVehicleMap table<integer, integer> Player index -> id of the vehicle they occupy.
---@field removeAllWithProperty nil Always nil (undefined reference).
---@field resetVehCollectionEnabled boolean true: re-enables repositioning of vehicle collections on reset (serialized).
---@field vehCollections table Current vehicle collections, keyed by main vehicle id.
---@field vehIdToVehCollection table Vehicle id -> collection it belongs to.
---@field vehiclePersonaMap table<integer, string> Vehicle id -> persona (profile) id of the player occupying it.
---@field vehiclePlayersMap table<integer, table<integer, boolean>> Vehicle id -> set of indexes of the players occupying it.
---@field vehsCouplerCache table [vehicleId][nodeId] = copy of the coupler node data (couplerTag, tag, cid...).
---@field vehsCouplerOffset table [vehicleId][nodeId] = vec3 offset of the coupler node relative to the reference node.
---@field vehsCouplerTags table [vehicleId][nodeId] = couplerTag.
---@field vehsCouplings table Adjacency of coupled vehicles: vehsCouplings[id][otherId] = true.
core_vehicles = {}

--- Called by the mesh visibility keys: changes the transparency of highlighted parts through core_vehicle_partmgmt. Do not use elsewhere.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicles.lua:2943
---@param delta number Visibility change.
function core_vehicles.changeMeshVisibility(delta) end

--- Empties all caches (files, models, model data); they are rebuilt on demand.
---Source: lua/ge/extensions/core/vehicles.lua:2019
function core_vehicles.clearCache() end

--- Spawns a copy of player 0's vehicle (same model, config, paints), emits onPlayerVehicleCloned. Refuses if there is no vehicle, if the vehicle limit is reached or if the player is walking.
---Source: lua/ge/extensions/core/vehicles.lua:1986
---@return table|boolean|nil  Result of spawnNewVehicle (vehicle object) or false if refused.
function core_vehicles.cloneCurrent() end

--- Converts an info.json to the new format: textual colors (colors) become paints (paints), old default colors (default_color...) become defaultPaintName1/2/3.
---Source: lua/ge/extensions/core/vehicles.lua:572
---@param info table Content of an info.json (modified in place).
---@param infoFilename string File path (for messages).
---@return table  The same table, converted.
function core_vehicles.convertVehicleInfo(info, infoFilename) end

--- Builds the interface filters (min/max range or set of possible values per attribute) from the aggregates of a list of models or configurations.
---Source: lua/ge/extensions/core/vehicles.lua:966
---@param list table|nil List or dictionary of elements that have an aggregates field.
---@return table<string, table>  Filters keyed by attribute name.
function core_vehicles.createFilters(list) end

--- Switches to free camera if there is no enterable vehicle left (unless the player is the unicycle).
---Source: lua/ge/extensions/core/vehicles.lua:1900
function core_vehicles.enterFreecamIfNoVehicles() end

--- Development tool: displays the property values of all models/configurations and the matching translation lines.
---Source: lua/ge/extensions/core/vehicles.lua:3149
function core_vehicles.extractProperties() end

--- Development tool: goes through all models and configurations to compare the paints of the .pc files and of the infos.
---Source: lua/ge/extensions/core/vehicles.lua:3227
function core_vehicles.extractVehicles() end

--- Builds the tree of coupled vehicles from a vehicle (parents and children through the couplings).
---Source: lua/ge/extensions/core/vehicles.lua:1504
---@param vehId integer Id of the starting vehicle.
---@return table|nil  Root entry of the tree (inferred from code).
function core_vehicles.generateAttachedVehiclesTree(vehId) end

--- List of attributes converted to a dictionary for the aggregates (Region, InsuranceClass).
---Source: lua/ge/extensions/core/vehicles.lua:2953
---@return string[]  Attribute names.
function core_vehicles.getAttributesConvertToDict() end

--- List of attributes converted to a range for the aggregates (Value, Weight, Top Speed, 0-100 km/h, 0-60 mph, Weight/Power, Off-Road Score).
---Source: lua/ge/extensions/core/vehicles.lua:2954
---@return string[]  Attribute names.
function core_vehicles.getAttributesConvertToRange() end

--- List of attributes allowed as filters of the vehicle list (Drivetrain, Type, Transmission, Country, Brand, Body Style, Source...).
---Source: lua/ge/extensions/core/vehicles.lua:2952
---@return string[]  Attribute names.
function core_vehicles.getAttributesWhiteList() end

--- Returns the configuration of a model by its key.
---Source: lua/ge/extensions/core/vehicles.lua:1057
---@param modelName string Model key (folder name in /vehicles).
---@param configKey string Configuration key (name of the .pc without extension).
---@return table|nil  Configuration data, nil if absent.
function core_vehicles.getConfig(modelName, configKey) end

--- Lists all configurations of all models, with the associated filters.
---Source: lua/ge/extensions/core/vehicles.lua:1038
---@param array boolean|nil true: list as an array; otherwise keyed by "model_key".
---@return table  {configs, filters, displayInfo}
function core_vehicles.getConfigList(array) end

--- Offset (x, y, z) of a vehicle's coupler nodes relative to its reference node, filtered by tag.
---Source: lua/ge/extensions/core/vehicles.lua:1510
---@param vehId integer Vehicle id.
---@param couplerTag string|nil Tag searched for (couplerTag or tag); empty or nil = all.
---@return table<integer, table>|nil  Table keyed by node id: {x, y, z, couplerTag, tag}.
function core_vehicles.getCouplerOffset(vehId, couplerTag) end

--- Details of player 0's vehicle (equivalent to getVehicleDetails(be:getPlayerVehicleID(0))). You can also use playerVehicle:getJBeamFilename().
---Source: lua/ge/extensions/core/vehicles.lua:961
---@return table  {current = {key, pc_file, position, color, config_key}, model, configs, userDefault}
function core_vehicles.getCurrentVehicleDetails() end

--- Determines the default vehicle to launch at startup: vehicleConfig command-line argument, otherwise $beamngVehicleArgs, otherwise the default configuration of the vehicles folder, otherwise the pickup (or etk800).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicles.lua:2312
---@return table|boolean|nil  {model, {config = .pc path}} or true/nil depending on the case (heterogeneous return value).
function core_vehicles.getDefaultVehicleParams() end

--- Cache of the vehicles' info JSON files (computed on the first call).
---Source: lua/ge/extensions/core/vehicles.lua:388
---@return table  List of file paths (inferred from code).
function core_vehicles.getFilesJson() end

--- Cache of the JSON/PC files already read, keyed by path (e.g. /vehicles/pickup/info.json).
---Source: lua/ge/extensions/core/vehicles.lua:404
---@return table<string, table>  Decoded content of the files.
function core_vehicles.getFilesParsed() end

--- All the info of a model: model sheet, configurations, paints, previews, aggregates. Result cached. An invalid name (non-string) returns {}; an unknown model logs an error and returns {}.
---Source: lua/ge/extensions/core/vehicles.lua:771
---@param key string Model key (folder name in /vehicles).
---@return table  {model = table, configs = table<string, table>}, or {} if not found.
function core_vehicles.getModel(key) end

--- List of all available models with the filters and display information.
---Source: lua/ge/extensions/core/vehicles.lua:1002
---@param array boolean|nil true: array; otherwise table keyed by model key.
---@return table  {models, filters, displayInfo}
function core_vehicles.getModelList(array) end

--- Scans /vehicles and returns the models found with their files (info, .pc, jbeam, images). Result cached until clearCache.
---Source: lua/ge/extensions/core/vehicles.lua:433
---@return table<string, table>  Raw data per model key.
function core_vehicles.getModelsData() end

--- Cache of the paint files found.
---Source: lua/ge/extensions/core/vehicles.lua:410
---@return table  Paint files (inferred from code).
function core_vehicles.getPaintFiles() end

--- Details of a vehicle: model key, .pc file, position, color, configuration key, model and configuration sheet.
---Source: lua/ge/extensions/core/vehicles.lua:939
---@param id integer Vehicle object id.
---@return table  {current = {key, pc_file, position, color, config_key}, model, configs, userDefault (true if the .pc is the user's default config)}
function core_vehicles.getVehicleDetails(id) end

--- Current plate text of a vehicle (dynData licenseText).
---Source: lua/ge/extensions/core/vehicles.lua:2152
---@param veh userdata|nil Vehicle object.
---@return string  Plate text, empty string without a vehicle.
function core_vehicles.getVehicleLicenseText(veh) end

--- List of vehicles (full sheets of each model) and filters, format used by the old interface (ui2).
---Source: lua/ge/extensions/core/vehicles.lua:1167
---@return table  {vehicles, filters}
function core_vehicles.getVehicleList() end

--- Persona (player profile) id associated with a vehicle.
---Source: lua/ge/extensions/core/vehicles.lua:2644
---@param vehId integer Vehicle id.
---@return string|nil  Persona id or nil.
function core_vehicles.getVehiclePersona(vehId) end

--- Checks that a plate text is acceptable (nil accepted; the double quote is forbidden).
---Source: lua/ge/extensions/core/vehicles.lua:2160
---@param text string|nil Text to check.
---@return boolean  true if valid.
function core_vehicles.isLicensePlateValid(text) end

--- Indicates whether all models are already in the getModel cache.
---Source: lua/ge/extensions/core/vehicles.lua:1029
---@return boolean  true if the list is fully loaded.
function core_vehicles.isModelListLoaded() end

--- Indicates whether getModelsData has already been computed.
---Source: lua/ge/extensions/core/vehicles.lua:546
---@return boolean  true if cached.
function core_vehicles.isModelsDataLoaded() end

--- Writes the model and config into the $beamngVehicle and $beamngVehicleConfig variables of the VariableRegistry (startup with a given vehicle).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicles.lua:2302
---@param modelName string Model key.
---@param data table Table with the config field (.pc path).
function core_vehicles.loadCustomVehicle(modelName, data) end

--- Loads all models into the cache (getModel for each) without building a large list.
---Source: lua/ge/extensions/core/vehicles.lua:1021
---@return boolean  true.
function core_vehicles.loadModelListNoGarbage() end

--- Determines a vehicle's plate text: forced text (forceLicenceStr or file settings/cloud/forceLicencePlate.txt), text already stored (licenseText), Steam name if the useSteamName option is active in freeroam (only once), otherwise text generated by core_skiaTemplate.generateText.
---Source: lua/ge/extensions/core/vehicles.lua:2100
---@param veh userdata|integer|nil Vehicle object or id (player 0 by default).
---@param designPath string|nil Path of the plate design (sktemplate).
---@return string  Plate text ('' without a vehicle).
function core_vehicles.makeVehicleLicenseText(veh, designPath) end

--- Hook called when a coupler attaches: records the pair in attachedCouplers and vehsCouplings.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicles.lua:2829
---@param objId1 integer Id of the first vehicle.
---@param objId2 integer Id of the second vehicle.
---@param nodeId integer Coupler node of the first vehicle.
---@param obj2nodeId integer Coupler node of the second vehicle.
function core_vehicles.onCouplerAttached(objId1, objId2, nodeId, obj2nodeId) end

--- Hook called when a coupler detaches (in any way): removes the pair from the tracking tables.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicles.lua:2910
---@param obj1id integer Id of the first vehicle.
---@param obj2id integer Id of the second vehicle.
---@param nodeId integer Node of the first vehicle.
---@param obj2nodeId integer Node of the second vehicle.
function core_vehicles.onCouplerDetached(obj1id, obj2id, nodeId, obj2nodeId) end

--- Hook called after an extensions reload: restores the tracking tables (players, personas, couplings, collections) and rebuilds the collection caches.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicles.lua:2988
---@param data table Data from onSerialize.
function core_vehicles.onDeserialized(data) end

--- Hook called when a file changes on disk: marks the cache as stale if the file is a .json, .jbeam, .pc, .jpg or .png under /vehicles/ or /mods/.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicles.lua:2069
---@param filename string Path of the modified file.
---@param type string Type of change (unused).
function core_vehicles.onFileChanged(filename, type) end

--- Hook called after a series of file changes: empties the cache if a relevant file changed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicles.lua:2082
function core_vehicles.onFileChangedEnd() end

--- Hook called when a vehicle's physics becomes unstable: if the pauseGameOnInstability setting is active (and outside multiplayer), resets the vehicle, pauses the game and sets returnData.instabilityHandled = true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicles.lua:3010
---@param vid integer Id of the unstable vehicle.
---@param returnData table|nil Return table where instabilityHandled is set to true.
function core_vehicles.onInstabilityDetected(vid, returnData) end

--- Hook called on language change: empties the cache (translated names).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicles.lua:2096
function core_vehicles.onLanguageChanged() end

--- Hook called when the local participants (multi-seat) change: resynchronizes the persona of each occupied vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicles.lua:2681
function core_vehicles.onLocalParticipantsChanged() end

--- Hook called when a persona's settings change: asks the vehicles that use it to re-read their settings (onSettingsChanged on the vehicle side).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicles.lua:2669
---@param persona table|string Persona or its id.
function core_vehicles.onPersonaSettingsChanged(persona) end

--- Hook called before a vehicle spawns: initializes the coupling tables (couplings, couplerCache, couplerTags, couplerOffset) from the vehicle's nodes that have a couplerTag or tag, and vehiclePlayersMap.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicles.lua:2599
---@param vehId integer Vehicle id.
function core_vehicles.onPreVehicleSpawned(vehId) end

--- Hook called before an extensions reload: returns the tracking tables of players, personas, couplings and collections (without vehsData).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicles.lua:2956
---@return table  Data restored by onDeserialized.
function core_vehicles.onSerialize() end

--- Hook called when settings change: the showStandalonePcs logic is frozen to true in the code (the comparison in practice only triggers on the first call).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicles.lua:2088
function core_vehicles.onSettingsChanged() end

--- Hook called when a vehicle is destroyed: removes its couplers, couplings, collections and player tracking entries.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicles.lua:2709
---@param vid integer Id of the destroyed vehicle.
function core_vehicles.onVehicleDestroyed(vid) end

--- Hook called when a player changes vehicle: updates vehiclePlayersMap and playerVehicleMap and resynchronizes the personas.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicles.lua:2687
---@param oldId integer Old vehicle (-1 if none).
---@param newId integer New vehicle (-1 if none).
---@param player integer Player index.
function core_vehicles.onVehicleSwitched(oldId, newId, player) end

--- Opens the parts configuration screen (route pause.vehicle.configurationcombined or vehicleconfig module). Does nothing in the main menu or without a player vehicle; may return false if the guided first drive forbids it.
---Source: lua/ge/extensions/core/vehicles.lua:1079
---@return boolean|nil  false if refused by the first drive session.
function core_vehicles.openPartsSelectorUI() end

--- Opens the vehicle selector (new interface depending on whether pause menu V2 is used). Does nothing in the main menu.
---Source: lua/ge/extensions/core/vehicles.lua:1067
function core_vehicles.openSelectorUI() end

--- Opens the old vehicle selector (guihook MenuOpenModule 'vehicleselect'). The name contains a typo (legcay).
---Source: lua/ge/extensions/core/vehicles.lua:1101
function core_vehicles.openSelectorUI_legcay() end

--- JSON text identifying a paint (baseColor, clearcoat, clearcoatRoughness, metallic, roughness, to 5 decimals), useful to compare paints.
---Source: lua/ge/extensions/core/vehicles.lua:3131
---@param paint table Paint {baseColor = {r,g,b,a}, metallic, roughness, clearcoat, clearcoatRoughness}.
---@return string  JSON string.
function core_vehicles.paintSignature(paint) end

--- Generates a new random plate text for a vehicle without changing the stored text.
---Source: lua/ge/extensions/core/vehicles.lua:2140
---@param veh userdata|nil Vehicle object.
---@return string  Generated text ('' without a vehicle).
function core_vehicles.regenerateVehicleLicenseText(veh) end

--- Called when a player's vehicle is reloaded: frees SteamLicensePlateVehicleId if it was that vehicle (so another one can carry the Steam name).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicles.lua:2935
---@param playerId integer Player index.
function core_vehicles.reloadVehicle(playerId) end

--- Deletes all vehicles; first switches to free camera if player 0 had a vehicle.
---Source: lua/ge/extensions/core/vehicles.lua:2009
function core_vehicles.removeAll() end

--- Deletes all vehicles except player 0's.
---Source: lua/ge/extensions/core/vehicles.lua:1976
function core_vehicles.removeAllExceptCurrent() end

--- Deletes player 0's vehicle (logs an error if there is none); switches to free camera if there is no enterable vehicle left.
---Source: lua/ge/extensions/core/vehicles.lua:1888
function core_vehicles.removeCurrent() end

--- Replaces a vehicle (player 0's by default) with another model/config, reusing the existing vehicle object. If no vehicle exists, creates one (subject to the limit). Deletes the remaining vehicles of the replaced collection. Called directly by the interface.
---Source: lua/ge/extensions/core/vehicles.lua:1908
---@param modelName string Model key.
---@param opt table|nil Spawn options (config, paint, pos, rot, licenseText, autoEnterVehicle...).
---@param otherVeh userdata|nil Vehicle to replace (player 0 by default).
---@param replaceWholeCollection boolean|nil true: reuses all vehicles of the collection (trailers).
---@return userdata|boolean|nil  First vehicle; second return: list of all. false if the vehicle limit is reached, nil on failure.
function core_vehicles.replaceVehicle(modelName, opt, otherVeh, replaceWholeCollection) end

--- Sends the list of models and configurations to the interface (guihook sendVehicleList). In career in the garage "myCars" menu, sends the inventory vehicles instead of the configurations.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicles.lua:1114
function core_vehicles.requestList() end

--- Ends the profiling of the vehicle list (called by the interface at the end).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicles.lua:1161
function core_vehicles.requestListEnd() end

--- Called by the configuration's mesh visibility buttons: sets the transparency of highlighted parts through core_vehicle_partmgmt. Do not use elsewhere.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicles.lua:2948
---@param alpha number Opacity.
function core_vehicles.setMeshVisibility(alpha) end

--- Sets a vehicle's plate text, design and formats, then renders the plate textures through core_skiaTemplate (unless SkipGenerateLicencePlate, licenseNoGen or headless mode: default plate "BEAMNG"). Emits onLicensePlateChanged(txt, vehId, designPath, formats). nil values keep the current values.
---Source: lua/ge/extensions/core/vehicles.lua:2197
---@param txt string|nil Text (generated if nil; no double quote).
---@param vehId integer|nil Vehicle id (player 0 by default).
---@param designPath string|nil Path of the .sktemplate.json (current value, then the level's design, then the default design as a fallback).
---@param formats string[]|nil Formats to render ("30-15" by default).
function core_vehicles.setPlateText(txt, vehId, designPath, formats) end

--- Associates a persona (profile) with a vehicle and informs the vehicle (setPlayerPersona + onSettingsChanged on the vehicle side).
---Source: lua/ge/extensions/core/vehicles.lua:2635
---@param vehId integer Vehicle id.
---@param persona table|string|nil Persona or its id (nil to remove).
---@return boolean  false if the persona was already that one, true if it changed.
function core_vehicles.setVehiclePersona(vehId, persona) end

--- Spawns the user's default vehicle (file pathDefaultConfig) or, failing that, the game's default model; replaces the current vehicle if there is one. Emits onSpawnDefaultVehicle.
---Source: lua/ge/extensions/core/vehicles.lua:2574
---@param options table|nil Spawn options (config and licenseText are added).
---@return userdata|boolean|nil  Vehicle created, false if the limit is reached.
function core_vehicles.spawnDefault(options) end

--- Spawns a new vehicle (or several for a multi-vehicle configuration). Switches to the game camera if there was no player vehicle. Called directly by the interface.
---Source: lua/ge/extensions/core/vehicles.lua:1854
---@param modelName string Model key.
---@param opt table Spawn options: config, paint, paint2, paint3, pos, rot, licenseText, vehicleName, autoEnterVehicle, canSpawnAnotherVehicleCheck, safeSpawn, additionalVehicleData... (do not pass nil, see notes).
---@return userdata|boolean|nil  First vehicle created; second return: list of all. false if limit reached, nil on failure.
function core_vehicles.spawnNewVehicle(modelName, opt) end

