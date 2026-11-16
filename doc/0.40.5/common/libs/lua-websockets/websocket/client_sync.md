# `libs_lua_websockets_websocket_client_sync`

*File: `lua/common/libs/lua-websockets/websocket/client_sync.lua` · VM: Common (GE + vehicle) · 46 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/lua-websockets/websocket/client_sync")`

Synchronous (blocking) WebSocket client backend of lua-websockets, based on luasocket. The module returns a constructor function (also accessible via websocket.client.new). The object is extended by websocket/sync, which gives it connect, send, receive and close. To be used for a simple WebSocket client in a game Lua script.

## Example

```lua
local newClient = require('libs/lua-websockets/websocket/client_sync')
local ws = newClient({timeout = 1})
local ok, protocol = ws:connect('ws://127.0.0.1:8080', 'echo')
if ok then ws:send('hello'); local msg, opcode = ws:receive() end
```

## Notes

- Bug/limitation: the local variable ssl is set to nil (the luasec require is commented out). dohandshake calls ssl.wrap, so a 'wss://' URL causes a Lua error.
- Calls are blocking (optional timeout via ws.timeout).

## Class `client`

Object returned by the constructor new(ws). ws is an optional options table (timeout in seconds). connect/send/receive/close come from websocket/sync.

| Method | Description | Line |
|---|---|---|
| `client:dohandshake(ssl_params)` | Wraps the socket with ssl.wrap then starts the TLS negotiation. Unusable in practice because ssl is nil. | dyn |
| `client:sock_close()` | Closes the socket. | dyn |
| `client:sock_connect(host, port)` | Creates a luasocket TCP socket, applies ws.timeout and connects. Returns nil and the error on failure. | dyn |
| `client:sock_receive()` | Reads data on the socket (luasocket receive). | dyn |
| `client:sock_send()` | Sends data on the socket (luasocket send). | dyn |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/lua-websockets/websocket/client_sync.lua`.*
