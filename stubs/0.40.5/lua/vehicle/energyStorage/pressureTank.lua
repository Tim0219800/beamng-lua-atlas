---@meta
-- tim19Atlas stub generated from lua/vehicle/energyStorage/pressureTank.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Energy storage type 'pressureTank': pressurized gas tank (compressed air for trucks, trailers, air suspensions). Energy equals P·V (ideal gas law, takes into account the powertrain's ambient pressure and temperature), the tank can leak (beam break or deformation) and can feed or be fed by another vehicle via a coupler (pneumatic PTO, synchronization through electrics). Instantiated by energyStorage.lua for `type = "pressureTank"`.
--- Access: energy storage type `pressureTank`, reachable with `energyStorage.getStorage("name")`
---@class energyStorage_pressureTank
local energyStorage_pressureTank = {}

--- Creates the pressure tank instance, computes energy, mass and electrics names, and initializes the electrics values and damages.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/energyStorage/pressureTank.lua:268
---@param jbeamData table Merged jbeam data of the storage.
---@return table  Storage instance ('storage' class).
function energyStorage_pressureTank.new(jbeamData) end

--- Instance returned by new(jbeamData). Notable fields: name, type, energyType, capacity (m³), storedEnergy (J), energyCapacity (J), initialStoredEnergy, remainingMass (kg), remainingRatio, currentPressure (absolute Pa), supplyPressure, maxWorkingPressure, currentLeakRate, maxLeakRate, consumerPressureCoef (0 to 1), pressureElectricName, pressureConsumerElectricName, pressureConsumerCoefElectricName.
---@class energyStorage_pressureTank_storage
local energyStorage_pressureTank_storage = {}

--- Restores remainingMass if present.
---Source: lua/vehicle/energyStorage/pressureTank.lua:258
---@param data table Table containing remainingMass.
function energyStorage_pressureTank_storage:deserialize(data) end

--- Returns the integrity (always 1) and {storedEnergy}.
---Source: lua/vehicle/energyStorage/pressureTank.lua:215
---@return number  integrityValue.
---@return table  State.
function energyStorage_pressureTank_storage:getPartCondition() end

--- Returns the remaining gas mass.
---Source: lua/vehicle/energyStorage/pressureTank.lua:166
---@return number  Mass in kg.
function energyStorage_pressureTank_storage:getRemainingMass() end

--- Called when a trigger beam breaks: maximum leak and 'breakLeak' damage.
---Source: lua/vehicle/energyStorage/pressureTank.lua:194
function energyStorage_pressureTank_storage:onBreak() end

--- Coupling hook: if the node is a supply node, creates the synchronization electrics names with the supplier vehicle and requests the pressure export; if it is a consumer node, initializes pressure and flow and requests the flow export.
---Source: lua/vehicle/energyStorage/pressureTank.lua:116
---@param nodeId integer Coupler node of this vehicle.
---@param obj2id integer Identifier of the other vehicle.
---@param obj2nodeId integer Node of the other vehicle.
---@param attachForce number Receives attachEnergy (see notes), unused.
function energyStorage_pressureTank_storage:onCouplerAttached(nodeId, obj2id, obj2nodeId, attachForce) end

--- Detach hook: removes the synchronization electrics on the consumer side (supplyPressure reset to 0) or the flow on the supplier side.
---Source: lua/vehicle/energyStorage/pressureTank.lua:142
---@param nodeId integer Coupler node.
---@param obj2id integer Other vehicle.
---@param obj2nodeId integer Node of the other vehicle.
---@param breakForce number Break force (unused).
function energyStorage_pressureTank_storage:onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce) end

--- Registers a device in assignedDevices.
---Source: lua/vehicle/energyStorage/pressureTank.lua:199
---@param device table Device with a name field.
function energyStorage_pressureTank_storage:registerDevice(device) end

--- Resets the tank to its starting pressure, removes leaks and synchronizations, reinitializes the electrics and damages.
---Source: lua/vehicle/energyStorage/pressureTank.lua:224
function energyStorage_pressureTank_storage:reset() end

--- Returns {remainingMass}.
---Source: lua/vehicle/energyStorage/pressureTank.lua:264
---@return table  {remainingMass = kg}.
function energyStorage_pressureTank_storage:serialize() end

--- Sets the pressure coefficient sent to consumers (clamped 0 to 1) and displays a UI message (trailerAir enabled/disabled).
---Source: lua/vehicle/energyStorage/pressureTank.lua:185
---@param coef number 0 cuts the supply, 1 full.
function energyStorage_pressureTank_storage:setConsumerPressureCoef(coef) end

--- Restores storedEnergy from the part condition (number = fraction of energyCapacity, or table {storedEnergy}).
---Source: lua/vehicle/energyStorage/pressureTank.lua:203
---@param odometer number Unused.
---@param integrity number|table Fraction 0 to 1 or state table.
---@param visual any Unused.
function energyStorage_pressureTank_storage:setPartCondition(odometer, integrity, visual) end

--- Sets the gas mass (converted to moles then to energy).
---Source: lua/vehicle/energyStorage/pressureTank.lua:170
---@param mass number Mass in kg.
function energyStorage_pressureTank_storage:setRemainingMass(mass) end

--- Sets the fill ratio relative to the maximum pressure.
---Source: lua/vehicle/energyStorage/pressureTank.lua:179
---@param ratio number 0 to 1 (clamped).
function energyStorage_pressureTank_storage:setRemainingRatio(ratio) end

--- Toggles consumerPressureCoef between 0 and 1.
---Source: lua/vehicle/energyStorage/pressureTank.lua:190
function energyStorage_pressureTank_storage:toggleConsumerPressureCoef() end

--- Recomputes storedEnergy, remainingMass and remainingRatio at the current ambient temperature. Without an argument, deduces the gas quantity from the current energy and the old temperature.
---Source: lua/vehicle/energyStorage/pressureTank.lua:101
---@param molarQuantity number|nil Gas quantity in mol; nil to deduce it from storedEnergy.
function energyStorage_pressureTank_storage:updateEnergy(molarQuantity) end

--- Called every frame: computes the pressure, synchronizes with suppliers/consumers, applies the leak (break or deformation), updates energy and node mass and publishes the relative pressure in electrics.
---Source: lua/vehicle/energyStorage/pressureTank.lua:58
---@param dt number Time step in seconds.
function energyStorage_pressureTank_storage:updateGFX(dt) end

--- Consumer side: balances the energy with the supplier's supply pressure and publishes the flow; supplier side: publishes the pressure sent to the consumer and removes the energy corresponding to the received flow.
---Source: lua/vehicle/energyStorage/pressureTank.lua:16
---@param dt number Time step in seconds.
function energyStorage_pressureTank_storage:updateTankSync(dt) end

return energyStorage_pressureTank
