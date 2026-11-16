---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/fuelUtils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tools to save and restore a rally vehicle's fuel (for example after a reset or a repair). createFuelSnapshot analyzes the energyStorage data: with a single valid gasoline/diesel tank, it stores the current level ('remembered' mode); otherwise it plans a full tank ('full' mode) with the reason for the fallback. applyFuelSnapshot reapplies the snapshot via core_vehicleBridge.
--- Access: extension `gameplay_rally_fuelUtils`: `extensions.load("gameplay_rally_fuelUtils")`, then the global `gameplay_rally_fuelUtils`
---@class gameplay_rally_fuelUtils
gameplay_rally_fuelUtils = {}

--- Applies the snapshot: in 'remembered' mode puts currentEnergy back in each tank; otherwise fills each tank to maxEnergy (with a warning in the log if a reason is provided). Uses the vehicle action setEnergyStorageEnergy. Does nothing without a vehicle, without a snapshot or without a tank.
---Source: lua/ge/extensions/gameplay/rally/fuelUtils.lua:112
---@param veh table Vehicle object.
---@param snapshot table Snapshot from createFuelSnapshot.
---@param logTag string|nil Log tag.
---@param reason string|nil Context for the log message ('recovery' by default).
function gameplay_rally_fuelUtils.applyFuelSnapshot(veh, snapshot, logTag, reason) end

--- Builds a fuel snapshot from a vehicle's energyStorage data.
---Source: lua/ge/extensions/gameplay/rally/fuelUtils.lua:31
---@param energyStorageData table|nil List of energy storages (storageType, energyType, name, currentEnergy, maxEnergy).
---@return table  {mode, tanks, reason}; reason explains why it falls back to a full tank.
function gameplay_rally_fuelUtils.createFuelSnapshot(energyStorageData) end

--- Asynchronously requests the 'energyStorage' value from the vehicle (core_vehicleBridge.requestValue) then calls callback with the snapshot. Without a vehicle, calls callback immediately with an empty 'full' snapshot.
---Source: lua/ge/extensions/gameplay/rally/fuelUtils.lua:101
---@param veh table|nil Vehicle object.
---@param callback function function(snapshot).
function gameplay_rally_fuelUtils.requestFuelSnapshot(veh, callback) end

