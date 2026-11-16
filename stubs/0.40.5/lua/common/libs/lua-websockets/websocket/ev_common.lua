---@meta
-- tim19Atlas stub generated from lua/common/libs/lua-websockets/websocket/ev_common.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Functions common to the client_ev and server_ev backends of lua-websockets (lua-ev event loop): asynchronous buffered sending and reading/decoding of WebSocket frames on a socket. Requires the 'ev' module (not provided by the game).
--- Access: global `message_io`, `send_io_stop`
---@class message_io
message_io = {}

--- Prepares asynchronous sending on a socket: creates an ev write IO and returns two functions, send_async(data, on_sent, on_err) which adds the data to the buffer and returns the number of bytes pending, and stop() which stops the IO and empties the buffer. on_sent receives the data sent; on_err receives the error.
---Source: lua/common/libs/lua-websockets/websocket/ev_common.lua:21
---@param sock table luasocket socket.
---@param loop table ev loop (default ev.Loop.default).
---@return function  send_async(data, on_sent, on_err).
---@return function  stop().
function message_io.async_send(sock, loop) end

--- Watches a socket for reading, reassembles the WebSocket frames (via frame.decode), concatenates the fragments and calls on_message for each complete message. Calls on_error on disconnect or on an error other than timeout.
---Source: lua/common/libs/lua-websockets/websocket/ev_common.lua:99
---@param sock table luasocket socket with a valid descriptor.
---@param loop table ev loop.
---@param on_message function function(message, opcode).
---@param on_error function function(err, io, sock).
---@return table  The ev read IO (stop with :stop(loop)).
function message_io.message_io(sock, loop, on_message, on_error) end

