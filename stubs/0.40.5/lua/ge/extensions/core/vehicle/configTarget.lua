---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/vehicle/configTarget.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_vehicle_configTarget`: remembers which vehicle (and which player) is the target of the vehicle configuration menu, so that partmgmt, colors, mirror, thumbnail, etc. do not always act on player 0's vehicle. Also serves as a resolver: resolveVehicleId takes an explicit id, otherwise the target, otherwise player 0's vehicle. Emits onVehicleConfigTargetChanged on every change.
--- Access: extension `core_vehicle_configTarget`: `extensions.load("core_vehicle_configTarget")`, then the global `core_vehicle_configTarget`
---@class core_vehicle_configTarget
core_vehicle_configTarget = {}

--- Sets the target vehicle. Refuses an invalid id or a nonexistent vehicle. Emits onVehicleConfigTargetChanged(current, previous, 'begin').
---Source: lua/ge/extensions/core/vehicle/configTarget.lua:25
---@param vehId integer vehicle id (>= 0)
---@param context table|nil {playerId?, returnRoute?}
---@return boolean  true if the target was set
function core_vehicle_configTarget.begin(vehId, context) end

--- Clears the target and emits onVehicleConfigTargetChanged.
---Source: lua/ge/extensions/core/vehicle/configTarget.lua:42
---@param reason string|nil reason passed to the hook, default 'clear'
---@return boolean  false if there was no target
function core_vehicle_configTarget.clear(reason) end

--- Copy of the current target.
---Source: lua/ge/extensions/core/vehicle/configTarget.lua:55
---@return table|nil  {vehId, playerId, returnRoute} or nil
function core_vehicle_configTarget.get() end

--- UI route to return to after configuration.
---Source: lua/ge/extensions/core/vehicle/configTarget.lua:67
---@return string  'pause' or 'pause.vehicle' (default)
function core_vehicle_configTarget.getReturnRoute() end

--- Index of the configuring player.
---Source: lua/ge/extensions/core/vehicle/configTarget.lua:63
---@return integer|nil  playerId or nil
function core_vehicle_configTarget.getTargetPlayerId() end

--- Id of the target vehicle.
---Source: lua/ge/extensions/core/vehicle/configTarget.lua:59
---@return integer|nil  vehId or nil
function core_vehicle_configTarget.getTargetVehicleId() end

--- Indicates whether a target is set.
---Source: lua/ge/extensions/core/vehicle/configTarget.lua:51
---@return boolean  true if active
function core_vehicle_configTarget.isActive() end

--- Hook: end of the level; clears the target ('missionEnded').
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/configTarget.lua:118
function core_vehicle_configTarget.onClientEndMission() end

--- Hook: restores the target if its vehicle still exists.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/configTarget.lua:132
---@param data table data from onSerialize
function core_vehicle_configTarget.onDeserialized(data) end

--- Hook: extension unloaded; clears the target ('extensionUnloaded').
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/configTarget.lua:122
function core_vehicle_configTarget.onExtensionUnloaded() end

--- Hook: saves the target before a Lua reload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/configTarget.lua:126
---@return table  {target}
function core_vehicle_configTarget.onSerialize() end

--- Per-frame hook: clears the target if the destroyed vehicle still does not exist.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/configTarget.lua:109
function core_vehicle_configTarget.onUpdate() end

--- Hook: if the target vehicle is destroyed, notes that the target must be cleared on the next frame.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/configTarget.lua:97
---@param vehId integer vehicle
function core_vehicle_configTarget.onVehicleDestroyed(vehId) end

--- Hook: cancels the planned clearing if the same id is recreated (vehicle replacement).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicle/configTarget.lua:103
---@param vehId integer vehicle
function core_vehicle_configTarget.onVehicleSpawned(vehId) end

--- Like resolveVehicleId but returns the vehicle object.
---Source: lua/ge/extensions/core/vehicle/configTarget.lua:86
---@param explicitVehicleId integer|nil imposed id
---@return userdata|nil  vehicle object
function core_vehicle_configTarget.resolveVehicle(explicitVehicleId) end

--- Like resolveVehicleId but returns the data from core_vehicle_manager.getVehicleData.
---Source: lua/ge/extensions/core/vehicle/configTarget.lua:91
---@param explicitVehicleId integer|nil imposed id
---@return table|nil  vehicle data (vdata, config, vehicleDirectory, ioCtx...)
function core_vehicle_configTarget.resolveVehicleData(explicitVehicleId) end

--- Determines the vehicle id to use: the explicit id if given and valid, otherwise the target, otherwise player 0's vehicle. Returns nil if the object does not exist.
---Source: lua/ge/extensions/core/vehicle/configTarget.lua:71
---@param explicitVehicleId integer|nil id imposed by the caller (nil = automatic; an invalid id gives nil, with no fallback)
---@return integer|nil  vehicle id
function core_vehicle_configTarget.resolveVehicleId(explicitVehicleId) end

