# `message_io`

*File: `lua/common/libs/lua-websockets/websocket/ev_common.lua` · VM: Common (GE + vehicle) · 162 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `message_io`, `send_io_stop`

Functions common to the client_ev and server_ev backends of lua-websockets (lua-ev event loop): asynchronous buffered sending and reading/decoding of WebSocket frames on a socket. Requires the 'ev' module (not provided by the game).

## Notes

- The file is a return table {async_send, message_io}; the auto doc lists 'message_io' names as global, but they are local variables.
- Part of async_send is truncated in the automatic extraction (real body: send/stop/send_async function further down in the file).

## Functions

| Function | Description | Line |
|---|---|---|
| `message_io.async_send(sock, loop)` | Prepares asynchronous sending on a socket: creates an ev write IO and returns two functions, send_async(data, on_sent, on_err) which adds the data to the buffer and returns the number of bytes pending, and stop() which stops the IO and empties the buffer. on_sent receives the data sent; on_err receives the error. | 21 |
| `message_io.message_io(sock, loop, on_message, on_error)` | Watches a socket for reading, reassembles the WebSocket frames (via frame.decode), concatenates the fragments and calls on_message for each complete message. Calls on_error on disconnect or on an error other than timeout. | 99 |

### Parameter details

#### `message_io.async_send(sock, loop)`

Prepares asynchronous sending on a socket: creates an ev write IO and returns two functions, send_async(data, on_sent, on_err) which adds the data to the buffer and returns the number of bytes pending, and stop() which stops the IO and empties the buffer. on_sent receives the data sent; on_err receives the error.

- `sock` (*table*) : luasocket socket.
- `loop` (*table*) : ev loop (default ev.Loop.default).
- **returns**: function send_async(data, on_sent, on_err).
- **returns**: function stop().

#### `message_io.message_io(sock, loop, on_message, on_error)`

Watches a socket for reading, reassembles the WebSocket frames (via frame.decode), concatenates the fragments and calls on_message for each complete message. Calls on_error on disconnect or on an error other than timeout.

- `sock` (*table*) : luasocket socket with a valid descriptor.
- `loop` (*table*) : ev loop.
- `on_message` (*function*) : function(message, opcode).
- `on_error` (*function*) : function(err, io, sock).
- **returns**: table The ev read IO (stop with :stop(loop)).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/lua-websockets/websocket/ev_common.lua`.*
