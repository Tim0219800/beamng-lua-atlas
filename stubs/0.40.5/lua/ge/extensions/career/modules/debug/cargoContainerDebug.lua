---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/debug/cargoContainerDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Vehicle > Cargo Containers" debug tool. Queries all active vehicles (core_vehicleBridge.requestValue 'getCargoContainers'), shows their cargo containers (volume, density, capacity, node cluster) and lets you send volume/density to them or fill them at an adjustable flow rate. Can be opened outside career.
--- Access: extension `career_modules_debug_cargoContainerDebug`: `extensions.load("career_modules_debug_cargoContainerDebug")`, then the global `career_modules_debug_cargoContainerDebug`
---@class career_modules_debug_cargoContainerDebug
---@field debugName string 'Vehicle > Cargo Containers'.
---@field debugOrder number Sort order in the debug window (11).
---@field vehCargoData table[] List of vehicles with their containers, sorted by vehId: {vehId, name, containers, vehPos, clusterGeneration…}.
career_modules_debug_cargoContainerDebug = {}

--- Draws the 'Cargo Container Debug' window: refresh button, flow rate, and for each vehicle updateVehicle then drawVehicle (removes those that no longer exist).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/debug/cargoContainerDebug.lua:320
---@param dt number Time delta.
function career_modules_debug_cargoContainerDebug.drawDebugMenu(dt) end

--- Draws the Flow Rate (0..1) and Max Fill Rate (L/s) sliders, the 'Refueling' actionMap checkbox, and applies filling to the marked containers.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/debug/cargoContainerDebug.lua:279
---@param dt number Time delta in seconds.
function career_modules_debug_cargoContainerDebug.drawFlowRate(dt) end

--- Draws in ImGui the table of a vehicle and its containers with volume/density input fields and a checkbox to fill at the flow rate.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/debug/cargoContainerDebug.lua:101
---@param data table Entry of vehCargoData.
function career_modules_debug_cargoContainerDebug.drawVehicle(data) end

--- Asks each active vehicle for its list of containers and fills M.vehCargoData when all have replied (asynchronous). Returns an empty table if core_vehicleBridge is missing.
---Source: lua/ge/extensions/career/modules/debug/cargoContainerDebug.lua:19
---@return table|nil  {} if core_vehicleBridge is missing, otherwise nothing.
function career_modules_debug_cargoContainerDebug.getData() end

--- Hook (e.g. input action) that sets the flow rate, clamped to [0, 1].
---Source: lua/ge/extensions/career/modules/debug/cargoContainerDebug.lua:315
---@param factor number New flow factor.
function career_modules_debug_cargoContainerDebug.onChangeFlowRate(factor) end

--- Hook: same handling as onVehicleDestroyed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/debug/cargoContainerDebug.lua:364
---@param id integer Vehicle id.
function career_modules_debug_cargoContainerDebug.onInstabilityDetected(id) end

--- Hook: removes the data of the destroyed vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/debug/cargoContainerDebug.lua:364
---@param id integer Vehicle id.
function career_modules_debug_cargoContainerDebug.onVehicleDestroyed(id) end

--- Hook: removes the data of the reset vehicle and forces a new getData.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/debug/cargoContainerDebug.lua:357
---@param id integer Vehicle id.
function career_modules_debug_cargoContainerDebug.onVehicleResetted(id) end

--- Opens the tool outside career: hooks drawDebugMenu onto onUpdate (hookUpdate) and calls getData.
---Source: lua/ge/extensions/career/modules/debug/cargoContainerDebug.lua:351
function career_modules_debug_cargoContainerDebug.show() end

--- Refreshes a vehicle's data: node cluster (if the generation changed), position of the vehicle and of each container. Returns false if the vehicle no longer exists.
---Source: lua/ge/extensions/career/modules/debug/cargoContainerDebug.lua:75
---@param data table Entry of vehCargoData.
---@return boolean  false if the vehicle cannot be found.
function career_modules_debug_cargoContainerDebug.updateVehicle(data) end

