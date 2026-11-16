---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/gameplayInterface.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Generic gateway between gameplay code (GE Lua VM, via core_vehicleBridge) or other vehicle extensions and the vehicle VM. At init it loads all modules from the gameplayInterfaceModules folder, has them declare their 'actions' (commands with no direct return) and their 'lookups' (data reads), then runs numbered requests and returns the result through a registered callback. Also handles change notifications of an electrics key value. A modder uses it to drive a vehicle remotely or to add their own module (file gameplayInterfaceModules/<name>.lua).
--- Access: extension `gameplayInterface`: `extensions.load (vehicle VM)("gameplayInterface")`, then the global `gameplayInterface`
---@class gameplayInterface
gameplayInterface = {}

--- Debug callback (id 1): displays the received data via print/dump.
---Source: lua/vehicle/extensions/gameplayInterface.lua:18
---@param requestId integer Request identifier.
---@param data any Received data.
function gameplayInterface.debugCallback(requestId, data) end

--- Runs an action registered by a module; returns a result to the callback only if the action returns a value (e.g. {failReason}).
---Source: lua/vehicle/extensions/gameplayInterface.lua:102
---@param callbackId integer Callback that will receive the result.
---@param id integer Request identifier.
---@param action string Action name (e.g. 'setIgnitionLevel').
---@param ... any Parameters passed to the action as a table.
function gameplayInterface.executeAction(callbackId, id, action, ...) end

--- Runs a lookup (read) registered by a module and sends the result to the callback. If the system is unknown or the parameters invalid, sends {failReason}.
---Source: lua/vehicle/extensions/gameplayInterface.lua:70
---@param callbackId integer Callback that will receive the result.
---@param id integer Request identifier (returned as is).
---@param system string Lookup name (e.g. 'electricsValue').
---@param ... any Parameters passed to the lookup as a table.
function gameplayInterface.getSystemData(callbackId, id, system, ...) end

--- Called when the extension loads: walks through lua/vehicle/extensions/gameplayInterfaceModules, loads each module, calls requestRegistration(M) then unloads it if it was not already loaded; reinitializes the callbacks table (id 0 = GE Lua, id 1 = debug).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/gameplayInterface.lua:195
function gameplayInterface.onExtensionLoaded() end

--- Vehicle initialization hook; empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/gameplayInterface.lua:192
function gameplayInterface.onInit() end

--- Called at vehicle reset: forgets the last known value of the change notifications.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/gameplayInterface.lua:186
function gameplayInterface.onReset() end

--- Registers a response callback and immediately returns its identifier to the requester (request -1 with {callbackId}).
---Source: lua/vehicle/extensions/gameplayInterface.lua:165
---@param vm string 'gelua' (callback = GE Lua function name as text) or 'vlua' (callback = local function).
---@param callback string|function GE function name or function(requestId, data) depending on vm.
function gameplayInterface.registerCallback(vm, callback) end

--- Registers a module: associates each action and lookup name with the module name, with duplicate detection. Called by module.requestRegistration(gi).
---Source: lua/vehicle/extensions/gameplayInterface.lua:171
---@param name string Module name (file name without extension).
---@param actions table<string, function> moduleActions table of the module.
---@param lookups table<string, function> moduleLookups table of the module.
function gameplayInterface.registerModule(name, actions, lookups) end

--- Asks to be notified (via callbackId, request id -2, data {[key] = value}) at each change of electrics.values[electricsKey]. Confirms with {registerResult = true}.
---Source: lua/vehicle/extensions/gameplayInterface.lua:133
---@param callbackId integer Callback to call.
---@param id integer Identifier of the registration request.
---@param electricsKey string Key of electrics.values to watch.
function gameplayInterface.registerValueChangeNotification(callbackId, id, electricsKey) end

--- Manually triggers a registered change notification (by its index) with arbitrary data: the callback receives {data, valueChangeNotificationId}.
---Source: lua/vehicle/extensions/gameplayInterface.lua:159
---@param valueChangeNotificationId integer Index in the list of registered notifications.
---@param data any Data to pass on.
function gameplayInterface.triggerValueChangeNotification(valueChangeNotificationId, data) end

--- Removes the first notification matching (callbackId, electricsKey); stops watching when none remain.
---Source: lua/vehicle/extensions/gameplayInterface.lua:141
---@param callbackId integer Registered callback.
---@param electricsKey string Watched key.
function gameplayInterface.unregisterValueChangeNotification(callbackId, electricsKey) end

--- Called every frame: runs the value change notification check if at least one is registered.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/gameplayInterface.lua:60
---@param dt number Time step in seconds.
function gameplayInterface.updateGFX(dt) end

