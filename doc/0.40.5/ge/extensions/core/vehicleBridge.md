# `core_vehicleBridge`

*File: `lua/ge/extensions/core/vehicleBridge.lua` · VM: Game Engine (GE) · 156 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_vehicleBridge`: `extensions.load("core_vehicleBridge")`, then the global `core_vehicleBridge`

GE extension `core_vehicleBridge`: communication bridge between GE Lua and vehicle Lua (vlua). Sends commands to `extensions.gameplayInterface` on the vehicle side to read a value (requestValue), execute an action (executeAction) or subscribe to changes of an electrics key (registerValueChangeNotification), and receives the replies through callbackFromVlua. Values received through subscription are cached in `vehicleData[vehId].data`.

## Example

```lua
local veh = getPlayerVehicle(0)
core_vehicleBridge.requestValue(veh, function(data) dump(data) end, 'electrics')  -- arguments passed to gameplayInterface.getSystemData
core_vehicleBridge.registerValueChangeNotification(veh, 'ignitionLevel')
-- later:
local v = core_vehicleBridge.getCachedVehicleData(veh:getId(), 'ignitionLevel')
```

## Notes

- The extra arguments (`...`) of requestValue and executeAction are serialized with serialize() into the command string sent to the vehicle; their meaning depends on gameplayInterface.lua on the vehicle side.
- Callback id -2 is reserved for value change notifications; the other ids are unique and single-use (the callback function is deleted after the call).
- callbackFromVlua decodes data with lpack.decode; if data.failReason is present, an error is logged but the callback is still called.
- The logCommand field equals `nop` (global empty game function) or logCommandFunction depending on setLogCommands; the automatic analysis reports it as an undefined reference, which is a false alarm.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_vehicleBridge.callbackFromVlua(vehId, callbackId, data)` | Called from the vehicle's Lua with the response to a request or a notification. Decodes the data, updates the cache (id -2) or calls the registered callback then forgets it. *(internal)* | 37 |
| `core_vehicleBridge.executeAction(veh, ...)` | Executes an action on the vehicle side (extensions.gameplayInterface.executeAction). Checks that veh exists and has queueLuaCommand. | 119 |
| `core_vehicleBridge.getCachedVehicleData(vehId, key)` | Reads a value cached by a change notification. | 143 |
| `core_vehicleBridge.logCommandFunction(veh, id, command)` | Logs (level D) the command sent to a vehicle. | 14 |
| `core_vehicleBridge.onVehicleDestroyed(id)` | Hook: a vehicle is destroyed; clears its cache and subscriptions. *(internal)* *(hook)* | 154 |
| `core_vehicleBridge.onVehicleReplaced(id)` | Hook (emitted by core_vehicles.replaceVehicle): the vehicle was replaced; clears its cache and subscriptions (the new vehicle Lua must resubscribe). *(internal)* *(hook)* | 155 |
| `core_vehicleBridge.registerValueChangeNotification(veh, electricsKey)` | Subscribes GE to changes of an electrics key of the vehicle: on each change, the value is updated in vehicleData[vehId].data[key]. No effect if already subscribed to this key. | 73 |
| `core_vehicleBridge.requestValue(veh, callback, ...)` | Requests a value from the vehicle (extensions.gameplayInterface.getSystemData on the vehicle side). The callback receives the decoded data asynchronously (at the earliest on the next frame). | 53 |
| `core_vehicleBridge.setLogCommands(enabled)` | Enables or disables logging of all commands sent to vehicles. | 18 |
| `core_vehicleBridge.unregisterValueChangeNotification(veh, electricsKey)` | Cancels the subscription created by registerValueChangeNotification (no effect if it does not exist). | 98 |

### Parameter details

#### `core_vehicleBridge.callbackFromVlua(vehId, callbackId, data)`

Called from the vehicle's Lua with the response to a request or a notification. Decodes the data, updates the cache (id -2) or calls the registered callback then forgets it.

- `vehId` (*integer*) : emitting vehicle
- `callbackId` (*integer*) : callback identifier, or -2 for a value change notification
- `data` (*string*) : data encoded by lpack

#### `core_vehicleBridge.executeAction(veh, ...)`

Executes an action on the vehicle side (extensions.gameplayInterface.executeAction). Checks that veh exists and has queueLuaCommand.

- `veh` (*userdata*) : target vehicle
- `...` (*any*) : arguments (action name and parameters), serialized

#### `core_vehicleBridge.getCachedVehicleData(vehId, key)`

Reads a value cached by a change notification.

- `vehId` (*integer*) : vehicle identifier
- `key` (*string*) : key
- **returns**: any last value received, nil if unknown

#### `core_vehicleBridge.logCommandFunction(veh, id, command)`

Logs (level D) the command sent to a vehicle.

- `veh` (*userdata*) : destination vehicle
- `id` (*integer*) : callback identifier
- `command` (*any*) : command (string or buffer)

#### `core_vehicleBridge.onVehicleDestroyed(id)`

Hook: a vehicle is destroyed; clears its cache and subscriptions.

- `id` (*integer*) : vehicle identifier

#### `core_vehicleBridge.onVehicleReplaced(id)`

Hook (emitted by core_vehicles.replaceVehicle): the vehicle was replaced; clears its cache and subscriptions (the new vehicle Lua must resubscribe).

- `id` (*integer*) : vehicle identifier

#### `core_vehicleBridge.registerValueChangeNotification(veh, electricsKey)`

Subscribes GE to changes of an electrics key of the vehicle: on each change, the value is updated in vehicleData[vehId].data[key]. No effect if already subscribed to this key.

- `veh` (*userdata*) : vehicle
- `electricsKey` (*string*) : key of the electrics table

#### `core_vehicleBridge.requestValue(veh, callback, ...)`

Requests a value from the vehicle (extensions.gameplayInterface.getSystemData on the vehicle side). The callback receives the decoded data asynchronously (at the earliest on the next frame).

- `veh` (*userdata*) : vehicle queried (error log if nil)
- `callback` (*function*) : function(data) called with the response
- `...` (*any*) : extra arguments, serialized and passed to getSystemData

#### `core_vehicleBridge.setLogCommands(enabled)`

Enables or disables logging of all commands sent to vehicles.

- `enabled` (*boolean*) : true to enable

#### `core_vehicleBridge.unregisterValueChangeNotification(veh, electricsKey)`

Cancels the subscription created by registerValueChangeNotification (no effect if it does not exist).

- `veh` (*userdata*) : vehicle
- `electricsKey` (*string*) : key of the electrics table

## Fields

| Field | Type | Description |
|---|---|---|
| `logCommand` | function | Function called before each send (detailed log); `nop` by default, logCommandFunction if setLogCommands(true). |
| `vehicleData` | table<integer, {data: table, registeredCallbacks: table<string, integer>}> | [vehId] = {data = latest values received per key, registeredCallbacks = [key] = callbackId}. Cleared for a destroyed or replaced vehicle. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/vehicleBridge.lua`.*
