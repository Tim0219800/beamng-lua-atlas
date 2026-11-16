---@meta
-- tim19Atlas stub generated from lua/vehicle/energyStorage/fuelTank.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Energy storage type 'fuelTank': liquid fuel tank (gasoline, diesel, kerosene). Energy is stored in joules from the volume in liters, the density and the energy density; the mass of the engine group nodes is adjusted according to the level, and a leak can empty the tank in 60 s if it is punctured. Instantiated by energyStorage.lua for `type = "fuelTank"`.
--- Access: energy storage type `fuelTank`, reachable with `energyStorage.getStorage("name")`
---@class energyStorage_fuelTank
local energyStorage_fuelTank = {}

--- Creates the tank instance from the jbeam entry and immediately applies the fuel mass to the relevant nodes.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/energyStorage/fuelTank.lua:87
---@param jbeamData table Merged jbeam data of the storage.
---@return table  Storage instance ('storage' class).
function energyStorage_fuelTank.new(jbeamData) end

--- Instance returned by new(jbeamData). Notable public fields: name, type, energyType, storedEnergy (J), energyCapacity (J), initialStoredEnergy (J), capacity (L), startingCapacity (L), remainingVolume (L), remainingRatio (0 to 1), currentLeakRate (L/s), brokenLeakRate, energyDensity, fuelLiquidDensity, assignedDevices.
---@class energyStorage_fuelTank_storage
local energyStorage_fuelTank_storage = {}

--- Restores remainingVolume from serialized data (if present).
---Source: lua/vehicle/energyStorage/fuelTank.lua:77
---@param data table Table containing remainingVolume.
function energyStorage_fuelTank_storage:deserialize(data) end

--- Returns the integrity (0 if leaking, 1 otherwise) and the state {storedEnergy, currentLeakRate = 0}.
---Source: lua/vehicle/energyStorage/fuelTank.lua:55
---@return number  integrityValue.
---@return table  Saveable state.
function energyStorage_fuelTank_storage:getPartCondition() end

--- Called when a breakTriggerBeam beam breaks: enables the leak (currentLeakRate = brokenLeakRate).
---Source: lua/vehicle/energyStorage/fuelTank.lua:31
function energyStorage_fuelTank_storage:onBreak() end

--- Registers a device in assignedDevices.
---Source: lua/vehicle/energyStorage/fuelTank.lua:35
---@param device table Device with a name field.
function energyStorage_fuelTank_storage:registerDevice(device) end

--- Fills the tank to the starting level, removes the leak and reapplies the mass to the nodes.
---Source: lua/vehicle/energyStorage/fuelTank.lua:65
function energyStorage_fuelTank_storage:reset() end

--- Returns {remainingVolume} for saving.
---Source: lua/vehicle/energyStorage/fuelTank.lua:83
---@return table  {remainingVolume = L}.
function energyStorage_fuelTank_storage:serialize() end

--- Restores the state from the part condition (number = fraction of the tank, with a leak if 0; or table {storedEnergy, currentLeakRate}).
---Source: lua/vehicle/energyStorage/fuelTank.lua:39
---@param odometer number Unused.
---@param integrity number|table Fraction 0 to 1 or state table.
---@param visual any Unused.
function energyStorage_fuelTank_storage:setPartCondition(odometer, integrity, visual) end

--- Sets storedEnergy to energyCapacity * ratio (ratio clamped between 0 and 1).
---Source: lua/vehicle/energyStorage/fuelTank.lua:27
---@param ratio number 0 to 1.
function energyStorage_fuelTank_storage:setRemainingRatio(ratio) end

--- Sets the remaining volume (clamped between 0 and capacity) and updates storedEnergy.
---Source: lua/vehicle/energyStorage/fuelTank.lua:23
---@param volume number Liters.
function energyStorage_fuelTank_storage:setRemainingVolume(volume) end

--- Called every frame: recomputes remainingVolume/remainingRatio, applies the mass to the nodes and removes fuel if currentLeakRate > 0.
---Source: lua/vehicle/energyStorage/fuelTank.lua:10
---@param dt number Time step in seconds.
function energyStorage_fuelTank_storage:updateGFX(dt) end

return energyStorage_fuelTank
