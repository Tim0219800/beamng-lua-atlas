---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/vehicleActivePooling.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_vehicleActivePooling`: manages vehicle "pools" of which only a part is active (visible and simulated) at a time, to limit the load (traffic, parked vehicles...). A pool (class VehPool) keeps two lists (activeVehs, inactiveVehs), a maxActiveAmount limit, a distance mode (activation based on distance to the camera) and a mesh fade. A vehicle's active state is that of the object (`obj:setActive(0|1)`).
--- Access: extension `core_vehicleActivePooling`: `extensions.load("core_vehicleActivePooling")`, then the global `core_vehicleActivePooling`
---@class core_vehicleActivePooling
---@field logErrors boolean false by default; if true, warnings (vehicle already active, limit reached...) are logged.
core_vehicleActivePooling = {}

--- Creates a pool, registers it and emits onVehiclePoolAdded(id).
---Source: lua/ge/extensions/core/vehicleActivePooling.lua:394
---@param data table|nil {id?, name?, activeVehs?, inactiveVehs?, maxActiveAmount?}; name defaults to 'pool<id>'
---@return VehPool  the created pool
function core_vehicleActivePooling.createPool(data) end

--- Calls VehPool:deletePool() on each pool (deletes their inactive vehicles) then empties the table.
---Source: lua/ge/extensions/core/vehicleActivePooling.lua:428
function core_vehicleActivePooling.deleteAllPools() end

--- Removes the pool from the pool table (without deleting vehicles or emitting a hook; see notes).
---Source: lua/ge/extensions/core/vehicleActivePooling.lua:401
---@param id integer pool identifier
function core_vehicleActivePooling.deletePool(id) end

--- Returns the table of all pools (not a copy).
---Source: lua/ge/extensions/core/vehicleActivePooling.lua:424
---@return table<integer, VehPool>  [id] = pool
function core_vehicleActivePooling.getAllPools() end

--- Finds a pool by its name.
---Source: lua/ge/extensions/core/vehicleActivePooling.lua:405
---@param name string|nil pool name
---@return VehPool|nil  pool found
function core_vehicleActivePooling.getPool(name) end

--- Finds a pool by its id.
---Source: lua/ge/extensions/core/vehicleActivePooling.lua:420
---@param id integer|nil identifier
---@return VehPool|nil  pool found
function core_vehicleActivePooling.getPoolById(id) end

--- Finds the pool containing a vehicle.
---Source: lua/ge/extensions/core/vehicleActivePooling.lua:412
---@param vehId integer vehicle identifier
---@return VehPool|nil  pool
---@return boolean|nil  true if the vehicle is active in it
function core_vehicleActivePooling.getPoolOfVeh(vehId) end

--- Hook: end of the level; deletes all pools (deleteAllPools).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicleActivePooling.lua:447
function core_vehicleActivePooling.onClientEndMission() end

--- Hook: recreates the pools from the serialized data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicleActivePooling.lua:490
---@param data table[] data from onSerialize
function core_vehicleActivePooling.onDeserialized(data) end

--- Hook: serializes all pools before a Lua reload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicleActivePooling.lua:481
---@return table[]  pool data
function core_vehicleActivePooling.onSerialize() end

--- Hook called every frame: applies the distance mode (activateByDistanceTo) and advances the fadeQueue fades with dtSim / fadeDuration.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicleActivePooling.lua:451
---@param dt number real elapsed time (s)
---@param dtSim number simulation elapsed time (s)
function core_vehicleActivePooling.onUpdate(dt, dtSim) end

--- Hook: a vehicle's active state changes; updates the lists of all pools that contain it.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicleActivePooling.lua:435
---@param vehId integer vehicle
---@param active boolean new state
function core_vehicleActivePooling.onVehicleActiveChanged(vehId, active) end

--- Hook: a vehicle is destroyed; removes it from all pools.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicleActivePooling.lua:441
---@param vehId integer vehicle
function core_vehicleActivePooling.onVehicleDestroyed(vehId) end

--- Vehicle pool created by createPool. Methods are called with `:` (pool:insertVeh(id)).
---@class core_vehicleActivePooling_VehPool
local core_vehicleActivePooling_VehPool = {}

--- Text '[id] active: {...}, inactive: {...}'.
---Source: lua/ge/extensions/core/vehicleActivePooling.lua:34
---@return string  description
function core_vehicleActivePooling_VehPool:__tostring() end

--- Internal: updates the lists when a vehicle's active state has changed (called by onVehicleActiveChanged). Do not call.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicleActivePooling.lua:305
---@param vehId integer vehicle
---@param activate boolean new state
function core_vehicleActivePooling_VehPool:_setVeh(vehId, activate) end

--- Deactivates active vehicles farther than dist + buffer and activates inactive ones closer than dist (the buffer avoids rapid toggling).
---Source: lua/ge/extensions/core/vehicleActivePooling.lua:368
---@param pos vec3|nil reference position; default = camera
---@param dist number|nil distance (m); default = activeDistance
---@param buffer number|nil deactivation margin (m); default 10
function core_vehicleActivePooling_VehPool:activateByDistanceTo(pos, dist, buffer) end

--- Returns true if the active vehicle limit is reached (counts the pool's active vehicles, or the scene's if useSceneVehiclesCap).
---Source: lua/ge/extensions/core/vehicleActivePooling.lua:121
---@return boolean  limit reached
function core_vehicleActivePooling_VehPool:checkActiveLimit() end

--- Empties all the pool's lists without touching the vehicles.
---Source: lua/ge/extensions/core/vehicleActivePooling.lua:133
function core_vehicleActivePooling_VehPool:clearPool() end

--- Deactivates a vehicle of this pool and activates a vehicle of another pool.
---Source: lua/ge/extensions/core/vehicleActivePooling.lua:167
---@param otherPool VehPool|nil other pool; nil or same pool = cycle
---@param vehId1 integer|nil vehicle of this pool to deactivate
---@param vehId2 integer|nil vehicle of the other pool to activate
---@return integer|false  vehId1 (or false)
---@return integer|nil  vehId2
function core_vehicleActivePooling_VehPool:crossCycle(otherPool, vehId1, vehId2) end

--- Deactivates an active vehicle and activates an inactive one from the same pool (the limit is ignored during the operation).
---Source: lua/ge/extensions/core/vehicleActivePooling.lua:153
---@param vehId1 integer|nil vehicle to deactivate; default = 1st active
---@param vehId2 integer|nil vehicle to activate; default = 1st inactive
---@return integer|false  vehId1 (or false if impossible)
---@return integer|nil  vehId2
function core_vehicleActivePooling_VehPool:cycle(vehId1, vehId2) end

--- Deletes the pool; unless keepVehicles, also deletes the inactive vehicles. Emits onVehiclePoolRemoved(id).
---Source: lua/ge/extensions/core/vehicleActivePooling.lua:141
---@param keepVehicles boolean|nil true: deletes no vehicle
function core_vehicleActivePooling_VehPool:deletePool(keepVehicles) end

--- Schedules a fade toward opaque. If the vehicle is inactive and updateActiveStatePostFade is true, activates it first.
---Source: lua/ge/extensions/core/vehicleActivePooling.lua:192
---@param vehId integer vehicle in the pool
---@return boolean  true if scheduled
function core_vehicleActivePooling_VehPool:fadeInVeh(vehId) end

--- Schedules a fade toward transparent (active vehicle required). With updateActiveStatePostFade, it is deactivated at the end of the fade.
---Source: lua/ge/extensions/core/vehicleActivePooling.lua:212
---@param vehId integer vehicle in the pool
---@return boolean  true if scheduled
function core_vehicleActivePooling_VehPool:fadeOutVeh(vehId) end

--- Directly increases or decreases the alpha of the vehicle's meshes by `dt` (clamped 0..1). Use it every frame for a progressive fade.
---Source: lua/ge/extensions/core/vehicleActivePooling.lua:181
---@param vehId integer vehicle in the pool and active
---@param dt number alpha change (negative to disappear)
---@return number  new alpha, -1 if the vehicle is not in the pool or inactive
function core_vehicleActivePooling_VehPool:fadeVeh(vehId, dt) end

--- Total number of active vehicles in the scene (all pools combined), parked vehicles excluded unless 'PropParked' is requested.
---Source: lua/ge/extensions/core/vehicleActivePooling.lua:108
---@param vehTypes string[]|nil vehicle types to count; nil = default
---@return integer  count
function core_vehicleActivePooling_VehPool:getSceneActiveAmount(vehTypes) end

--- List of all pool ids (active first).
---Source: lua/ge/extensions/core/vehicleActivePooling.lua:388
---@return integer[]  ids
function core_vehicleActivePooling_VehPool:getVehs() end

--- Adds a vehicle to the pool; it is active if the object is active and the limit allows it, otherwise inactive (and deactivated via obj:setActive).
---Source: lua/ge/extensions/core/vehicleActivePooling.lua:234
---@param vehId integer existing vehicle, not already in this pool
---@param forceInsert boolean|nil raise the limit if needed
---@return boolean  true if inserted
function core_vehicleActivePooling_VehPool:insertVeh(vehId, forceInsert) end

--- Constructor (prefer createPool). Initializes lists, limits and default values, and guarantees a unique id.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicleActivePooling.lua:38
---@param data table|nil id, name, activeVehs, inactiveVehs, maxActiveAmount
---@return VehPool  new pool
function core_vehicleActivePooling_VehPool:new(data) end

--- Copies the fields of data into the pool.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicleActivePooling.lua:100
---@param data table|nil data
function core_vehicleActivePooling_VehPool:onDeserialized(data) end

--- Returns the pool data to save.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicleActivePooling.lua:81
---@return table  data
function core_vehicleActivePooling_VehPool:onSerialize() end

--- Removes a vehicle from the pool (without deleting it).
---Source: lua/ge/extensions/core/vehicleActivePooling.lua:259
---@param vehId integer vehicle
---@return boolean  true if removed
function core_vehicleActivePooling_VehPool:removeVeh(vehId) end

--- Activates (within the maxActiveAmount limit) or deactivates all vehicles of the pool.
---Source: lua/ge/extensions/core/vehicleActivePooling.lua:282
---@param activate boolean true to activate, false to deactivate
---@return boolean  true if at least one vehicle is concerned
function core_vehicleActivePooling_VehPool:setAllVehs(activate) end

--- Sets the active vehicle limit and deactivates the excess if any.
---Source: lua/ge/extensions/core/vehicleActivePooling.lua:348
---@param amount integer|nil new limit; nil keeps it
function core_vehicleActivePooling_VehPool:setMaxActiveAmount(amount) end

--- Activates or deactivates a vehicle of the pool while respecting the limit.
---Source: lua/ge/extensions/core/vehicleActivePooling.lua:326
---@param vehId integer vehicle in the pool
---@param activate boolean desired state
---@param forceInsert boolean|nil raise the limit if it is reached
---@return boolean  true if the state changed
function core_vehicleActivePooling_VehPool:setVeh(vehId, activate, forceInsert) end

--- Checks whether one more active vehicle is allowed; with forceInsert, increases maxActiveAmount by 1 instead of refusing.
---Source: lua/ge/extensions/core/vehicleActivePooling.lua:220
---@param vehId integer vehicle (not used in the computation)
---@param forceInsert boolean|nil force by raising the limit
---@return boolean  true if allowed
function core_vehicleActivePooling_VehPool:tryInsertActiveVeh(vehId, forceInsert) end

