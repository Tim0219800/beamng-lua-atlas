# `libs_lua_websockets_websocket_server_ev`

*File: `lua/common/libs/lua-websockets/websocket/server_ev.lua` · VM: Common (GE + vehicle) · 267 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/lua-websockets/websocket/server_ev")`

WebSocket server backend of lua-websockets for the lua-ev event loop ('ev' module, not provided by the game). listen accepts connections asynchronously, performs the handshake, then creates a callback-driven client object (on_message, on_close, on_error).

## Example

```lua
local srv = require('libs/lua-websockets/websocket/server_ev').listen({
  port = 8080,
  default = function(client)
    client:on_message(function(c, msg, opcode) c:send(msg) end)
  end
})
```

## Notes

- Requires the 'ev' module (lua-ev); without it the require fails. Probably not used in the game (inferred from code).
- Several error messages are displayed with print() rather than passed up to the callback.

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_lua_websockets_websocket_server_ev.listen(opts)` | Starts an asynchronous WebSocket server on the ev loop. Raises an error if the bind fails. | 142 |

### Parameter details

#### `libs_lua_websockets_websocket_server_ev.listen(opts)`

Starts an asynchronous WebSocket server on the ev loop. Raises an error if the bind fails.

- `opts` (*table*) : port (default 80), interface (default '*'), loop (default ev.Loop.default), protocols (subprotocol -> function(client)), default (function(client)). protocols or default is required.
- **returns**: table Server object: on_error(self, f), sock() (listening socket), close(keep_clients).

## Class `client`

Client object passed to the handler (state 'OPEN'). Callbacks are set with the on_* methods.

| Method | Description | Line |
|---|---|---|
| `client:broadcast(...)` | Sends to all the clients of the same subprotocol. | dyn |
| `client:close(code, reason, timeout)` | Closes the connection cleanly (CLOSE frame) with an expiry timeout. | dyn |
| `client:on_close(on_close)` | Sets the close callback. | dyn |
| `client:on_error(on_error)` | Sets the error callback. | dyn |
| `client:on_message(on_message)` | Sets the receive callback. | dyn |
| `client:send(message, opcode)` | Sends a message asynchronously (write buffer). | dyn |
| `client:start()` | Starts asynchronous reading of the messages; called by listen after the handler is called. | dyn |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/lua-websockets/websocket/server_ev.lua`.*
