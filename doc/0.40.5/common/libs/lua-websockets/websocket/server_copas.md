# `libs_lua_websockets_websocket_server_copas`

*File: `lua/common/libs/lua-websockets/websocket/server_copas.lua` · VM: Common (GE + vehicle) · 149 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/lua-websockets/websocket/server_copas")`

WebSocket server backend of lua-websockets for the cooperative 'copas' library. listen opens a luasocket server socket, performs the handshake for each incoming connection and calls the handler of the negotiated subprotocol (or the default handler) with a client object.

## Example

```lua
local srv = require('libs/lua-websockets/websocket/server_copas').listen({
  port = 8080,
  default = function(client)
    local msg, opcode = client:receive()
    client:send(msg)
  end
})
```

## Notes

- Requires libs/copas/copas; the copas loop must be run to process the connections.
- The default handler is indexed by the magic key true in the internal clients table.

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_lua_websockets_websocket_server_copas.listen(opts)` | Starts a WebSocket server. Raises an error if the socket cannot be opened. Each accepted client is registered and passed to the handler, then the coroutine stays alive as long as client.state is not 'CLOSED'. | 52 |

### Parameter details

#### `libs_lua_websockets_websocket_server_copas.listen(opts)`

Starts a WebSocket server. Raises an error if the socket cannot be opened. Each accepted client is registered and passed to the handler, then the coroutine stays alive as long as client.state is not 'CLOSED'.

- `opts` (*table*) : port (default 80), interface (default '*'), protocols (table subprotocol -> function(client)), default (function(client) for the other cases), on_error (function(message), default print). protocols or default is required.
- **returns**: table Object with the method close(_, keep_clients) that removes the server from copas and, unless keep_clients, closes the clients.

## Class `client`

Client object passed to the handler (state 'OPEN', is_server = true). Inherits from websocket/sync (send, receive, close).

| Method | Description | Line |
|---|---|---|
| `client:broadcast(...)` | Sends the message to all the clients of the same subprotocol, then to itself. | dyn |
| `client:on_close()` | Called on close: removes the client from the subprotocol's list. | dyn |
| `client:sock_close()` | Shutdown then closing the socket. | dyn |
| `client:sock_receive()` | Read via copas.receive. | dyn |
| `client:sock_send()` | Send via copas.send. | dyn |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/lua-websockets/websocket/server_copas.lua`.*
