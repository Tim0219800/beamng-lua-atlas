---@meta
-- tim19Atlas stub generated from lua/vehicle/energyStorage.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manager of the vehicle's energy tanks (fuel, battery, N2O, compressed air...). At init it dynamically loads each type from lua/vehicle/energyStorage/<type>.lua for each entry of the jbeam `energyStorage` section, registers the storages with the powertrain devices (device.energyStorage), updates `remainingRatio` every frame and relays beam break, coupling and part condition events. A modder uses it to find a storage by name (getStorage/getStorageSafe) and read/modify its stored energy.
--- Access: global `energyStorage`
---@class energyStorage
---@field nilStorage table 'Magic' fake storage created in init: any indexing or call returns itself, writes are ignored. Returned by getStorageSafe when the name does not exist. Is {} (without a metatable) before the first init.
---@field updateGFX function Is nop (global variable nop) as long as there is no storage; replaced in init by the per-frame update function. (The extraction .md flags nop as undefined: it is an engine global.)
energyStorage = {}

--- Called by the engine when a beam breaks. If the beam is a trigger of a storage, calls storage:onBreak() and sets the damage in damageTracker.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/energyStorage.lua:170
---@param id integer Identifier (cid) of the broken beam.
function energyStorage.beamBroke(id) end

--- Aggregates the integrity condition of the storages linked to the part ('energyStorage:<name>' types). integrityValue is the minimum of the storage values, integrityState a table by name.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/energyStorage.lua:258
---@param partTypeData table<integer, string> List of part types, e.g. {"energyStorage:mainTank"}.
---@return table  {integrityValue, integrityState, visualValue, visualState}.
---@return boolean  true if at least one storage can provide an integrity condition.
---@return boolean  Visual condition available (always false).
function energyStorage.getPartCondition(partTypeData) end

--- Returns the storage with this name, or nil if it does not exist.
---Source: lua/vehicle/energyStorage.lua:214
---@param name string Storage name (jbeam name field).
---@return table|nil  The storage or nil.
function energyStorage.getStorage(name) end

--- Like getStorage but returns nilStorage (object that absorbs all accesses and calls) if the name is unknown, with a debug log.
---Source: lua/vehicle/energyStorage.lua:218
---@param name string Storage name.
---@return table  The storage or nilStorage.
function energyStorage.getStorageSafe(name) end

--- Returns the table of all storages keyed by name.
---Source: lua/vehicle/energyStorage.lua:210
---@return table<string, table>  Storages by name.
function energyStorage.getStorages() end

--- Called at vehicle initialization: discovers the available types, instantiates the jbeam storages, registers them in the powertrain devices, builds the table of beams that trigger a break and creates nilStorage.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/energyStorage.lua:30
function energyStorage.init() end

--- Hook called when a coupler attaches; relayed to storage:onCouplerAttached without attachSpeed.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/energyStorage.lua:192
---@param nodeId integer Coupler node.
---@param obj2id integer Other vehicle.
---@param obj2nodeId integer Node of the other vehicle.
---@param attachSpeed number Attach speed (not passed on).
---@param attachEnergy number Attach energy.
function energyStorage.onCouplerAttached(nodeId, obj2id, obj2nodeId, attachSpeed, attachEnergy) end

--- Hook called when a coupler detaches; relayed to storage:onCouplerDetached.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/energyStorage.lua:201
---@param nodeId integer Coupler node.
---@param obj2id integer Other vehicle.
---@param obj2nodeId integer Node of the other vehicle.
---@param breakForce number Break force.
function energyStorage.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce) end

--- Hook called when a coupler finds a nearby partner; relayed to storage:onCouplerFound.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/energyStorage.lua:183
---@param nodeId integer Coupler node of this vehicle.
---@param obj2id integer Identifier of the other vehicle.
---@param obj2nodeId integer Node of the other vehicle.
---@param nodeDist number Distance between the two nodes (m).
function energyStorage.onCouplerFound(nodeId, obj2id, obj2nodeId, nodeDist) end

--- Deserialization (save) hook; currently without effect (code commented out).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/energyStorage.lua:278
---@param data table Serialized data.
function energyStorage.onDeserialize(data) end

--- Serialization hook: returns {name = storage:serialize()} for the storages that have serialize().
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/energyStorage.lua:289
---@return table<string, any>  Serialized data by storage name.
function energyStorage.onSerialize() end

--- Called at vehicle reset: calls reset() of each storage, sets their damage back to false in damageTracker and re-registers the storages with the devices.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/energyStorage.lua:147
function energyStorage.reset() end

--- Applies the part condition (odometer, integrity, visual) to the storages linked to the part; if integrity is a table with the key energyStorage, the storage value is taken by its name.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/energyStorage.lua:243
---@param partTypeData table<integer, string> Part types 'energyStorage:<name>'.
---@param odometer number Part odometer (inferred from code).
---@param integrity number|table Integrity or table {energyStorage = {name = value}}.
---@param visual any Visual condition passed as is.
function energyStorage.setPartCondition(partTypeData, odometer, integrity, visual) end

