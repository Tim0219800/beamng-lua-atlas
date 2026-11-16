# `libs_lua_websockets_websocket_client_copas`

*File: `lua/common/libs/lua-websockets/websocket/client_copas.lua` · VM: Common (GE + vehicle) · 45 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/lua-websockets/websocket/client_copas")`

WebSocket client backend of lua-websockets for the cooperative 'copas' library (non-blocking sockets in coroutines). The module returns a constructor function; the returned object is extended by websocket/sync (connect, send, receive, close methods).

## Example

```lua
local newClient = require('libs/lua-websockets/websocket/client_copas')
local ws = newClient({timeout = 2})
-- to be called in a copas coroutine:
ws:connect('ws://127.0.0.1:8080', 'proto')
```

## Notes

- Requires libs/copas/copas and libs/luasocket/socket.socket.
- I/O goes through copas.connect/send/receive/dohandshake, so calls must be made from a coroutine managed by copas.

## Class `client`

Object returned by the constructor new(ws). ws is an optional options table (timeout field in seconds). The connect/send/receive/close methods come from websocket/sync; the sock_* methods below provide the transport.

| Method | Description | Line |
|---|---|---|
| `client:dohandshake()` | Delegates to copas.dohandshake (TLS negotiation) on the socket. | dyn |
| `client:sock_close()` | Closes the socket. | dyn |
| `client:sock_connect(host, port)` | Creates a TCP socket (luasocket), applies ws.timeout and connects via copas.connect. Returns nil and the error on failure (except 'already connected'). | dyn |
| `client:sock_receive()` | Reads data via copas.receive on the socket. | dyn |
| `client:sock_send()` | Sends data via copas.send on the socket. | dyn |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/lua-websockets/websocket/client_copas.lua`.*
