# `luamqtt_VERSION`

*File: `lua/common/libs/luamqtt/mqtt/init.lua` · VM: Common (GE + vehicle) · 88 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `luamqtt_VERSION`

Entry point of the third-party luamqtt library (xHasKx, version 3.4.3 according to the _VERSION field), a pure-Lua MQTT 3.1.1 and 5.0 client. The module returns the 'mqtt' table with the version constants, client creation, and run loops (shared or synchronous ioloop). Useful to a modder who wants to exchange with an MQTT broker from the game.

## Example

```lua
local mqtt = require('libs/luamqtt/mqtt/init')
local cl = mqtt.client({uri = '127.0.0.1:1883', clean = true})
cl:on({connect = function(pkt) cl:subscribe({topic = 'beamng/#', qos = 0}) end,
       message = function(msg) log('I','mqtt',msg.topic..' '..tostring(msg.payload)) end})
mqtt.run_ioloop(cl)
```

## Notes

- The module also sets a global luamqtt_VERSION, read by client_mt:__init (the auto page lists it as the module name).
- Library convention: an argument of the wrong type raises an exception; other errors are returned as false, 'text'.
- run_ioloop and run_sync are blocking: in the game, prefer driving the client from your own loop (see ioloop_mt:iteration / client_mt:_sync_iteration) so as not to freeze the thread.
- The luasocket connector requires the 'socket' module (bare name); the game's libs/luasocket folder exposes this module.

## Functions

| Function | Description | Line |
|---|---|---|
| `luamqtt_VERSION.client(...)` | Creates an MQTT client (equivalent to mqtt.client.create). | 43 |
| `luamqtt_VERSION.run_ioloop(...)` | Adds the clients (or loop functions) to the default ioloop, calls start_connecting() on each client, then runs the ioloop as long as at least one client remains. | 55 |
| `luamqtt_VERSION.run_sync(cl)` | Synchronous loop for a single client: opens the connection then iterates as long as cl.connection exists. No reconnection nor keep_alive. | 71 |

### Parameter details

#### `luamqtt_VERSION.client(...)`

Creates an MQTT client (equivalent to mqtt.client.create).

- `...` (*table*) : Argument table of client_mt:__init (uri, clean, version, id, username, password, secure, will, keep_alive, reconnect, connector, ssl_module).
- **returns**: table MQTT client instance.

#### `luamqtt_VERSION.run_ioloop(...)`

Adds the clients (or loop functions) to the default ioloop, calls start_connecting() on each client, then runs the ioloop as long as at least one client remains.

- `...` (*table|function*) : MQTT clients or functions called on each iteration.

#### `luamqtt_VERSION.run_sync(cl)`

Synchronous loop for a single client: opens the connection then iterates as long as cl.connection exists. No reconnection nor keep_alive.

- `cl` (*table*) : MQTT client.
- **returns**: boolean|nil false and the error message on failure.

## Fields

| Field | Type | Description |
|---|---|---|
| `get_ioloop` | function | Alias of ioloop.get: returns the default ioloop instance (created if needed). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/luamqtt/mqtt/init.lua`.*
