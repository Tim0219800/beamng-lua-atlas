# `libs_luamqtt_mqtt_ioloop`

*File: `lua/common/libs/luamqtt/mqtt/ioloop.lua` · VM: Common (GE + vehicle) · 181 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/luamqtt/mqtt/ioloop")`

luamqtt I/O loop: runs several MQTT clients (and user functions) in the same thread, in non-blocking mode with a small network timeout, which enables keep_alive PINGREQs and reconnection. Only works with the standard luasocket connectors.

## Example

```lua
local ioloop = require('libs/luamqtt/mqtt/ioloop')
local loop = ioloop.get()
loop:add(client)
client:start_connecting()
-- in the game's own loop:
loop:iteration()
```

## Notes

- run_until_clients is blocking; in the game, call iteration() periodically instead (e.g. from onUpdate) so as not to freeze the thread.

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_luamqtt_mqtt_ioloop.create(args)` | Creates an ioloop instance. | 149 |
| `libs_luamqtt_mqtt_ioloop.get(autocreate, args)` | Returns the default ioloop (singleton), created on demand. | 163 |

### Parameter details

#### `libs_luamqtt_mqtt_ioloop.create(args)`

Creates an ioloop instance.

- `args` (*table*) : timeout (default 0.005 s), sleep (default 0), sleep_function.
- **returns**: table ioloop_mt instance.

#### `libs_luamqtt_mqtt_ioloop.get(autocreate, args)`

Returns the default ioloop (singleton), created on demand.

- `autocreate` (*boolean*) : Create automatically (default true).
- `args` (*table*) : Creation arguments.
- **returns**: table|nil ioloop instance.

## Class `ioloop_mt`

ioloop instance returned by create/get.

| Method | Description | Line |
|---|---|---|
| `ioloop_mt:__init(args)` | Initializes the instance with timeout, sleep and sleep_function (default socket.sleep). | 53 |
| `ioloop_mt:add(client)` | Adds an MQTT client or a loop function. For a client, calls client:set_ioloop(self) to associate it with the loop. | 66 |
| `ioloop_mt:can_sleep()` | If no network timeout has occurred yet during the iteration, calls sleep_function(args.timeout) once (socket.sleep by default) so as not to spin idle. | 127 |
| `ioloop_mt:iteration()` | Performs one iteration: calls _ioloop_iteration of each client and each added function, then sleeps args.sleep seconds if sleep > 0. | 109 |
| `ioloop_mt:remove(client)` | Removes a client or a function from the ioloop. | 85 |
| `ioloop_mt:run_until_clients()` | Blocking loop: iterates as long as at least one client remains in the ioloop. | 136 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/luamqtt/mqtt/ioloop.lua`.*
