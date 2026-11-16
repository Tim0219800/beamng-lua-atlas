---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/hydraulicAccumulator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Powertrain component `hydraulicAccumulator`: standalone hydraulic accumulator (pressurized tank, without pump or mechanical drive). It supplies hydraulic consumers (`hydraulicCylinder`, declared in `v.data.powertrainHydros` with `connectedPump` = name of the accumulator) and can be filled remotely from the pump of another coupled vehicle (trailer, tool) via shared electrics values (hydraulic PTO). Category `hydraulicPowerSource`, without an output port or torque.
--- Access: powertrain device type `hydraulicAccumulator` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`
---@class powertrain_hydraulicAccumulator
---@field deviceCategories table<string, boolean> {hydraulicPowerSource=true}.
---@field outputPorts table Empty table: no output port.
local powertrain_hydraulicAccumulator = {}

--- Builds the accumulator: working pressure, volume, initial state, relief valve, PTO electrics names, supply and consumer coupler nodes, then creates the hydraulic consumers declared for it in v.data.powertrainHydros.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicAccumulator.lua:303
---@param jbeamData table jbeam data of the component.
---@return table  The device (class `device`).
function powertrain_hydraulicAccumulator.new(jbeamData) end

--- Object returned by new(jbeamData). velocityUpdate is nop.
---@class powertrain_hydraulicAccumulator_device
local powertrain_hydraulicAccumulator_device = {}

--- Does nothing (empty body).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicAccumulator.lua:155
---@param damageAmount number Ignored.
function powertrain_hydraulicAccumulator_device:applyDeformGroupDamage(damageAmount) end

--- Purely virtual inertia: cumulativeInertia = virtualInertia / gearRatio²; cumulative ratios = gearRatio.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicAccumulator.lua:198
function powertrain_hydraulicAccumulator_device:calculateInertia() end

--- Returns 1 (0 if broken) and the table {isBroken}.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicAccumulator.lua:170
---@return number  Integrity.
---@return table  {isBroken}.
function powertrain_hydraulicAccumulator_device:getPartCondition() end

--- Returns the saveable state: oil volume (key '<name>_accumulatorOilVolume') merged with the state of the consumers.
---Source: lua/vehicle/powertrain/hydraulicAccumulator.lua:211
---@return table  stateData table.
function powertrain_hydraulicAccumulator_device:getState() end

--- Initializes the sounds of each consumer; the accumulator has no sound of its own.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicAccumulator.lua:243
---@param jbeamData table jbeam data of the component (unused).
function powertrain_hydraulicAccumulator_device:initSounds(jbeamData) end

--- Sets isBroken = true and empties the accumulator: pressure, volume, flows and PTO electrics reset to 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicAccumulator.lua:183
function powertrain_hydraulicAccumulator_device:onBreak() end

--- Coupler hook. Consumer side: when the supply coupler is attached, creates the electrics names shared with the supplying vehicle and sends it the names to export. Supply side: when a vehicle connects to a consumer coupler, creates the flow electrics value for it and exports it to it.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicAccumulator.lua:87
---@param nodeId integer Node of this vehicle carrying the coupler.
---@param obj2id integer Id of the other vehicle.
---@param obj2nodeId integer Node of the other vehicle.
---@param attachForce number Attach force (unused).
function powertrain_hydraulicAccumulator_device:onCouplerAttached(nodeId, obj2id, obj2nodeId, attachForce) end

--- Coupler hook. Consumer side: removes the electrics values of the supply. Supply side: removes the flow value of the departed consumer.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicAccumulator.lua:119
---@param nodeId integer Node of this vehicle carrying the coupler.
---@param obj2id integer Id of the other vehicle.
---@param obj2nodeId integer Node of the other vehicle.
---@param breakForce number Breaking force (unused).
function powertrain_hydraulicAccumulator_device:onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce) end

--- Resets the state (initial pressure and volume, flows, PTO electrics, supply names), then reinitializes the consumers.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicAccumulator.lua:259
---@param jbeamData table jbeam data of the component (gearRatio, friction).
---@return table  The device.
function powertrain_hydraulicAccumulator_device:reset(jbeamData) end

--- Calls resetSounds of each consumer.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicAccumulator.lua:251
---@param jbeamData table jbeam data of the component (unused).
function powertrain_hydraulicAccumulator_device:resetSounds(jbeamData) end

--- Applies isBroken from the integrity (number: not broken; table: isBroken field) by calling onBreak if needed.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicAccumulator.lua:158
---@param subSystem any Not used.
---@param odometer number Not used.
---@param integrity number|table Number 0..1 or table {isBroken}.
---@param visual any Not used.
function powertrain_hydraulicAccumulator_device:setPartCondition(subSystem, odometer, integrity, visual) end

--- Restores the oil volume (finite number, clamped, ignored if the accumulator is broken) and the pressure, then passes the state on to the consumers.
---Source: lua/vehicle/powertrain/hydraulicAccumulator.lua:225
---@param data table|nil State table produced by getState.
function powertrain_hydraulicAccumulator_device:setState(data) end

--- Called at each physics step: computes the pressure, queries each consumer (consumer:update) to get its flows, computes the relief valve flow, sets outputTorque1 to 0 and subtracts the outgoing flows from the oil volume.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicAccumulator.lua:17
---@param dt number Time step in seconds.
function powertrain_hydraulicAccumulator_device:torqueUpdate(dt) end

--- Per-frame update: updates the consumers, receives the flow from the remote supply (consumer side), publishes the pressure in the electrics (supply side) and subtracts the flows requested by the remote consumers.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicAccumulator.lua:42
---@param dt number Frame duration in seconds.
function powertrain_hydraulicAccumulator_device:updateGFX(dt) end

--- Calls updateSounds of each consumer (the accumulator has no sound of its own).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicAccumulator.lua:81
---@param dt number Frame duration in seconds.
function powertrain_hydraulicAccumulator_device:updateSounds(dt) end

--- Called after the powertrain is built; always returns true.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicAccumulator.lua:179
---@return boolean  true.
function powertrain_hydraulicAccumulator_device:validate() end

return powertrain_hydraulicAccumulator
