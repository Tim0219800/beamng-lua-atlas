# `core_vehicle_partmgmt`

*File: `lua/ge/extensions/core/vehicle/partmgmt.lua` · VM: Game Engine (GE) · 1979 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_vehicle_partmgmt`: `extensions.load("core_vehicle_partmgmt")`, then the global `core_vehicle_partmgmt`

GE extension `core_vehicle_partmgmt`: management of parts and configuration of a vehicle during gameplay (configuration menu, tuning). Reads/modifies the config of `core_vehicle_manager.getVehicleData(id).config` (partsTree, vars, paints) and respawns the vehicle (`respawn`) to apply changes, saves/loads/deletes local .pc configs (format 2, with an info_<name>.json file and a .jpg thumbnail), saves vehicle collections (format 4), sends the configurator data to the UI (VehicleConfigChange) and handles part highlighting ("X-ray" rendering with fade). The targeted vehicle is that of core_vehicle_configTarget (otherwise player 0's vehicle); most functions accept an explicit id.

## Example

```lua
-- Change the player vehicle's tuning variables without a full respawn
core_vehicle_partmgmt.setConfigVars({['$camber_F'] = 0.1}, true)
-- Save a local config
local res = core_vehicle_partmgmt.saveNewLocalConfig('My config', {generateThumbnail = true, savePaints = true}, nil)
print(res.success, res.fileName)
-- Read a vehicle's config
local cfg = core_vehicle_partmgmt.getConfigOfVehicle(be:getPlayerVehicleID(0))
dump(cfg.partsTree.chosenPartName)
```

## Notes

- Save settings (saveSettings, table): generateThumbnail (default true), saveLicenseplate (false), savePaints (true), overridePaints (false: writes the paints as explicit paints in the info file), useThumbnailFile + thumbnailFile (provided thumbnail), thumbnailCaptureId (id of a temporary core_vehicle_thumbnail capture). A boolean in place of the table is accepted (legacy withThumbnail argument). The metadata (saveMetadata) is validated by ge/extensions/vehicles/saveConfigUtils.
- The functions saveNewLocalConfig / saveExistingLocalConfig return a table {success, reason?, fileName?, displayName?, configSaved?, thumbnailCopied?, metadataError?}. Reasons: walking, noVehicle, invalidFilename, invalidMetadata, saveFailed, thumbnailCopyFailed, configNotFound, notPlayerConfig.
- Config paths are relative to the model folder (vehicleDirectory, e.g. 'vehicles/pickup/'). After saving, core_vehicles.clearCache() and ui_vehicleSelector_general.clearCache() are called.
- setConfig / setConfigOfVehicle merge (tableMerge) the data into the vehicle's config. With respawn (true by default when nil), the vehicle is recreated via veh:respawn(serialize(config)); with respawn=false, only the paints are updated live (liveUpdateVehicleColors) and the partConfig field is rewritten. The first modification triggers the VEHICLE_MODIFIED achievement outside career.
- setPartsConfig is obsolete: it just logs an error and asks to use setPartsTreeConfig. resetPartsToLoadedConfig still calls it, however, so this "Reset" button does nothing (game inconsistency).
- Probable BUG: in buildConfigFromString, the inner function preprocessPartConfig returns nothing at the end of the format 4 case (it only has a return for a linked file failure and for the non-format 4 case); a format 4 config passed directly therefore falls back to the model's default config.
- saveVehicle (collections) reads a variable `partsCondition` that is never defined in its scope: data.partsCondition is always nil.
- M.savePartConfigFileStage2 points to savePartConfigFileStage2_Format2 (signature partsCondition, filename, saveSettings, saveMetadata) and not to the function of the same name (format 4) defined earlier, which is not exported.
- No public function to call isOfficialConfig/isPlayerConfig (local): these values are returned by getConfigList (fields official, player).
- Highlight functions: if inVehID is nil, the vehicle targeted by core_vehicle_configTarget (or player 0) is used. 'highlight' = eye clicked in the UI (partsHighlighted), 'select' = temporary hover of a part.

**Dependencies (loaded first):** `core_locales`, `core_vehicle_configTarget`, `core_vehicle_thumbnail`, `core_vehicle_partFocusCamera`, `gameplay_achievement`

## Functions

| Function | Description | Line |
|---|---|---|
| `core_vehicle_partmgmt.buildConfigFromString(vehicleDir, configData, onlyReturnChosenConfig)` | Builds a vehicle's config table from config data: config table, serialized string starting with '{', or .pc file path. Without a valid config, falls back to default_pc from the model's info file. Format 2 files are merged into the result, otherwise the content becomes `parts`. Called by core_vehicle_manager on spawn. | 245 |
| `core_vehicle_partmgmt.changeHighlightedPartsVisiblity(deltaAlpha, inVehID)` | Changes the transparency of the highlighted parts by a delta (result clamped 0..1). | 1591 |
| `core_vehicle_partmgmt.clearVehicleHighlights(inVehID)` | Immediately removes the X-ray state (restores the alpha) for the given vehicle or all. | 1369 |
| `core_vehicle_partmgmt.compileVehicleCollection(collectionTree)` | Turns a tree of coupled vehicles (core_vehicles.generateAttachedVehiclesTree) into a list of vehicle configs: computes the relative offsets ('default': x,y,z,rx,ry,rz; 'coupledNodes': rotations only), numbers the parents and saves each vehicle's config (or a linkedPCFile if it comes from a .pc). | 419 |
| `core_vehicle_partmgmt.getConfig()` | Current config of the targeted vehicle. | 981 |
| `core_vehicle_partmgmt.getConfigList()` | Lists the .pc files of the targeted vehicle's model folder. | 1074 |
| `core_vehicle_partmgmt.getConfigOfVehicle(vehicleId)` | Current config of a vehicle (vehicleData.config). | 974 |
| `core_vehicle_partmgmt.getConfigVehicleId(explicitVehicleId)` | Resolves the id of the vehicle to configure (alias of core_vehicle_configTarget.resolveVehicleId). | 25 |
| `core_vehicle_partmgmt.getCurrentLicensePlate()` | License plate text of the targeted vehicle. | 1145 |
| `core_vehicle_partmgmt.getCurrentLocalConfigName()` | Base name (without folder or .pc) of the config loaded in the targeted vehicle. | 1048 |
| `core_vehicle_partmgmt.getSaveAvailability()` | Indicates whether saving is possible (not on foot, vehicle present). | 605 |
| `core_vehicle_partmgmt.getSaveMetadataFields(targetConfigName)` | Editable metadata fields for saving (from saveConfigUtils) for the targeted vehicle's model. | 1061 |
| `core_vehicle_partmgmt.getTranslation(name, prefix)` | Translates a UI name: text with a default translation prefix, or a table {txt, ctx} translated with context. Any other table gives nil. | 151 |
| `core_vehicle_partmgmt.hasAvailablePart(partName)` | Indicates whether a part exists in the targeted vehicle's jbeam context. | 846 |
| `core_vehicle_partmgmt.highlightParts(parts, inVehID)` | Sets the highlighted parts (click on the UI eye) and applies the corresponding transparency. | 1613 |
| `core_vehicle_partmgmt.loadLocal(filename, respawn)` | Replaces the targeted vehicle with the given config (core_vehicles.replaceVehicle with {config = filename}). | 991 |
| `core_vehicle_partmgmt.onDeserialized(data)` | Hook: restores the data from onSerialize. *(internal)* *(hook)* | 1902 |
| `core_vehicle_partmgmt.onExtensionUnloaded()` | Hook: the extension is unloaded; restores the meshes' alpha. *(internal)* *(hook)* | 1856 |
| `core_vehicle_partmgmt.onFilesChanged(files)` | Hook: files changed; empties the saveConfigUtils cache and invalidates the partpacks cache if a .partpacks.json changed. *(internal)* *(hook)* | 1881 |
| `core_vehicle_partmgmt.onLanguageChanged()` | Hook: the language changes; empties the translation caches. *(internal)* *(hook)* | 1860 |
| `core_vehicle_partmgmt.onReloadLocales()` | Hook: translations are reloaded; empties the caches. *(internal)* *(hook)* | 1865 |
| `core_vehicle_partmgmt.onSerialize()` | Hook: saves the highlight data before a Lua reload. *(internal)* *(hook)* | 1894 |
| `core_vehicle_partmgmt.onUpdate(dt)` | Per-frame hook: applies the parts selector debounce and animates the X-ray fade. *(internal)* *(hook)* | 1870 |
| `core_vehicle_partmgmt.onVehicleConfigTargetChanged(current)` | Hook (core_vehicle_configTarget): the configuration target changes; clears the X-ray and sends the new vehicle's data to the UI. *(internal)* *(hook)* | 1849 |
| `core_vehicle_partmgmt.onVehicleDestroyed(vehID)` | Hook: a vehicle is destroyed; frees its highlight data. *(internal)* *(hook)* | 1841 |
| `core_vehicle_partmgmt.onVehicleSpawned(vehID)` | Hook: a vehicle spawns; resets the relevant X-ray state and the part info cache. *(internal)* *(hook)* | 1826 |
| `core_vehicle_partmgmt.onVehicleSwitched(oldID, newID, player)` | Hook: the target player changes vehicle; clears the X-ray state. *(internal)* *(hook)* | 1834 |
| `core_vehicle_partmgmt.openConfigFolderInExplorer()` | Opens the model's configs folder in the file explorer (creates it if it does not exist). | 1312 |
| `core_vehicle_partmgmt.partsSelectorChanged(state)` | Called by the UI when the parts selector's selection changes; delays the application by 0.1 s (debounce) via highlightParts. | 1734 |
| `core_vehicle_partmgmt.partsTreeToPartsMap(partsTree)` | Flattens a resolved parts tree into a slotId -> chosen part name dictionary (`parts` format of .pc files). Slots with the same id at different paths are recorded under their full path. | 322 |
| `core_vehicle_partmgmt.regenerateCurrentLicensePlate()` | Generates and applies a new random license plate text. | 1164 |
| `core_vehicle_partmgmt.releasePartFocusCamera()` | Gives the camera back to the player (core_vehicle_partFocusCamera.clear). | 1517 |
| `core_vehicle_partmgmt.removeLocal(filename)` | Deletes <folder>/<filename>.pc and its .jpg thumbnail then notifies the UI (VehicleconfigRemoved). | 1000 |
| `core_vehicle_partmgmt.reset()` | Resends the data to the UI (sendDataToUI). | 901 |
| `core_vehicle_partmgmt.resetAllToLoadedConfig()` | Reloads the original config (partConfigFilename) of the targeted vehicle. | 1776 |
| `core_vehicle_partmgmt.resetConfig()` | Clears parts and vars of the targeted vehicle's config and recreates the vehicle. | 1772 |
| `core_vehicle_partmgmt.resetPartsToLoadedConfig()` | Parts Reset button: re-reads the parts of the original .pc and calls setPartsConfig (obsolete, see notes). | 1786 |
| `core_vehicle_partmgmt.resetVarsToLoadedConfig()` | Resets the tuning variables to those of the original .pc (empty if none) and recreates the vehicle. | 1806 |
| `core_vehicle_partmgmt.resetVehicleHighlights(onlyIfVehChanged, inVehID)` | Clears the highlights (parts, transparency, camera) by fading back to the opaque vehicle. | 1741 |
| `core_vehicle_partmgmt.save(filename, saveSettings, saveMetadata)` | Saves the targeted vehicle's config under a full path (alias of savePartConfigFile -> format 2). | 713 |
| `core_vehicle_partmgmt.saveExistingLocalConfig(fileName, configurationName, saveSettings, saveMetadata)` | Overwrites an existing player config (not an official config). | 1277 |
| `core_vehicle_partmgmt.saveLocal(fn, saveSettings, saveMetadata)` | Saves the config under <model folder>/<fn>. | 726 |
| `core_vehicle_partmgmt.saveLocalScreenshot(fn)` | Step 1 of a thumbnail capture: switches to free camera, FOV 35, triggers saveLocalScreenshot_stage1 on the UI side. | 746 |
| `core_vehicle_partmgmt.saveLocalScreenshot_stage2(fn)` | Step 2: takes the jpg capture in the model folder then triggers saveLocalScreenshot_stage3. | 756 |
| `core_vehicle_partmgmt.saveNewLocalConfig(configurationName, saveSettings, saveMetadata)` | Saves the config under a new file name derived from configurationName (lowercase, numeric suffix if already taken), generates the thumbnail and unlocks the VEHICLE_CONFIG_SAVED achievement. | 1268 |
| `core_vehicle_partmgmt.savePartConfigFileStage2(partsCondition, filename, saveSettings, saveMetadata)` | Saves the targeted vehicle's config in format 2 to `filename` (+ info_<name>.json file + paints according to saveSettings), notifies the UI and empties the selector caches. See the notes on the alias. | 631 |
| `core_vehicle_partmgmt.saveVehicleCollection(collectionTree, filename)` | Writes a vehicle collection in format 4 to a JSON file and notifies the UI (VehicleconfigSaved, message). | 503 |
| `core_vehicle_partmgmt.savedefault()` | Saves the targeted vehicle's config as the default vehicle (settings/default.pc) and displays a message. | 767 |
| `core_vehicle_partmgmt.selectParts(parts, inVehID, cameraParts, cameraOptions)` | Temporary selection (hover of a part in the UI): sets these parts to full visibility and reframes the part camera. | 1645 |
| `core_vehicle_partmgmt.sendDataToUI(explicitVehicleId)` | Sends to the UI (raw guihook VehicleConfigChange) all the configurator data: id, model, chosen parts tree, translated tuning variables, .pc default values, partpacks catalog, highlighted parts, enriched part info. | 792 |
| `core_vehicle_partmgmt.sendPartsSelectorStateToUI()` | Sends to the UI (guihook PartsSelectorUpdate) the sorted list of parts and the highlighted indexes. | 1711 |
| `core_vehicle_partmgmt.setConfig(inData, respawn, explicitVehicleId)` | Like setConfigOfVehicle for the targeted vehicle (or explicitVehicleId). | 945 |
| `core_vehicle_partmgmt.setConfigOfVehicle(veh, inData, respawn)` | Merges `inData` into the given vehicle's config (see notes on respawn). | 905 |
| `core_vehicle_partmgmt.setConfigPaints(data, respawn, explicitVehicleId)` | Merges a list of paints into the config ({paints = data}). | 957 |
| `core_vehicle_partmgmt.setConfigVars(data, respawn)` | Merges tuning variables ({vars = data}) into the targeted vehicle's config. | 961 |
| `core_vehicle_partmgmt.setCurrentConfigurationName(configurationName)` | Sets the display name (Configuration) in the targeted vehicle's config (without saving). | 735 |
| `core_vehicle_partmgmt.setCurrentLicensePlate(text)` | Applies a license plate text to the targeted vehicle (core_vehicles.setPlateText). | 1157 |
| `core_vehicle_partmgmt.setHighlightedPartsVisiblity(alpha, inVehID)` | Sets the transparency of the highlighted parts. | 1580 |
| `core_vehicle_partmgmt.setNewParts(inVehID, silent)` | Updates the highlight data after a parts change: existing parts keep their state, new ones take that of their parent. | 1656 |
| `core_vehicle_partmgmt.setPartsConfig(data, respawn)` | Obsolete: logs an error asking to use setPartsTreeConfig. Applies nothing. | 965 |
| `core_vehicle_partmgmt.setPartsTreeConfig(dataTree, respawn, part)` | Applies a new parts tree to the targeted vehicle (merge of {partsTree = dataTree}) and emits the onPartsTreeConfigChanged(dataTree, respawn, part) hook beforehand. | 969 |
| `core_vehicle_partmgmt.setSkin(skin)` | Applies a skin: chooses the part '<model>_skin_<skin>' in the 'paint_design' slot then replaces the vehicle. An empty skin removes the skin. | 859 |
| `core_vehicle_partmgmt.showHighlightedParts(inVehID, cameraParts, cameraOptions)` | Goes back to displaying the highlighted parts (after a hover). | 1603 |
| `core_vehicle_partmgmt.translateTuningData(tuningData)` | Copies the tuning variables while translating title, description, category and subCategory. | 167 |
| `core_vehicle_partmgmt.validatePaints()` | Compares the targeted vehicle's current paints with those of the model/library (core_vehiclePaints.validatePcPaints) and adds the default save settings. | 1128 |

### Parameter details

#### `core_vehicle_partmgmt.buildConfigFromString(vehicleDir, configData, onlyReturnChosenConfig)`

Builds a vehicle's config table from config data: config table, serialized string starting with '{', or .pc file path. Without a valid config, falls back to default_pc from the model's info file. Format 2 files are merged into the result, otherwise the content becomes `parts`. Called by core_vehicle_manager on spawn.

- `vehicleDir` (*string*) : model folder (e.g. 'vehicles/pickup/')
- `configData` (*table|string|nil*) : config, serialized string or .pc path
- `onlyReturnChosenConfig` (*boolean|nil*) : if true, returns (nil, false) instead of falling back to the default config
- **returns**: table|nil config {partConfigFilename, parts|..., vars, paints...}
- **returns**: boolean true if the requested config was actually used (not the default fallback)

#### `core_vehicle_partmgmt.changeHighlightedPartsVisiblity(deltaAlpha, inVehID)`

Changes the transparency of the highlighted parts by a delta (result clamped 0..1).

- `deltaAlpha` (*number*) : change
- `inVehID` (*integer|nil*) : vehicle

#### `core_vehicle_partmgmt.clearVehicleHighlights(inVehID)`

Immediately removes the X-ray state (restores the alpha) for the given vehicle or all.

- `inVehID` (*integer|nil*) : vehicle; nil = all

#### `core_vehicle_partmgmt.compileVehicleCollection(collectionTree)`

Turns a tree of coupled vehicles (core_vehicles.generateAttachedVehiclesTree) into a list of vehicle configs: computes the relative offsets ('default': x,y,z,rx,ry,rz; 'coupledNodes': rotations only), numbers the parents and saves each vehicle's config (or a linkedPCFile if it comes from a .pc).

- `collectionTree` (*table*) : vehicle tree {vehId, offsetData, children}
- **returns**: table[] list of vehicle configs (format 4)

#### `core_vehicle_partmgmt.getConfig()`

Current config of the targeted vehicle.

- **returns**: table|nil config; nil without a vehicle

#### `core_vehicle_partmgmt.getConfigList()`

Lists the .pc files of the targeted vehicle's model folder.

- **returns**: table[]|nil entries {fileName, name, displayName?, official, player, thumbnailPath?}; nil without a vehicle

#### `core_vehicle_partmgmt.getConfigOfVehicle(vehicleId)`

Current config of a vehicle (vehicleData.config).

- `vehicleId` (*integer*) : vehicle id
- **returns**: table|nil config (not a copy); nil if unknown

#### `core_vehicle_partmgmt.getConfigVehicleId(explicitVehicleId)`

Resolves the id of the vehicle to configure (alias of core_vehicle_configTarget.resolveVehicleId).

- `explicitVehicleId` (*integer|nil*) : requested id; nil = configuration target, otherwise player 0
- **returns**: integer|nil valid id, nil otherwise

#### `core_vehicle_partmgmt.getCurrentLicensePlate()`

License plate text of the targeted vehicle.

- **returns**: string text or ''

#### `core_vehicle_partmgmt.getCurrentLocalConfigName()`

Base name (without folder or .pc) of the config loaded in the targeted vehicle.

- **returns**: string|nil base name

#### `core_vehicle_partmgmt.getSaveAvailability()`

Indicates whether saving is possible (not on foot, vehicle present).

- **returns**: table {canSave = boolean, reason = 'walking'|'noVehicle'|nil}

#### `core_vehicle_partmgmt.getSaveMetadataFields(targetConfigName)`

Editable metadata fields for saving (from saveConfigUtils) for the targeted vehicle's model.

- `targetConfigName` (*string|nil*) : target config (basename)
- **returns**: table fields; {} if no vehicle

#### `core_vehicle_partmgmt.getTranslation(name, prefix)`

Translates a UI name: text with a default translation prefix, or a table {txt, ctx} translated with context. Any other table gives nil.

- `name` (*string|table*) : translation key or {txt, ctx}
- `prefix` (*string|nil*) : fallback prefix, default 'ui.vehicleconfig.title.'
- **returns**: string|nil translated text

#### `core_vehicle_partmgmt.hasAvailablePart(partName)`

Indicates whether a part exists in the targeted vehicle's jbeam context.

- `partName` (*string*) : part name
- **returns**: boolean|nil nil if partName is empty

#### `core_vehicle_partmgmt.highlightParts(parts, inVehID)`

Sets the highlighted parts (click on the UI eye) and applies the corresponding transparency.

- `parts` (*table<string, boolean>*) : [part path] = true for the visible parts
- `inVehID` (*integer|nil*) : vehicle; nil = player

#### `core_vehicle_partmgmt.loadLocal(filename, respawn)`

Replaces the targeted vehicle with the given config (core_vehicles.replaceVehicle with {config = filename}).

- `filename` (*string*) : .pc config path or name
- `respawn` (*boolean|nil*) : not used in the code

#### `core_vehicle_partmgmt.onDeserialized(data)`

Hook: restores the data from onSerialize.

- `data` (*table*) : data

#### `core_vehicle_partmgmt.onFilesChanged(files)`

Hook: files changed; empties the saveConfigUtils cache and invalidates the partpacks cache if a .partpacks.json changed.

- `files` (*table[]*) : list {filename, ...}

#### `core_vehicle_partmgmt.onSerialize()`

Hook: saves the highlight data before a Lua reload.

- **returns**: table {vehsPartsData, vehsRichPartInfo}

#### `core_vehicle_partmgmt.onUpdate(dt)`

Per-frame hook: applies the parts selector debounce and animates the X-ray fade.

- `dt` (*number*) : elapsed time (s)

#### `core_vehicle_partmgmt.onVehicleConfigTargetChanged(current)`

Hook (core_vehicle_configTarget): the configuration target changes; clears the X-ray and sends the new vehicle's data to the UI.

- `current` (*table|nil*) : new target {vehId, playerId, returnRoute}

#### `core_vehicle_partmgmt.onVehicleDestroyed(vehID)`

Hook: a vehicle is destroyed; frees its highlight data.

- `vehID` (*integer*) : vehicle

#### `core_vehicle_partmgmt.onVehicleSpawned(vehID)`

Hook: a vehicle spawns; resets the relevant X-ray state and the part info cache.

- `vehID` (*integer*) : vehicle

#### `core_vehicle_partmgmt.onVehicleSwitched(oldID, newID, player)`

Hook: the target player changes vehicle; clears the X-ray state.

- `oldID` (*integer*) : old vehicle
- `newID` (*integer*) : new vehicle
- `player` (*integer*) : player

#### `core_vehicle_partmgmt.partsSelectorChanged(state)`

Called by the UI when the parts selector's selection changes; delays the application by 0.1 s (debounce) via highlightParts.

- `state` (*table*) : {vehID, partsSorted, partsHighlightedIdxs}

#### `core_vehicle_partmgmt.partsTreeToPartsMap(partsTree)`

Flattens a resolved parts tree into a slotId -> chosen part name dictionary (`parts` format of .pc files). Slots with the same id at different paths are recorded under their full path.

- `partsTree` (*table*) : config.partsTree
- **returns**: table<string, string> [slotId or path] = chosenPartName

#### `core_vehicle_partmgmt.regenerateCurrentLicensePlate()`

Generates and applies a new random license plate text.

- **returns**: string generated text

#### `core_vehicle_partmgmt.removeLocal(filename)`

Deletes <folder>/<filename>.pc and its .jpg thumbnail then notifies the UI (VehicleconfigRemoved).

- `filename` (*string*) : config name without extension

#### `core_vehicle_partmgmt.resetVehicleHighlights(onlyIfVehChanged, inVehID)`

Clears the highlights (parts, transparency, camera) by fading back to the opaque vehicle.

- `onlyIfVehChanged` (*boolean|nil*) : true: only clears if the vehicle's model changed
- `inVehID` (*integer|nil*) : vehicle

#### `core_vehicle_partmgmt.save(filename, saveSettings, saveMetadata)`

Saves the targeted vehicle's config under a full path (alias of savePartConfigFile -> format 2).

- `filename` (*string*) : .pc path
- `saveSettings` (*table|boolean|nil*) : see notes
- `saveMetadata` (*table|nil*) : metadata for the info file
- **returns**: boolean true if saved

#### `core_vehicle_partmgmt.saveExistingLocalConfig(fileName, configurationName, saveSettings, saveMetadata)`

Overwrites an existing player config (not an official config).

- `fileName` (*string*) : file name (with or without .pc)
- `configurationName` (*string|nil*) : display name; empty = existing name
- `saveSettings` (*table|boolean|nil*) : see notes
- `saveMetadata` (*table|nil*) : metadata
- **returns**: table {success, reason?, ...} (possible reasons: configNotFound, notPlayerConfig, ...)

#### `core_vehicle_partmgmt.saveLocal(fn, saveSettings, saveMetadata)`

Saves the config under <model folder>/<fn>.

- `fn` (*string*) : relative file name, with the .pc extension
- `saveSettings` (*table|boolean|nil*) : see notes
- `saveMetadata` (*table|nil*) : metadata
- **returns**: boolean true if saved; false without a vehicle

#### `core_vehicle_partmgmt.saveLocalScreenshot(fn)`

Step 1 of a thumbnail capture: switches to free camera, FOV 35, triggers saveLocalScreenshot_stage1 on the UI side.

- `fn` (*string*) : file name (not used at this step)

#### `core_vehicle_partmgmt.saveLocalScreenshot_stage2(fn)`

Step 2: takes the jpg capture in the model folder then triggers saveLocalScreenshot_stage3.

- `fn` (*string*) : capture file name
- **returns**: boolean|nil false without a vehicle

#### `core_vehicle_partmgmt.saveNewLocalConfig(configurationName, saveSettings, saveMetadata)`

Saves the config under a new file name derived from configurationName (lowercase, numeric suffix if already taken), generates the thumbnail and unlocks the VEHICLE_CONFIG_SAVED achievement.

- `configurationName` (*string*) : display name of the configuration
- `saveSettings` (*table|boolean|nil*) : see notes
- `saveMetadata` (*table|nil*) : metadata
- **returns**: table {success, reason?, fileName?, displayName?, configSaved?, thumbnailCopied?}

#### `core_vehicle_partmgmt.savePartConfigFileStage2(partsCondition, filename, saveSettings, saveMetadata)`

Saves the targeted vehicle's config in format 2 to `filename` (+ info_<name>.json file + paints according to saveSettings), notifies the UI and empties the selector caches. See the notes on the alias.

- `partsCondition` (*any*) : parts conditions (nil in current calls)
- `filename` (*string*) : .pc path (e.g. 'vehicles/pickup/my_config.pc')
- `saveSettings` (*table|boolean|nil*) : see notes
- `saveMetadata` (*table|nil*) : metadata to write in the info file
- **returns**: boolean true if the .pc was written

#### `core_vehicle_partmgmt.saveVehicleCollection(collectionTree, filename)`

Writes a vehicle collection in format 4 to a JSON file and notifies the UI (VehicleconfigSaved, message).

- `collectionTree` (*table*) : vehicle tree
- `filename` (*string*) : output .pc file

#### `core_vehicle_partmgmt.selectParts(parts, inVehID, cameraParts, cameraOptions)`

Temporary selection (hover of a part in the UI): sets these parts to full visibility and reframes the part camera.

- `parts` (*table<string, boolean>*) : hovered parts
- `inVehID` (*integer|nil*) : vehicle
- `cameraParts` (*table|nil*) : parts to frame; default = parts
- `cameraOptions` (*table|nil*) : partFocusCamera.focusOnParts options (e.g. immediate)

#### `core_vehicle_partmgmt.sendDataToUI(explicitVehicleId)`

Sends to the UI (raw guihook VehicleConfigChange) all the configurator data: id, model, chosen parts tree, translated tuning variables, .pc default values, partpacks catalog, highlighted parts, enriched part info.

- `explicitVehicleId` (*integer|nil*) : vehicle; nil = target

#### `core_vehicle_partmgmt.setConfig(inData, respawn, explicitVehicleId)`

Like setConfigOfVehicle for the targeted vehicle (or explicitVehicleId).

- `inData` (*table*) : data to merge
- `respawn` (*boolean|nil*) : see setConfigOfVehicle
- `explicitVehicleId` (*integer|nil*) : vehicle; nil = target

#### `core_vehicle_partmgmt.setConfigOfVehicle(veh, inData, respawn)`

Merges `inData` into the given vehicle's config (see notes on respawn).

- `veh` (*userdata*) : vehicle object
- `inData` (*table*) : e.g. {paints = ...}, {vars = ...}, {partsTree = ...}, {parts = ...}
- `respawn` (*boolean|nil*) : true (default): recreates the vehicle; false: live paint update

#### `core_vehicle_partmgmt.setConfigPaints(data, respawn, explicitVehicleId)`

Merges a list of paints into the config ({paints = data}).

- `data` (*table[]*) : paints (1..3)
- `respawn` (*boolean|nil*) : true = recreate the vehicle
- `explicitVehicleId` (*integer|nil*) : vehicle; nil = target

#### `core_vehicle_partmgmt.setConfigVars(data, respawn)`

Merges tuning variables ({vars = data}) into the targeted vehicle's config.

- `data` (*table<string, number>*) : [variable name] = value
- `respawn` (*boolean|nil*) : true = recreate the vehicle

#### `core_vehicle_partmgmt.setCurrentConfigurationName(configurationName)`

Sets the display name (Configuration) in the targeted vehicle's config (without saving).

- `configurationName` (*string*) : name
- **returns**: boolean false without a vehicle

#### `core_vehicle_partmgmt.setCurrentLicensePlate(text)`

Applies a license plate text to the targeted vehicle (core_vehicles.setPlateText).

- `text` (*string*) : license plate text
- **returns**: boolean false without a vehicle

#### `core_vehicle_partmgmt.setHighlightedPartsVisiblity(alpha, inVehID)`

Sets the transparency of the highlighted parts.

- `alpha` (*number*) : 0 (invisible) to 1 (opaque)
- `inVehID` (*integer|nil*) : vehicle

#### `core_vehicle_partmgmt.setNewParts(inVehID, silent)`

Updates the highlight data after a parts change: existing parts keep their state, new ones take that of their parent.

- `inVehID` (*integer|nil*) : vehicle
- `silent` (*boolean|nil*) : true: do not notify the UI

#### `core_vehicle_partmgmt.setPartsConfig(data, respawn)`

Obsolete: logs an error asking to use setPartsTreeConfig. Applies nothing.

- `data` (*table*) : ignored
- `respawn` (*boolean|nil*) : ignored

#### `core_vehicle_partmgmt.setPartsTreeConfig(dataTree, respawn, part)`

Applies a new parts tree to the targeted vehicle (merge of {partsTree = dataTree}) and emits the onPartsTreeConfigChanged(dataTree, respawn, part) hook beforehand.

- `dataTree` (*table*) : parts tree (chosenPartName, children...)
- `respawn` (*boolean|nil*) : true = recreate the vehicle
- `part` (*any*) : part that caused the change (passed to the hook only)

#### `core_vehicle_partmgmt.setSkin(skin)`

Applies a skin: chooses the part '<model>_skin_<skin>' in the 'paint_design' slot then replaces the vehicle. An empty skin removes the skin.

- `skin` (*string|nil*) : skin name

#### `core_vehicle_partmgmt.showHighlightedParts(inVehID, cameraParts, cameraOptions)`

Goes back to displaying the highlighted parts (after a hover).

- `inVehID` (*integer|nil*) : vehicle
- `cameraParts` (*table|nil*) : parts the camera keeps framed
- `cameraOptions` (*table|nil*) : camera options

#### `core_vehicle_partmgmt.translateTuningData(tuningData)`

Copies the tuning variables while translating title, description, category and subCategory.

- `tuningData` (*table|nil*) : vdata.variables
- **returns**: table translated copy

#### `core_vehicle_partmgmt.validatePaints()`

Compares the targeted vehicle's current paints with those of the model/library (core_vehiclePaints.validatePcPaints) and adds the default save settings.

- **returns**: table result of validatePcPaints + defaults; {} without a vehicle

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | core_locales, core_vehicle_configTarget, core_vehicle_thumbnail, core_vehicle_partFocusCamera, gameplay_achievement. |
| `xrayFadeRate` | number | Mesh fade speed for the X-ray highlight, in alpha per second (5 by default). Editable from the console: core_vehicle_partmgmt.xrayFadeRate = 5. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onPartsTreeConfigChanged`

**UI events (guihooks.trigger):** `Message`, `PartsSelectorUpdate`, `VehicleconfigRemoved`, `VehicleconfigSaved`, `saveLocalScreenshot_stage1`, `saveLocalScreenshot_stage3`

## Calls into the engine (C++)

- `FS:` `directoryCreate`, `fileExists`, `findFiles`, `removeFile`
- `be:` `getObjectCount`, `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/vehicle/partmgmt.lua`.*
