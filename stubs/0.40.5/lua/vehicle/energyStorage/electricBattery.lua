---@meta
-- tim19Atlas stub generated from lua/vehicle/energyStorage/electricBattery.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Energy storage type 'electricBattery': electric vehicle battery. Energy is kept in joules (energyType 'electricEnergy') and configured in kWh in the jbeam. Instantiated by energyStorage.lua from a jbeam entry with `type = "electricBattery"`; electric motors consume it through the powertrain devices.
--- Access: energy storage type `electricBattery`, reachable with `energyStorage.getStorage("name")`
---@class energyStorage_electricBattery
local energyStorage_electricBattery = {}

--- Creates an electric battery type storage from the jbeam entry. The returned storage is a table with name, type, energyType, assignedDevices, capacity (kWh), startingCapacity (kWh), energyCapacity (J), initialStoredEnergy (J), storedEnergy, remainingRatio, remainingVolume, jbeamData and the methods listed in the 'storage' class.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/energyStorage/electricBattery.lua:52
---@param jbeamData table Merged jbeam data of the storage.
---@return table  Storage instance ('storage' class).
function energyStorage_electricBattery.new(jbeamData) end

--- Instance returned by new(jbeamData). Methods are called with the `storage:method(...)` syntax.
---@class energyStorage_electricBattery_storage
local energyStorage_electricBattery_storage = {}

--- Returns the integrity (always 1) and the state {storedEnergy}.
---Source: lua/vehicle/energyStorage/electricBattery.lua:39
---@return number  integrityValue (1).
---@return table  {storedEnergy = J}.
function energyStorage_electricBattery_storage:getPartCondition() end

--- Registers a powertrain device in assignedDevices (by its name).
---Source: lua/vehicle/energyStorage/electricBattery.lua:23
---@param device table Device with a name field.
function energyStorage_electricBattery_storage:registerDevice(device) end

--- Restores the starting charge (startingCapacity in kWh converted to J).
---Source: lua/vehicle/energyStorage/electricBattery.lua:48
function energyStorage_electricBattery_storage:reset() end

--- Restores the state from the part condition: a number is interpreted as a fraction of energyCapacity, a table must contain storedEnergy.
---Source: lua/vehicle/energyStorage/electricBattery.lua:27
---@param odometer number Unused.
---@param integrity number|table Fraction (0 to 1) or {storedEnergy = J}.
---@param visual any Unused.
function energyStorage_electricBattery_storage:setPartCondition(odometer, integrity, visual) end

--- Sets the energy to energyCapacity * ratio (ratio clamped between 0 and 1).
---Source: lua/vehicle/energyStorage/electricBattery.lua:15
---@param ratio number Charge level from 0 to 1.
function energyStorage_electricBattery_storage:setRemainingRatio(ratio) end

--- Sets the stored energy and recomputes remainingVolume (kWh) and remainingRatio.
---Source: lua/vehicle/energyStorage/electricBattery.lua:9
---@param energy number Energy in joules.
function energyStorage_electricBattery_storage:setStoredEnergy(energy) end

--- Called every frame by energyStorage.updateGFX: recomputes the derived values.
---Source: lua/vehicle/energyStorage/electricBattery.lua:19
---@param dt number Time step in seconds (unused).
function energyStorage_electricBattery_storage:updateGFX(dt) end

return energyStorage_electricBattery
