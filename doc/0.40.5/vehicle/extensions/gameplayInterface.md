# `gameplayInterface`

*File: `lua/vehicle/extensions/gameplayInterface.lua` · VM: Vehicle · 241 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplayInterface`: `extensions.load (vehicle VM)("gameplayInterface")`, then the global `gameplayInterface`

Generic gateway between gameplay code (GE Lua VM, via core_vehicleBridge) or other vehicle extensions and the vehicle VM. At init it loads all modules from the gameplayInterfaceModules folder, has them declare their 'actions' (commands with no direct return) and their 'lookups' (data reads), then runs numbered requests and returns the result through a registered callback. Also handles change notifications of an electrics key value. A modder uses it to drive a vehicle remotely or to add their own module (file gameplayInterfaceModules/<name>.lua).

## Example

```lua
-- In a gameplayInterfaceModules/myModule.lua module
M.moduleActions.myAction = function(params) ... end
M.moduleLookups.myLookup = function(params) return {result = 42} end
function M.requestRegistration(gi) gi.registerModule('myModule', M.moduleActions, M.moduleLookups) end
-- Call on the vehicle side
gameplayInterface.getSystemData(0, 1, 'electricsValue', 'rpm')
```

## Notes

- Protocol: each request has a callback identifier (callbackId), a request id (id) and the name of the system (lookup) or of the action. The result is sent via triggerCallback(callbackId, id, result). If an action returns nothing (nil), no callback is emitted.
- Parameters are passed to the module as a `params` table (variadic arguments). Modules check types with checkTableDataTypes and return {failReason = ...} on error.
- Callbacks: id 0 is reserved for GE Lua (extensions.core_vehicleBridge.callbackFromVlua), id 1 for debugCallback (print + dump). registerCallback adds a callback ({vm = 'gelua'|'vlua', callback = name or function}) and returns its id to the requester via request -1 ({callbackId = ...}). Value change notifications use request id -2. For vm = 'gelua', callback is the name of a GE Lua function called with (objectId, requestId, lpack-encoded data).
- Modules are loaded (if needed) on the fly at the first request concerning them (ensureExtensionModuleLoaded); at startup, they are loaded then unloaded right after requestRegistration to register their action/lookup names.
- Action and lookup names must be unique across modules; a duplicate writes a 'duplicate action/lookup' message and the last registered module wins.
- Value change notifications: registerValueChangeNotification watches electrics.values[electricsKey] and triggers the callback as soon as the value changes (nil value ignored). The last value is reset at onReset.
- Anomaly: getSystemData/executeAction build their error messages with string.format('%d', id); if id is nil the call raises a Lua error instead of returning failReason.
- Anomaly: onExtensionLoaded reinitializes the callbacks table with indices 0 and 1; callbacks registered before that moment would be lost.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplayInterface.debugCallback(requestId, data)` | Debug callback (id 1): displays the received data via print/dump. | 18 |
| `gameplayInterface.executeAction(callbackId, id, action, ...)` | Runs an action registered by a module; returns a result to the callback only if the action returns a value (e.g. {failReason}). | 102 |
| `gameplayInterface.getSystemData(callbackId, id, system, ...)` | Runs a lookup (read) registered by a module and sends the result to the callback. If the system is unknown or the parameters invalid, sends {failReason}. | 70 |
| `gameplayInterface.onExtensionLoaded()` | Called when the extension loads: walks through lua/vehicle/extensions/gameplayInterfaceModules, loads each module, calls requestRegistration(M) then unloads it if it was not already loaded; reinitializes the callbacks table (id 0 = GE Lua, id 1 = debug). *(internal)* *(hook)* | 195 |
| `gameplayInterface.onInit()` | Vehicle initialization hook; empty. *(internal)* *(hook)* | 192 |
| `gameplayInterface.onReset()` | Called at vehicle reset: forgets the last known value of the change notifications. *(internal)* *(hook)* | 186 |
| `gameplayInterface.registerCallback(vm, callback)` | Registers a response callback and immediately returns its identifier to the requester (request -1 with {callbackId}). | 165 |
| `gameplayInterface.registerModule(name, actions, lookups)` | Registers a module: associates each action and lookup name with the module name, with duplicate detection. Called by module.requestRegistration(gi). | 171 |
| `gameplayInterface.registerValueChangeNotification(callbackId, id, electricsKey)` | Asks to be notified (via callbackId, request id -2, data {[key] = value}) at each change of electrics.values[electricsKey]. Confirms with {registerResult = true}. | 133 |
| `gameplayInterface.triggerValueChangeNotification(valueChangeNotificationId, data)` | Manually triggers a registered change notification (by its index) with arbitrary data: the callback receives {data, valueChangeNotificationId}. | 159 |
| `gameplayInterface.unregisterValueChangeNotification(callbackId, electricsKey)` | Removes the first notification matching (callbackId, electricsKey); stops watching when none remain. | 141 |
| `gameplayInterface.updateGFX(dt)` | Called every frame: runs the value change notification check if at least one is registered. *(internal)* | 60 |

### Parameter details

#### `gameplayInterface.debugCallback(requestId, data)`

Debug callback (id 1): displays the received data via print/dump.

- `requestId` (*integer*) : Request identifier.
- `data` (*any*) : Received data.

#### `gameplayInterface.executeAction(callbackId, id, action, ...)`

Runs an action registered by a module; returns a result to the callback only if the action returns a value (e.g. {failReason}).

- `callbackId` (*integer*) : Callback that will receive the result.
- `id` (*integer*) : Request identifier.
- `action` (*string*) : Action name (e.g. 'setIgnitionLevel').
- `...` (*any*) : Parameters passed to the action as a table.

#### `gameplayInterface.getSystemData(callbackId, id, system, ...)`

Runs a lookup (read) registered by a module and sends the result to the callback. If the system is unknown or the parameters invalid, sends {failReason}.

- `callbackId` (*integer*) : Callback that will receive the result.
- `id` (*integer*) : Request identifier (returned as is).
- `system` (*string*) : Lookup name (e.g. 'electricsValue').
- `...` (*any*) : Parameters passed to the lookup as a table.

#### `gameplayInterface.registerCallback(vm, callback)`

Registers a response callback and immediately returns its identifier to the requester (request -1 with {callbackId}).

- `vm` (*string*) : 'gelua' (callback = GE Lua function name as text) or 'vlua' (callback = local function).
- `callback` (*string|function*) : GE function name or function(requestId, data) depending on vm.

#### `gameplayInterface.registerModule(name, actions, lookups)`

Registers a module: associates each action and lookup name with the module name, with duplicate detection. Called by module.requestRegistration(gi).

- `name` (*string*) : Module name (file name without extension).
- `actions` (*table<string, function>*) : moduleActions table of the module.
- `lookups` (*table<string, function>*) : moduleLookups table of the module.

#### `gameplayInterface.registerValueChangeNotification(callbackId, id, electricsKey)`

Asks to be notified (via callbackId, request id -2, data {[key] = value}) at each change of electrics.values[electricsKey]. Confirms with {registerResult = true}.

- `callbackId` (*integer*) : Callback to call.
- `id` (*integer*) : Identifier of the registration request.
- `electricsKey` (*string*) : Key of electrics.values to watch.

#### `gameplayInterface.triggerValueChangeNotification(valueChangeNotificationId, data)`

Manually triggers a registered change notification (by its index) with arbitrary data: the callback receives {data, valueChangeNotificationId}.

- `valueChangeNotificationId` (*integer*) : Index in the list of registered notifications.
- `data` (*any*) : Data to pass on.

#### `gameplayInterface.unregisterValueChangeNotification(callbackId, electricsKey)`

Removes the first notification matching (callbackId, electricsKey); stops watching when none remain.

- `callbackId` (*integer*) : Registered callback.
- `electricsKey` (*string*) : Watched key.

#### `gameplayInterface.updateGFX(dt)`

Called every frame: runs the value change notification check if at least one is registered.

- `dt` (*number*) : Time step in seconds.

## Calls into the engine (C++)

- `FS:` `findFiles`
- `obj:` `queueGameEngineLua`

**Loads extensions:** `gameplayInterfaceModules/`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/gameplayInterface.lua`.*
