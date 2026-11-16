# `libs_lua_websockets_websocket_client_ev`

*File: `lua/common/libs/lua-websockets/websocket/client_ev.lua` · VM: Common (GE + vehicle) · 252 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/lua-websockets/websocket/client_ev")`

Asynchronous WebSocket client backend of lua-websockets for the lua-ev event loop ('ev' module, not provided by the game). The module returns a constructor function; the object works through callbacks (on_open, on_message, on_error, on_close) and handles non-blocking connection, handshake and close with a timeout.

## Example

```lua
local newClient = require('libs/lua-websockets/websocket/client_ev')
local ws = newClient()
ws:on_open(function() ws:send('hello') end)
ws:on_message(function(_, msg, opcode) end)
ws:connect('ws://127.0.0.1:8080', 'proto')
```

## Notes

- Requires the 'ev' module (lua-ev); probably not used in the game (inferred from code).

## Class `client`

Object returned by the constructor new(ws). ws is an optional options table (loop: ev loop, default ev.Loop.default). self.state is 'CLOSED', 'CONNECTING', 'OPEN' or 'CLOSING'.

| Method | Description | Line |
|---|---|---|
| `client:close(code, reason, timeout)` | Closes the connection: cancels the connection in progress or sends a CLOSE frame then waits for the echo until the timeout (3 s by default), otherwise closes with code 1006 'timeout'. | dyn |
| `client:connect(url, ws_protocol, options)` | Starts an asynchronous connection, then the WebSocket handshake. | dyn |
| `client:on_close(f)` | Sets the close callback. | dyn |
| `client:on_error(f)` | Sets the error callback. | dyn |
| `client:on_message(f)` | Sets the receive callback. | dyn |
| `client:on_open(f)` | Sets the callback called when the connection is open. | dyn |
| `client:send(message, opcode)` | Sends a message (frame masked on the client side). | dyn |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/lua-websockets/websocket/client_ev.lua`.*
