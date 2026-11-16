---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/vehicleBridge.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_vehicleBridge`: communication bridge between GE Lua and vehicle Lua (vlua). Sends commands to `extensions.gameplayInterface` on the vehicle side to read a value (requestValue), execute an action (executeAction) or subscribe to changes of an electrics key (registerValueChangeNotification), and receives the replies through callbackFromVlua. Values received through subscription are cached in `vehicleData[vehId].data`.
--- Access: extension `core_vehicleBridge`: `extensions.load("core_vehicleBridge")`, then the global `core_vehicleBridge`
---@class core_vehicleBridge
---@field logCommand function Function called before each send (detailed log); `nop` by default, logCommandFunction if setLogCommands(true).
---@field vehicleData table<integer, {data: table, registeredCallbacks: table<string, integer>}> [vehId] = {data = latest values received per key, registeredCallbacks = [key] = callbackId}. Cleared for a destroyed or replaced vehicle.
core_vehicleBridge = {}

--- Called from the vehicle's Lua with the response to a request or a notification. Decodes the data, updates the cache (id -2) or calls the registered callback then forgets it.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicleBridge.lua:37
---@param vehId integer emitting vehicle
---@param callbackId integer callback identifier, or -2 for a value change notification
---@param data string data encoded by lpack
function core_vehicleBridge.callbackFromVlua(vehId, callbackId, data) end

--- Executes an action on the vehicle side (extensions.gameplayInterface.executeAction). Checks that veh exists and has queueLuaCommand.
---Source: lua/ge/extensions/core/vehicleBridge.lua:119
---@param veh userdata target vehicle
---@param ... any arguments (action name and parameters), serialized
function core_vehicleBridge.executeAction(veh, ...) end

--- Reads a value cached by a change notification.
---Source: lua/ge/extensions/core/vehicleBridge.lua:143
---@param vehId integer vehicle identifier
---@param key string key
---@return any  last value received, nil if unknown
function core_vehicleBridge.getCachedVehicleData(vehId, key) end

--- Logs (level D) the command sent to a vehicle.
---Source: lua/ge/extensions/core/vehicleBridge.lua:14
---@param veh userdata destination vehicle
---@param id integer callback identifier
---@param command any command (string or buffer)
function core_vehicleBridge.logCommandFunction(veh, id, command) end

--- Hook: a vehicle is destroyed; clears its cache and subscriptions.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicleBridge.lua:154
---@param id integer vehicle identifier
function core_vehicleBridge.onVehicleDestroyed(id) end

--- Hook (emitted by core_vehicles.replaceVehicle): the vehicle was replaced; clears its cache and subscriptions (the new vehicle Lua must resubscribe).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicleBridge.lua:155
---@param id integer vehicle identifier
function core_vehicleBridge.onVehicleReplaced(id) end

--- Subscribes GE to changes of an electrics key of the vehicle: on each change, the value is updated in vehicleData[vehId].data[key]. No effect if already subscribed to this key.
---Source: lua/ge/extensions/core/vehicleBridge.lua:73
---@param veh userdata vehicle
---@param electricsKey string key of the electrics table
function core_vehicleBridge.registerValueChangeNotification(veh, electricsKey) end

--- Requests a value from the vehicle (extensions.gameplayInterface.getSystemData on the vehicle side). The callback receives the decoded data asynchronously (at the earliest on the next frame).
---Source: lua/ge/extensions/core/vehicleBridge.lua:53
---@param veh userdata vehicle queried (error log if nil)
---@param callback function function(data) called with the response
---@param ... any extra arguments, serialized and passed to getSystemData
function core_vehicleBridge.requestValue(veh, callback, ...) end

--- Enables or disables logging of all commands sent to vehicles.
---Source: lua/ge/extensions/core/vehicleBridge.lua:18
---@param enabled boolean true to enable
function core_vehicleBridge.setLogCommands(enabled) end

--- Cancels the subscription created by registerValueChangeNotification (no effect if it does not exist).
---Source: lua/ge/extensions/core/vehicleBridge.lua:98
---@param veh userdata vehicle
---@param electricsKey string key of the electrics table
function core_vehicleBridge.unregisterValueChangeNotification(veh, electricsKey) end

