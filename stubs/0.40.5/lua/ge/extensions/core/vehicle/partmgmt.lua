---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/vehicle/partmgmt.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_vehicle_partmgmt`: management of parts and configuration of a vehicle during gameplay (configuration menu, tuning). Reads/modifies the config of `core_vehicle_manager.getVehicleData(id).config` (partsTree, vars, paints) and respawns the vehicle (`respawn`) to apply changes, saves/loads/deletes local .pc configs (format 2, with an info_<name>.json file and a .jpg thumbnail), saves vehicle collections (format 4), sends the configurator data to the UI (VehicleConfigChange) and handles part highlighting ("X-ray" rendering with fade). The targeted vehicle is that of core_vehicle_configTarget (otherwise player 0's vehicle); most functions accept an explicit id.
--- Access: extension `core_vehicle_partmgmt`: `extensions.load("core_vehicle_partmgmt")`, then the global `core_vehicle_partmgmt`
---@class core_vehicle_partmgmt
---@field dependencies string[] core_locales, core_vehicle_configTarget, core_vehicle_thumbnail, core_vehicle_partFocusCamera, gameplay_achievement.
---@field xrayFadeRate number Mesh fade speed for the X-ray highlight, in alpha per second (5 by default). Editable from the console: core_vehicle_partmgmt.xrayFadeRate = 5.
core_vehicle_partmgmt = {}

--- Builds a vehicle's config table from config data: config table, serialized string starting with '{', or .pc file path. Without a valid config, falls back to default_pc from the model's info file. Format 2 files are merged into the result, otherwise the content becomes `parts`. Called by core_vehicle_manager on spawn.
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:245
---@param vehicleDir string model folder (e.g. 'vehicles/pickup/')
---@param configData table|string|nil config, serialized string or .pc path
---@param onlyReturnChosenConfig boolean|nil if true, returns (nil, false) instead of falling back to the default config
---@return table|nil  config {partConfigFilename, parts|..., vars, paints...}
---@return boolean  true if the requested config was actually used (not the default fallback)
function core_vehicle_partmgmt.buildConfigFromString(vehicleDir, configData, onlyReturnChosenConfig) end

--- Changes the transparency of the highlighted parts by a delta (result clamped 0..1).
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:1591
---@param deltaAlpha number change
---@param inVehID integer|nil vehicle
function core_vehicle_partmgmt.changeHighlightedPartsVisiblity(deltaAlpha, inVehID) end

--- Immediately removes the X-ray state (restores the alpha) for the given vehicle or all.
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:1369
---@param inVehID integer|nil vehicle; nil = all
function core_vehicle_partmgmt.clearVehicleHighlights(inVehID) end

--- Turns a tree of coupled vehicles (core_vehicles.generateAttachedVehiclesTree) into a list of vehicle configs: computes the relative offsets ('default': x,y,z,rx,ry,rz; 'coupledNodes': rotations only), numbers the parents and saves each vehicle's config (or a linkedPCFile if it comes from a .pc).
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:419
---@param collectionTree table vehicle tree {vehId, offsetData, children}
---@return table[]  list of vehicle configs (format 4)
function core_vehicle_partmgmt.compileVehicleCollection(collectionTree) end

--- Current config of the targeted vehicle.
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:981
---@return table|nil  config; nil without a vehicle
function core_vehicle_partmgmt.getConfig() end

--- Lists the .pc files of the targeted vehicle's model folder.
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:1074
---@return table[]|nil  entries {fileName, name, displayName?, official, player, thumbnailPath?}; nil without a vehicle
function core_vehicle_partmgmt.getConfigList() end

--- Current config of a vehicle (vehicleData.config).
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:974
---@param vehicleId integer vehicle id
---@return table|nil  config (not a copy); nil if unknown
function core_vehicle_partmgmt.getConfigOfVehicle(vehicleId) end

--- Resolves the id of the vehicle to configure (alias of core_vehicle_configTarget.resolveVehicleId).
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:25
---@param explicitVehicleId integer|nil requested id; nil = configuration target, otherwise player 0
---@return integer|nil  valid id, nil otherwise
function core_vehicle_partmgmt.getConfigVehicleId(explicitVehicleId) end

--- License plate text of the targeted vehicle.
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:1145
---@return string  text or ''
function core_vehicle_partmgmt.getCurrentLicensePlate() end

--- Base name (without folder or .pc) of the config loaded in the targeted vehicle.
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:1048
---@return string|nil  base name
function core_vehicle_partmgmt.getCurrentLocalConfigName() end

--- Indicates whether saving is possible (not on foot, vehicle present).
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:605
---@return table  {canSave = boolean, reason = 'walking'|'noVehicle'|nil}
function core_vehicle_partmgmt.getSaveAvailability() end

--- Editable metadata fields for saving (from saveConfigUtils) for the targeted vehicle's model.
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:1061
---@param targetConfigName string|nil target config (basename)
---@return table  fields; {} if no vehicle
function core_vehicle_partmgmt.getSaveMetadataFields(targetConfigName) end

--- Translates a UI name: text with a default translation prefix, or a table {txt, ctx} translated with context. Any other table gives nil.
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:151
---@param name string|table translation key or {txt, ctx}
---@param prefix string|nil fallback prefix, default 'ui.vehicleconfig.title.'
---@return string|nil  translated text
function core_vehicle_partmgmt.getTranslation(name, prefix) end

--- Indicates whether a part exists in the targeted vehicle's jbeam context.
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:846
---@param partName string part name
---@return boolean|nil  nil if partName is empty
function core_vehicle_partmgmt.hasAvailablePart(partName) end

--- Sets the highlighted parts (click on the UI eye) and applies the corresponding transparency.
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:1613
---@param parts table<string, boolean> [part path] = true for the visible parts
---@param inVehID integer|nil vehicle; nil = player
function core_vehicle_partmgmt.highlightParts(parts, inVehID) end

--- Replaces the targeted vehicle with the given config (core_vehicles.replaceVehicle with {config = filename}).
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:991
---@param filename string .pc config path or name
---@param respawn boolean|nil not used in the code
function core_vehicle_partmgmt.loadLocal(filename, respawn) end

--- Hook: restores the data from onSerialize.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:1902
---@param data table data
function core_vehicle_partmgmt.onDeserialized(data) end

--- Hook: the extension is unloaded; restores the meshes' alpha.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:1856
function core_vehicle_partmgmt.onExtensionUnloaded() end

--- Hook: files changed; empties the saveConfigUtils cache and invalidates the partpacks cache if a .partpacks.json changed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:1881
---@param files table[] list {filename, ...}
function core_vehicle_partmgmt.onFilesChanged(files) end

--- Hook: the language changes; empties the translation caches.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:1860
function core_vehicle_partmgmt.onLanguageChanged() end

--- Hook: translations are reloaded; empties the caches.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:1865
function core_vehicle_partmgmt.onReloadLocales() end

--- Hook: saves the highlight data before a Lua reload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:1894
---@return table  {vehsPartsData, vehsRichPartInfo}
function core_vehicle_partmgmt.onSerialize() end

--- Per-frame hook: applies the parts selector debounce and animates the X-ray fade.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:1870
---@param dt number elapsed time (s)
function core_vehicle_partmgmt.onUpdate(dt) end

--- Hook (core_vehicle_configTarget): the configuration target changes; clears the X-ray and sends the new vehicle's data to the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:1849
---@param current table|nil new target {vehId, playerId, returnRoute}
function core_vehicle_partmgmt.onVehicleConfigTargetChanged(current) end

--- Hook: a vehicle is destroyed; frees its highlight data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:1841
---@param vehID integer vehicle
function core_vehicle_partmgmt.onVehicleDestroyed(vehID) end

--- Hook: a vehicle spawns; resets the relevant X-ray state and the part info cache.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:1826
---@param vehID integer vehicle
function core_vehicle_partmgmt.onVehicleSpawned(vehID) end

--- Hook: the target player changes vehicle; clears the X-ray state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:1834
---@param oldID integer old vehicle
---@param newID integer new vehicle
---@param player integer player
function core_vehicle_partmgmt.onVehicleSwitched(oldID, newID, player) end

--- Opens the model's configs folder in the file explorer (creates it if it does not exist).
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:1312
function core_vehicle_partmgmt.openConfigFolderInExplorer() end

--- Called by the UI when the parts selector's selection changes; delays the application by 0.1 s (debounce) via highlightParts.
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:1734
---@param state table {vehID, partsSorted, partsHighlightedIdxs}
function core_vehicle_partmgmt.partsSelectorChanged(state) end

--- Flattens a resolved parts tree into a slotId -> chosen part name dictionary (`parts` format of .pc files). Slots with the same id at different paths are recorded under their full path.
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:322
---@param partsTree table config.partsTree
---@return table<string, string>  [slotId or path] = chosenPartName
function core_vehicle_partmgmt.partsTreeToPartsMap(partsTree) end

--- Generates and applies a new random license plate text.
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:1164
---@return string  generated text
function core_vehicle_partmgmt.regenerateCurrentLicensePlate() end

--- Gives the camera back to the player (core_vehicle_partFocusCamera.clear).
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:1517
function core_vehicle_partmgmt.releasePartFocusCamera() end

--- Deletes <folder>/<filename>.pc and its .jpg thumbnail then notifies the UI (VehicleconfigRemoved).
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:1000
---@param filename string config name without extension
function core_vehicle_partmgmt.removeLocal(filename) end

--- Resends the data to the UI (sendDataToUI).
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:901
function core_vehicle_partmgmt.reset() end

--- Reloads the original config (partConfigFilename) of the targeted vehicle.
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:1776
function core_vehicle_partmgmt.resetAllToLoadedConfig() end

--- Clears parts and vars of the targeted vehicle's config and recreates the vehicle.
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:1772
function core_vehicle_partmgmt.resetConfig() end

--- Parts Reset button: re-reads the parts of the original .pc and calls setPartsConfig (obsolete, see notes).
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:1786
function core_vehicle_partmgmt.resetPartsToLoadedConfig() end

--- Resets the tuning variables to those of the original .pc (empty if none) and recreates the vehicle.
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:1806
function core_vehicle_partmgmt.resetVarsToLoadedConfig() end

--- Clears the highlights (parts, transparency, camera) by fading back to the opaque vehicle.
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:1741
---@param onlyIfVehChanged boolean|nil true: only clears if the vehicle's model changed
---@param inVehID integer|nil vehicle
function core_vehicle_partmgmt.resetVehicleHighlights(onlyIfVehChanged, inVehID) end

--- Saves the targeted vehicle's config under a full path (alias of savePartConfigFile -> format 2).
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:713
---@param filename string .pc path
---@param saveSettings table|boolean|nil see notes
---@param saveMetadata table|nil metadata for the info file
---@return boolean  true if saved
function core_vehicle_partmgmt.save(filename, saveSettings, saveMetadata) end

--- Overwrites an existing player config (not an official config).
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:1277
---@param fileName string file name (with or without .pc)
---@param configurationName string|nil display name; empty = existing name
---@param saveSettings table|boolean|nil see notes
---@param saveMetadata table|nil metadata
---@return table  {success, reason?, ...} (possible reasons: configNotFound, notPlayerConfig, ...)
function core_vehicle_partmgmt.saveExistingLocalConfig(fileName, configurationName, saveSettings, saveMetadata) end

--- Saves the config under <model folder>/<fn>.
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:726
---@param fn string relative file name, with the .pc extension
---@param saveSettings table|boolean|nil see notes
---@param saveMetadata table|nil metadata
---@return boolean  true if saved; false without a vehicle
function core_vehicle_partmgmt.saveLocal(fn, saveSettings, saveMetadata) end

--- Step 1 of a thumbnail capture: switches to free camera, FOV 35, triggers saveLocalScreenshot_stage1 on the UI side.
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:746
---@param fn string file name (not used at this step)
function core_vehicle_partmgmt.saveLocalScreenshot(fn) end

--- Step 2: takes the jpg capture in the model folder then triggers saveLocalScreenshot_stage3.
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:756
---@param fn string capture file name
---@return boolean|nil  false without a vehicle
function core_vehicle_partmgmt.saveLocalScreenshot_stage2(fn) end

--- Saves the config under a new file name derived from configurationName (lowercase, numeric suffix if already taken), generates the thumbnail and unlocks the VEHICLE_CONFIG_SAVED achievement.
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:1268
---@param configurationName string display name of the configuration
---@param saveSettings table|boolean|nil see notes
---@param saveMetadata table|nil metadata
---@return table  {success, reason?, fileName?, displayName?, configSaved?, thumbnailCopied?}
function core_vehicle_partmgmt.saveNewLocalConfig(configurationName, saveSettings, saveMetadata) end

--- Saves the targeted vehicle's config in format 2 to `filename` (+ info_<name>.json file + paints according to saveSettings), notifies the UI and empties the selector caches. See the notes on the alias.
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:631
---@param partsCondition any parts conditions (nil in current calls)
---@param filename string .pc path (e.g. 'vehicles/pickup/my_config.pc')
---@param saveSettings table|boolean|nil see notes
---@param saveMetadata table|nil metadata to write in the info file
---@return boolean  true if the .pc was written
function core_vehicle_partmgmt.savePartConfigFileStage2(partsCondition, filename, saveSettings, saveMetadata) end

--- Writes a vehicle collection in format 4 to a JSON file and notifies the UI (VehicleconfigSaved, message).
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:503
---@param collectionTree table vehicle tree
---@param filename string output .pc file
function core_vehicle_partmgmt.saveVehicleCollection(collectionTree, filename) end

--- Saves the targeted vehicle's config as the default vehicle (settings/default.pc) and displays a message.
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:767
function core_vehicle_partmgmt.savedefault() end

--- Temporary selection (hover of a part in the UI): sets these parts to full visibility and reframes the part camera.
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:1645
---@param parts table<string, boolean> hovered parts
---@param inVehID integer|nil vehicle
---@param cameraParts table|nil parts to frame; default = parts
---@param cameraOptions table|nil partFocusCamera.focusOnParts options (e.g. immediate)
function core_vehicle_partmgmt.selectParts(parts, inVehID, cameraParts, cameraOptions) end

--- Sends to the UI (raw guihook VehicleConfigChange) all the configurator data: id, model, chosen parts tree, translated tuning variables, .pc default values, partpacks catalog, highlighted parts, enriched part info.
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:792
---@param explicitVehicleId integer|nil vehicle; nil = target
function core_vehicle_partmgmt.sendDataToUI(explicitVehicleId) end

--- Sends to the UI (guihook PartsSelectorUpdate) the sorted list of parts and the highlighted indexes.
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:1711
function core_vehicle_partmgmt.sendPartsSelectorStateToUI() end

--- Like setConfigOfVehicle for the targeted vehicle (or explicitVehicleId).
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:945
---@param inData table data to merge
---@param respawn boolean|nil see setConfigOfVehicle
---@param explicitVehicleId integer|nil vehicle; nil = target
function core_vehicle_partmgmt.setConfig(inData, respawn, explicitVehicleId) end

--- Merges `inData` into the given vehicle's config (see notes on respawn).
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:905
---@param veh userdata vehicle object
---@param inData table e.g. {paints = ...}, {vars = ...}, {partsTree = ...}, {parts = ...}
---@param respawn boolean|nil true (default): recreates the vehicle; false: live paint update
function core_vehicle_partmgmt.setConfigOfVehicle(veh, inData, respawn) end

--- Merges a list of paints into the config ({paints = data}).
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:957
---@param data table[] paints (1..3)
---@param respawn boolean|nil true = recreate the vehicle
---@param explicitVehicleId integer|nil vehicle; nil = target
function core_vehicle_partmgmt.setConfigPaints(data, respawn, explicitVehicleId) end

--- Merges tuning variables ({vars = data}) into the targeted vehicle's config.
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:961
---@param data table<string, number> [variable name] = value
---@param respawn boolean|nil true = recreate the vehicle
function core_vehicle_partmgmt.setConfigVars(data, respawn) end

--- Sets the display name (Configuration) in the targeted vehicle's config (without saving).
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:735
---@param configurationName string name
---@return boolean  false without a vehicle
function core_vehicle_partmgmt.setCurrentConfigurationName(configurationName) end

--- Applies a license plate text to the targeted vehicle (core_vehicles.setPlateText).
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:1157
---@param text string license plate text
---@return boolean  false without a vehicle
function core_vehicle_partmgmt.setCurrentLicensePlate(text) end

--- Sets the transparency of the highlighted parts.
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:1580
---@param alpha number 0 (invisible) to 1 (opaque)
---@param inVehID integer|nil vehicle
function core_vehicle_partmgmt.setHighlightedPartsVisiblity(alpha, inVehID) end

--- Updates the highlight data after a parts change: existing parts keep their state, new ones take that of their parent.
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:1656
---@param inVehID integer|nil vehicle
---@param silent boolean|nil true: do not notify the UI
function core_vehicle_partmgmt.setNewParts(inVehID, silent) end

--- Obsolete: logs an error asking to use setPartsTreeConfig. Applies nothing.
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:965
---@param data table ignored
---@param respawn boolean|nil ignored
function core_vehicle_partmgmt.setPartsConfig(data, respawn) end

--- Applies a new parts tree to the targeted vehicle (merge of {partsTree = dataTree}) and emits the onPartsTreeConfigChanged(dataTree, respawn, part) hook beforehand.
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:969
---@param dataTree table parts tree (chosenPartName, children...)
---@param respawn boolean|nil true = recreate the vehicle
---@param part any part that caused the change (passed to the hook only)
function core_vehicle_partmgmt.setPartsTreeConfig(dataTree, respawn, part) end

--- Applies a skin: chooses the part '<model>_skin_<skin>' in the 'paint_design' slot then replaces the vehicle. An empty skin removes the skin.
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:859
---@param skin string|nil skin name
function core_vehicle_partmgmt.setSkin(skin) end

--- Goes back to displaying the highlighted parts (after a hover).
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:1603
---@param inVehID integer|nil vehicle
---@param cameraParts table|nil parts the camera keeps framed
---@param cameraOptions table|nil camera options
function core_vehicle_partmgmt.showHighlightedParts(inVehID, cameraParts, cameraOptions) end

--- Copies the tuning variables while translating title, description, category and subCategory.
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:167
---@param tuningData table|nil vdata.variables
---@return table  translated copy
function core_vehicle_partmgmt.translateTuningData(tuningData) end

--- Compares the targeted vehicle's current paints with those of the model/library (core_vehiclePaints.validatePcPaints) and adds the default save settings.
---Source: lua/ge/extensions/core/vehicle/partmgmt.lua:1128
---@return table  result of validatePcPaints + defaults; {} without a vehicle
function core_vehicle_partmgmt.validatePaints() end

