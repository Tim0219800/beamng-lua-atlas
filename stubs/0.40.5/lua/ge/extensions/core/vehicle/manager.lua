---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/vehicle/manager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_vehicle_manager`: GE-side vehicle loader. When the engine creates a vehicle object, it calls `_spawnCCallback`: loads the materials from the model folder, builds the config (core_vehicle_partmgmt.buildConfigFromString), runs stage 1 of the jbeam loader (jbeam/loader), finishes the meshes, notifies the UI (VehicleChange), makes the player enter if autoEnterVehicle, then sends the physics data to the vehicle (spawnPhysics). Keeps for each vehicle its "bundle" (vdata = jbeam data, config, ioCtx...) accessible through getVehicleData, and applies paint changes live.
--- Access: extension `core_vehicle_manager`: `extensions.load("core_vehicle_manager")`, then the global `core_vehicle_manager`
---@class core_vehicle_manager
---@field autoSpawnPhysics boolean true by default; if false, physics is not sent to the vehicle after loading (spawnPhysicsForVehicle must be called by hand). Also disabled for a vehicle whose NoPhysics == 'true'.
core_vehicle_manager = {}

--- Called by the C++ engine when a vehicle object is created or reloaded: loads materials, config and jbeam (stage 1), notifies, makes the player enter (autoEnterVehicle / autoEnterVehiclePlayer) and starts the physics. Emits the onSpawnCCallback(objID) hook and calls vehicleSpawned(objID).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/manager.lua:111
---@param objID integer vehicle object id
---@param vehicleDir string model folder (e.g. '/vehicles/pickup/')
---@param configDataIn table|string config received (vehicle partConfig)
---@param reloading boolean true on a reload (not used in the code)
function core_vehicle_manager._spawnCCallback(objID, vehicleDir, configDataIn, reloading) end

--- Indicates whether the vehicle loading debug mode is active.
---Source: lua/ge/extensions/core/vehicle/manager.lua:20
---@return boolean  state
function core_vehicle_manager.getDebug() end

--- Data bundle of player 0's vehicle.
---Source: lua/ge/extensions/core/vehicle/manager.lua:248
---@return table|nil  same structure as getVehicleData
function core_vehicle_manager.getPlayerVehicleData() end

--- Data bundle of a vehicle (jbeam vdata, config, ioCtx...).
---Source: lua/ge/extensions/core/vehicle/manager.lua:252
---@param id integer vehicle id
---@return table|nil  bundle; nil if the vehicle is unknown
function core_vehicle_manager.getVehicleData(id) end

--- Changes the paint of a slot on the vehicle object (color, colorPalette0, colorPalette1 + metallic data) without respawn, then emits onVehicleColorChanged(objID, index, paint). Does nothing if the vehicle has no config.paints.
---Source: lua/ge/extensions/core/vehicle/manager.lua:256
---@param objID integer vehicle id
---@param _vehicleObj userdata|nil vehicle object (looked up if nil)
---@param index integer slot 1, 2 or 3
---@param paint table paint {baseColor, metallic, roughness, clearcoat, clearcoatRoughness}
function core_vehicle_manager.liveUpdateVehicleColors(objID, _vehicleObj, index, paint) end

--- Hook: end of the level; invalidates the loaded materials cache.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/manager.lua:52
function core_vehicle_manager.onClientEndMission() end

--- Hook: restores the bundles encoded by onSerialize.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/manager.lua:296
---@param data table data from onSerialize
function core_vehicle_manager.onDeserialized(data) end

--- Hook: a vehicle object is removed. Forgets its bundle unless it is a reload (isReloading true).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/manager.lua:242
---@param id integer vehicle
---@param isReloading boolean true if reloading
function core_vehicle_manager.onDespawnObject(id, isReloading) end

--- Editor hook: displays an obsolescence message recommending -debugVehicleLoading.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/manager.lua:333
function core_vehicle_manager.onEditorGui() end

--- Editor hook: registers the obsolete "Vehicle Manager" window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/manager.lua:369
function core_vehicle_manager.onEditorInitialized() end

--- Hook: a file changed. Notifies jbeam/io for .jbeam files and invalidates the materials cache of a vehicle folder if a .materials.json changes there.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/manager.lua:63
---@param filename string path
---@param type string type of change
function core_vehicle_manager.onFileChanged(filename, type) end

--- Hook: files modified; notifies jbeam/loader.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/manager.lua:57
---@param files table list of modified files
function core_vehicle_manager.onFilesChanged(files) end

--- Hook: encodes (lpack) the bundles before a Lua reload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/manager.lua:304
---@return table  {vehicles, autoSpawnPhysics}
function core_vehicle_manager.onSerialize() end

--- Per-frame hook: empties the placement cache of spawn.lua.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/manager.lua:375
function core_vehicle_manager.onUpdate() end

--- Hook: the player changes vehicle. Updates activePlayer of the bundles and releases the clutch (input.event('clutch', 0, 0)) of the old vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/manager.lua:229
---@param oldID integer old vehicle
---@param newID integer new vehicle
---@param player integer player
function core_vehicle_manager.onVehicleSwitched(oldID, newID, player) end

--- Prepares a table of additional data that will be added to the config of the next loaded vehicle (config.additionalVehicleData, removed afterwards). Called by core_vehicles on spawn/replacement.
---Source: lua/ge/extensions/core/vehicle/manager.lua:76
---@param data table|nil data; nil cancels
---@param vehId integer|nil if given, only this vehicle will receive the data
function core_vehicle_manager.queueAdditionalVehicleData(data, vehId) end

--- Reloads all vehicles (be:reloadAllVehicles).
---Source: lua/ge/extensions/core/vehicle/manager.lua:326
function core_vehicle_manager.reloadAllVehicles() end

--- Reloads a player's vehicle: notifies core_vehicles.reloadVehicle then be:reloadVehicle(playerId).
---Source: lua/ge/extensions/core/vehicle/manager.lua:319
---@param playerId integer player index
function core_vehicle_manager.reloadVehicle(playerId) end

--- Enables/disables loading debug (passed in additionalVehicleData.debugEnabled) and notifies the UI (guihook debugSpawnChanged).
---Source: lua/ge/extensions/core/vehicle/manager.lua:24
---@param enabled boolean desired state
function core_vehicle_manager.setDebug(enabled) end

--- Applies up to 3 named paints (from model.paints) to a vehicle, live.
---Source: lua/ge/extensions/core/vehicle/manager.lua:279
---@param id integer|nil vehicle; nil = player 0
---@param paintNames string[] {name1, name2, name3}
---@param optional any if non-nil, was meant to cancel the action when the vehicle's 3 colors are identical (ineffective, see notes)
function core_vehicle_manager.setVehicleColorsNames(id, paintNames, optional) end

--- Alias of setVehicleColorsNames.
---Source: lua/ge/extensions/core/vehicle/manager.lua:279
---@param id integer|nil vehicle; nil = player 0
---@param paintNames string[] paint names
---@param optional any see setVehicleColorsNames
function core_vehicle_manager.setVehiclePaintsNames(id, paintNames, optional) end

--- Sends the vehicle (vehicleObj:spawnPhysics) its encoded physics data (vdata + config); sends an empty packet if the bundle is absent.
---Source: lua/ge/extensions/core/vehicle/manager.lua:81
---@param objID integer|nil vehicle; nil = player 0
---@param vehicleObj userdata|nil vehicle object (looked up if nil)
---@param vehicleBundle table|nil bundle to send (default: the stored one)
function core_vehicle_manager.spawnPhysicsForVehicle(objID, vehicleObj, vehicleBundle) end

--- Toggles the debug mode.
---Source: lua/ge/extensions/core/vehicle/manager.lua:29
function core_vehicle_manager.toggleDebug() end

--- Shows/hides the vehicle in-place editing window (core_vehicle_inplaceEdit).
---Source: lua/ge/extensions/core/vehicle/manager.lua:315
function core_vehicle_manager.toggleModifyKey() end

