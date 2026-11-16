---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/hydraulicPump.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Powertrain component `hydraulicPump`: hydraulic pump (variable or fixed displacement) driven by a shaft, with a built-in accumulator and a relief valve. It is a torque consumer without an output port (leaf of the powertrain tree). It also creates the hydraulic consumers (`hydraulicCylinder`) declared in `v.data.powertrainHydros` with `connectedPump` = name of the pump, and updates them. It can supply another vehicle through a coupler (hydraulic PTO) thanks to shared electrics values.
--- Access: powertrain device type `hydraulicPump` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`
---@class powertrain_hydraulicPump
---@field deviceCategories table<string, boolean> {clutchlike=true, clutch=true, hydraulicPowerSource=true, torqueConsumer=true}.
---@field outputPorts table Empty table: no output port.
local powertrain_hydraulicPump = {}

--- Builds the pump: displacement parameters, working pressure, accumulator, relief valve and PTO, then creates the hydraulic consumers declared for this pump in v.data.powertrainHydros.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicPump.lua:349
---@param jbeamData table jbeam data of the component.
---@return table  The device (class `device`).
function powertrain_hydraulicPump.new(jbeamData) end

--- Object returned by new(jbeamData).
---@class powertrain_hydraulicPump_device
local powertrain_hydraulicPump_device = {}

--- Does nothing (empty body).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicPump.lua:173
---@param damageAmount number Ignored.
function powertrain_hydraulicPump_device:applyDeformGroupDamage(damageAmount) end

--- Purely virtual inertia: cumulativeInertia = virtualInertia / gearRatio²; cumulative ratios = gearRatio.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicPump.lua:206
function powertrain_hydraulicPump_device:calculateInertia() end

--- Returns 1 (0 if broken) and the table {isBroken}.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicPump.lua:188
---@return number  Integrity.
---@return table  {isBroken}.
function powertrain_hydraulicPump_device:getPartCondition() end

--- Returns the saveable state: oil volume of the accumulator (key '<name>_accumulatorOilVolume') merged with the states of the consumers.
---Source: lua/vehicle/powertrain/hydraulicPump.lua:219
---@return table  stateData table.
function powertrain_hydraulicPump_device:getState() end

--- Creates the pump sound loop (volume 0), computes maximum speed and flow for the sound from the driving engine, reads the sound settings from the jbeam and initializes the consumers' sounds.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicPump.lua:252
---@param jbeamData table jbeam data of the component.
function powertrain_hydraulicPump_device:initSounds(jbeamData) end

--- Sets isBroken = true and switches to the "broken" version of velocityUpdate (the accumulator empties).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicPump.lua:201
function powertrain_hydraulicPump_device:onBreak() end

--- Coupler hook: when a PTO coupler of this pump attaches to another vehicle, creates the flow electrics value for that vehicle and sends it its name via beamstate.sendExportCouplerData.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicPump.lua:134
---@param nodeId integer Node of this vehicle carrying the coupler.
---@param obj2id integer Id of the other vehicle.
---@param obj2nodeId integer Node of the other vehicle.
---@param attachForce number Attach force (unused).
function powertrain_hydraulicPump_device:onCouplerAttached(nodeId, obj2id, obj2nodeId, attachForce) end

--- Coupler hook: when the PTO coupler of this pump detaches, removes the flow electrics value of the other vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicPump.lua:148
---@param nodeId integer Node of this vehicle carrying the coupler.
---@param obj2id integer Id of the other vehicle.
---@param obj2nodeId integer Node of the other vehicle.
---@param breakForce number Breaking force (unused).
function powertrain_hydraulicPump_device:onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce) end

--- Resets speeds, flows, accumulator (initial pressure and volume), state, PTO electrics values, then reinitializes each consumer.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicPump.lua:301
---@param jbeamData table jbeam data of the component (gearRatio, friction, isConnected).
---@return table  The device.
function powertrain_hydraulicPump_device:reset(jbeamData) end

--- Calls resetSounds of each consumer; does not touch the sound of the pump itself.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicPump.lua:293
---@param jbeamData table jbeam data of the component.
function powertrain_hydraulicPump_device:resetSounds(jbeamData) end

--- Engages (true) or disengages (false) the pump from its driver: isConnectedCoef = 1 or 0. Can be called by a PTO controller.
---Source: lua/vehicle/powertrain/hydraulicPump.lua:159
---@param isConnected boolean true to drive the pump.
function powertrain_hydraulicPump_device:setConnected(isConnected) end

--- Applies isBroken from the integrity (number: not broken; table: isBroken field) by calling onBreak if needed.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicPump.lua:176
---@param subSystem any Not used.
---@param odometer number Not used.
---@param integrity number|table Number 0..1 or table {isBroken}.
---@param visual any Not used.
function powertrain_hydraulicPump_device:setPartCondition(subSystem, odometer, integrity, visual) end

--- Restores the oil volume of the accumulator (finite number, clamped to 2 * accumulatorMaxVolume) and the corresponding pressure, then passes the state on to the consumers.
---Source: lua/vehicle/powertrain/hydraulicPump.lua:233
---@param data table|nil State table produced by getState.
function powertrain_hydraulicPump_device:setState(data) end

--- Called at each physics step: computes the accumulator pressure, the resisting torque torqueDiff = pressure * displacement / (2π) / gearRatio, queries each consumer (consumer:update) to get its flows, then computes the relief flow (unloader and progressive relief valve).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicPump.lua:51
---@param dt number Time step in seconds.
function powertrain_hydraulicPump_device:torqueUpdate(dt) end

--- Per-frame update: updates the consumers (updateGFX), publishes the pressure and max flow on electrics, subtracts the flow requested by the remote consumers (PTO) from the accumulator and displays a debug graph if showDebugGraph.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicPump.lua:74
---@param dt number Frame duration in seconds.
function powertrain_hydraulicPump_device:updateGFX(dt) end

--- Sets the volume, pitch (according to the pump speed) and color (according to the hydraulic power) of the pump sound and calls updateSounds of the consumers.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicPump.lua:96
---@param dt number Frame duration in seconds.
function powertrain_hydraulicPump_device:updateSounds(dt) end

--- Called after the powertrain is built; always returns true.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicPump.lua:197
---@return boolean  true.
function powertrain_hydraulicPump_device:validate() end

--- Called at each physics step: computes the current displacement (variable or fixed), inputAV = parent speed / gearRatio * isConnectedCoef, the pump flow and updates the accumulator oil volume (incoming flow minus outputs, relief, unloader). Broken version: everything at 0 and draining.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydraulicPump.lua:44
---@param dt number Time step in seconds.
function powertrain_hydraulicPump_device:velocityUpdate(dt) end

return powertrain_hydraulicPump
