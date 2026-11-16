---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/modules/vehicleModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Vehicle module instance (mgr.modules.vehicle). Internal tables: vehicles (id -> data: id, ready, internalName, couplerOffset, couplerTags, dontDelete, storedEnergyStorage...), sortedIds (sorted ids), couplings (id -> {otherId = true}).
---@class flowgraph_modules_vehicleModule_C
local flowgraph_modules_vehicleModule_C = {}

--- Records the received coupler offsets (vec3, name, tag) for a vehicle and sorts them by tag priority then by name.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/vehicleModule.lua:135
---@param id integer vehicle id
---@param off table coupler name -> position
---@param tag string coupler tag
function flowgraph_modules_vehicleModule_C:addCouplerOffset(id, off, tag) end

--- Declares a vehicle not created by the flowgraph but to be tracked; it is marked dontDelete (not deleted on stop).
---Source: lua/ge/extensions/flowgraph/modules/vehicleModule.lua:27
---@param veh userdata vehicle object
---@param moreData table|nil additional fields merged into the data
function flowgraph_modules_vehicleModule_C:addForeignVehicle(veh, moreData) end

--- Starts tracking a vehicle (ignored if already tracked). If the vehicle is ready, calls readyUpVehicle.
---Source: lua/ge/extensions/flowgraph/modules/vehicleModule.lua:33
---@param veh userdata vehicle object
---@param moreData table|nil additional fields (e.g. dontDelete, ignoreReadyUp)
function flowgraph_modules_vehicleModule_C:addVehicle(veh, moreData) end

--- Clears vehicles, sortedIds and couplings.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/vehicleModule.lua:16
function flowgraph_modules_vehicleModule_C:clear() end

--- Stores the gameplay_walk blacklist and the core_trailerRespawn state to restore them on stop.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/vehicleModule.lua:150
function flowgraph_modules_vehicleModule_C:executionStarted() end

--- Called when the graph stops: deletes non-dontDelete vehicles, restores the energy of the others, the walking blacklist and core_trailerRespawn, then clear().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/vehicleModule.lua:195
function flowgraph_modules_vehicleModule_C:executionStopped() end

--- Deep copy of the sorted list of tracked vehicle ids.
---Source: lua/ge/extensions/flowgraph/modules/vehicleModule.lua:22
---@return integer[]  vehicle ids
function flowgraph_modules_vehicleModule_C:getSpawnedVehicles() end

--- Returns a vehicle's tracked data, or an empty table.
---Source: lua/ge/extensions/flowgraph/modules/vehicleModule.lua:58
---@param id integer vehicle id
---@return table  vehicle data
function flowgraph_modules_vehicleModule_C:getVehicle(id) end

--- Looks up a vehicle's id by its exact internal name.
---Source: lua/ge/extensions/flowgraph/modules/vehicleModule.lua:62
---@param name string internal name
---@return integer  id, or -1 if not found
function flowgraph_modules_vehicleModule_C:getVehicleIdByInternalName(name) end

--- Returns the ids whose internal name matches the pattern (string.find, so a Lua pattern).
---Source: lua/ge/extensions/flowgraph/modules/vehicleModule.lua:71
---@param name string Lua pattern
---@return integer[]  matching ids
function flowgraph_modules_vehicleModule_C:getVehiclesIdByInternalNameMatch(name) end

--- Creates the internal tables then calls clear().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/vehicleModule.lua:8
function flowgraph_modules_vehicleModule_C:init() end

--- Indicates whether the vehicle's model has the "Bus" Body Style.
---Source: lua/ge/extensions/flowgraph/modules/vehicleModule.lua:281
---@param id integer vehicle id
---@return boolean|nil  true/false, nil if id absent
function flowgraph_modules_vehicleModule_C:isBus(id) end

--- Indicates whether the bus door is open (cached value 'dooropen' == 1).
---Source: lua/ge/extensions/flowgraph/modules/vehicleModule.lua:272
---@param id integer bus id
---@return boolean  true if open
function flowgraph_modules_vehicleModule_C:isBusDoorOpen(id) end

--- Indicates whether the bus is kneeling (cached value 'kneel' == 1).
---Source: lua/ge/extensions/flowgraph/modules/vehicleModule.lua:271
---@param id integer bus id
---@return boolean  true if kneeling
function flowgraph_modules_vehicleModule_C:isBusKneel(id) end

--- Indicates whether the vehicle is coupled to at least one other.
---Source: lua/ge/extensions/flowgraph/modules/vehicleModule.lua:243
---@param id integer vehicle id
---@return any  non-nil (truthy) value if coupled, otherwise nil
function flowgraph_modules_vehicleModule_C:isCoupled(id) end

--- Indicates whether the vehicle is coupled to the vehicle other.
---Source: lua/ge/extensions/flowgraph/modules/vehicleModule.lua:244
---@param id integer vehicle id
---@param other integer id of the other vehicle
---@return boolean|nil  true if coupled, otherwise nil
function flowgraph_modules_vehicleModule_C:isCoupledTo(id, other) end

--- Hook: records the coupling between two vehicles (in both directions).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/vehicleModule.lua:234
---@param objId1 integer first vehicle
---@param objId2 integer second vehicle
---@param nodeId integer coupler node (unused)
---@param obj2nodeId integer second vehicle's coupler node (unused)
function flowgraph_modules_vehicleModule_C:onCouplerAttached(objId1, objId2, nodeId, obj2nodeId) end

--- Hook: removes the coupling between two vehicles.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/vehicleModule.lua:238
---@param objId1 integer first vehicle
---@param objId2 integer second vehicle
---@param nodeId integer unused
---@param obj2nodeId integer unused
function flowgraph_modules_vehicleModule_C:onCouplerDetached(objId1, objId2, nodeId, obj2nodeId) end

--- Called every frame: detects vehicles that have become ready and calls readyUpVehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/vehicleModule.lua:81
function flowgraph_modules_vehicleModule_C:onUpdate() end

--- Hook called when a vehicle is reset; relays to activity:onVehicleReset(id) if the activity exists.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/vehicleModule.lua:289
---@param id integer vehicle id
function flowgraph_modules_vehicleModule_C:onVehicleResetted(id) end

--- Marks the vehicle ready; unless ignoreReadyUp, enables mapmgr tracking (via the level module, possibly deferred) and requests the coupler offsets for each tag.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/vehicleModule.lua:105
---@param id integer vehicle id
function flowgraph_modules_vehicleModule_C:readyUpVehicle(id) end

--- Asks core_vehicleBridge to be notified of changes to the vehicle's "kneel" and "dooropen".
---Source: lua/ge/extensions/flowgraph/modules/vehicleModule.lua:263
---@param id integer bus id
function flowgraph_modules_vehicleModule_C:registerBusChangeNotification(id) end

--- Does nothing: the body (sending bus_onTriggerTick) is commented out.
---Source: lua/ge/extensions/flowgraph/modules/vehicleModule.lua:247
---@param id integer vehicle id
function flowgraph_modules_vehicleModule_C:requestBusData(id) end

--- Sends the bus the bus_onSetStopRequest event (stop request).
---Source: lua/ge/extensions/flowgraph/modules/vehicleModule.lua:274
---@param id integer bus id
---@param data table stop request data
function flowgraph_modules_vehicleModule_C:requestBusStop(id, data) end

--- Sets dontDelete for a tracked vehicle; if it is in a prefab, asks the prefab module to unpack it before deletion.
---Source: lua/ge/extensions/flowgraph/modules/vehicleModule.lua:170
---@param id integer vehicle id
---@param keep boolean true to not delete it on stop
function flowgraph_modules_vehicleModule_C:setKeepVehicle(id, keep) end

--- Requests and stores the energy of the vehicle's tanks, to restore it on stop (if it is not deleted). W log if the vehicle is not tracked.
---Source: lua/ge/extensions/flowgraph/modules/vehicleModule.lua:155
---@param id integer vehicle id
function flowgraph_modules_vehicleModule_C:storeFuelAmount(id) end

--- Sends the vehicle the bus_onRouteChange event with the route display data.
---Source: lua/ge/extensions/flowgraph/modules/vehicleModule.lua:255
---@param id integer bus id
---@param data table serialized data sent to the controller
function flowgraph_modules_vehicleModule_C:updateBusDisplayData(id, data) end

