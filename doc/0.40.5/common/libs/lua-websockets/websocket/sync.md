# `libs_lua_websockets_websocket_sync`

*File: `lua/common/libs/lua-websockets/websocket/sync.lua` · VM: Common (GE + vehicle) · 216 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/lua-websockets/websocket/sync")`

Synchronous core of lua-websockets: extend(obj) adds to an object having sock_send, sock_receive, sock_close (and sock_connect on the client side) the methods connect, send, receive and close. Handles the handshake, reassembly of fragmented messages, automatic reply to PINGs (client) and clean closing. Used by client_sync, client_copas and server_copas.

## Notes

- extend raises an assertion if the object already has receive, send, close, connect or is_closing.
- receive returns (nil, nil, was_clean, code, reason) on close; otherwise (message, opcode).
- In receive, the error message 'frame was not masked' is emitted when a frame received on the client side IS masked (message inverted relative to the condition).
- For 'wss', connect calls self:dohandshake; with client_sync, ssl is nil so this fails.

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_lua_websockets_websocket_sync.extend(obj)` | Adds the WebSocket methods to obj and initializes obj.state to 'CLOSED' if absent. | 186 |

### Parameter details

#### `libs_lua_websockets_websocket_sync.extend(obj)`

Adds the WebSocket methods to obj and initializes obj.state to 'CLOSED' if absent.

- `obj` (*table*) : Object with sock_send, sock_receive, sock_close (and sock_connect if it is not a server).
- **returns**: table The same object, extended.

## Class `obj`

Object extended by extend. Fields: state ('CLOSED', 'OPEN'), is_server, is_closing, optional on_close callback.

Object `obj` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `obj:close(code, reason)` | Sends a CLOSE frame, waits for the reply, closes the socket, calls on_close if it exists and sets state to 'CLOSED'. Returns false if the state is not 'OPEN'. | 95 |
| `obj:connect(ws_url, ws_protocol, options)` | Client connection: parses the URL, connects the socket, performs the HTTP handshake and checks Sec-WebSocket-Accept. Sets state to 'OPEN' on success. | 126 |
| `obj:receive()` | Blocks until a complete message is received. Reassembles fragments, replies to PINGs on the client side, replies to CLOSE with an echo. | 8 |
| `obj:send(data, opcode)` | Sends a message (masked if the object is not a server). Closes the connection if the send fails. | 83 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/lua-websockets/websocket/sync.lua`.*
