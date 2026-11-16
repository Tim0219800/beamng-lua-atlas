---@meta
-- tim19Atlas stub generated from lua/vehicle/energyStorage/n2oTank.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Energy storage type 'n2oTank': nitrous oxide (nitrous) bottle. Capacity is expressed in mass (kg), the stored energy being the mass multiplied by a fictitious energy density. Works like fuelTank (node mass adjusted, leak in 60 s if the trigger beam breaks). Instantiated by energyStorage.lua for `type = "n2oTank"`.
--- Access: energy storage type `n2oTank`, reachable with `energyStorage.getStorage("name")`
---@class energyStorage_n2oTank
local energyStorage_n2oTank = {}

--- Creates the N2O bottle instance from the jbeam entry.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/energyStorage/n2oTank.lua:84
---@param jbeamData table Merged jbeam data of the storage.
---@return table  Storage instance ('storage' class).
function energyStorage_n2oTank.new(jbeamData) end

--- Instance returned by new(jbeamData). Notable fields: name, type, energyType ('n2o'), storedEnergy (J), energyCapacity (J), initialStoredEnergy, capacity (kg), startingCapacity (kg), remainingMass (kg), remainingRatio, currentLeakRate (kg/s), brokenLeakRate, energyDensity, assignedDevices.
---@class energyStorage_n2oTank_storage
local energyStorage_n2oTank_storage = {}

--- Restores remainingMass if present.
---Source: lua/vehicle/energyStorage/n2oTank.lua:74
---@param data table Table containing remainingMass.
function energyStorage_n2oTank_storage:deserialize(data) end

--- Returns the integrity (always 1) and {storedEnergy}.
---Source: lua/vehicle/energyStorage/n2oTank.lua:53
---@return number  integrityValue.
---@return table  State.
function energyStorage_n2oTank_storage:getPartCondition() end

--- Called when a trigger beam breaks: enables the leak.
---Source: lua/vehicle/energyStorage/n2oTank.lua:31
function energyStorage_n2oTank_storage:onBreak() end

--- Registers a device in assignedDevices.
---Source: lua/vehicle/energyStorage/n2oTank.lua:35
---@param device table Device with a name field.
function energyStorage_n2oTank_storage:registerDevice(device) end

--- Fills the bottle to the starting level, removes the leak and reapplies the mass to the nodes.
---Source: lua/vehicle/energyStorage/n2oTank.lua:62
function energyStorage_n2oTank_storage:reset() end

--- Returns {remainingMass}.
---Source: lua/vehicle/energyStorage/n2oTank.lua:80
---@return table  {remainingMass = kg}.
function energyStorage_n2oTank_storage:serialize() end

--- Restores the state from the part condition (number = fraction, or table {storedEnergy}).
---Source: lua/vehicle/energyStorage/n2oTank.lua:39
---@param odometer number Unused.
---@param integrity number|table Fraction 0 to 1 or state table.
---@param visual any Unused.
function energyStorage_n2oTank_storage:setPartCondition(odometer, integrity, visual) end

--- Sets the remaining mass (clamped between 0 and capacity).
---Source: lua/vehicle/energyStorage/n2oTank.lua:23
---@param mass number Mass in kg.
function energyStorage_n2oTank_storage:setRemainingMass(mass) end

--- Sets storedEnergy to energyCapacity * ratio (ratio clamped between 0 and 1).
---Source: lua/vehicle/energyStorage/n2oTank.lua:27
---@param ratio number 0 to 1.
function energyStorage_n2oTank_storage:setRemainingRatio(ratio) end

--- Called every frame: recomputes remainingMass/remainingRatio, applies the mass to the nodes and applies the leak if active.
---Source: lua/vehicle/energyStorage/n2oTank.lua:10
---@param dt number Time step in seconds.
function energyStorage_n2oTank_storage:updateGFX(dt) end

return energyStorage_n2oTank
