---@meta
-- tim19Atlas stub generated from lua/common/libs/lua-websockets/websocket/server_ev.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- WebSocket server backend of lua-websockets for the lua-ev event loop ('ev' module, not provided by the game). listen accepts connections asynchronously, performs the handshake, then creates a callback-driven client object (on_message, on_close, on_error).
--- Access: `require("libs/lua-websockets/websocket/server_ev")`
---@class libs_lua_websockets_websocket_server_ev
local libs_lua_websockets_websocket_server_ev = {}

--- Starts an asynchronous WebSocket server on the ev loop. Raises an error if the bind fails.
---Source: lua/common/libs/lua-websockets/websocket/server_ev.lua:142
---@param opts table port (default 80), interface (default '*'), loop (default ev.Loop.default), protocols (subprotocol -> function(client)), default (function(client)). protocols or default is required.
---@return table  Server object: on_error(self, f), sock() (listening socket), close(keep_clients).
function libs_lua_websockets_websocket_server_ev.listen(opts) end

--- Client object passed to the handler (state 'OPEN'). Callbacks are set with the on_* methods.
---@class libs_lua_websockets_websocket_server_ev_client
local libs_lua_websockets_websocket_server_ev_client = {}

--- Sends to all the clients of the same subprotocol.
---Source: lua/common/libs/lua-websockets/websocket/server_ev.lua:dyn
---@param ... any Arguments of send.
function libs_lua_websockets_websocket_server_ev_client:broadcast(...) end

--- Closes the connection cleanly (CLOSE frame) with an expiry timeout.
---Source: lua/common/libs/lua-websockets/websocket/server_ev.lua:dyn
---@param code integer Close code (default 1000).
---@param reason string Reason.
---@param timeout number Seconds before forced close (default 3).
function libs_lua_websockets_websocket_server_ev_client:close(code, reason, timeout) end

--- Sets the close callback.
---Source: lua/common/libs/lua-websockets/websocket/server_ev.lua:dyn
---@param on_close function function(client, ...) .
function libs_lua_websockets_websocket_server_ev_client:on_close(on_close) end

--- Sets the error callback.
---Source: lua/common/libs/lua-websockets/websocket/server_ev.lua:dyn
---@param on_error function function(client, error).
function libs_lua_websockets_websocket_server_ev_client:on_error(on_error) end

--- Sets the receive callback.
---Source: lua/common/libs/lua-websockets/websocket/server_ev.lua:dyn
---@param on_message function function(client, message, opcode).
function libs_lua_websockets_websocket_server_ev_client:on_message(on_message) end

--- Sends a message asynchronously (write buffer).
---Source: lua/common/libs/lua-websockets/websocket/server_ev.lua:dyn
---@param message string Data.
---@param opcode integer Frame opcode (TEXT by default).
function libs_lua_websockets_websocket_server_ev_client:send(message, opcode) end

--- Starts asynchronous reading of the messages; called by listen after the handler is called.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/lua-websockets/websocket/server_ev.lua:dyn
function libs_lua_websockets_websocket_server_ev_client:start() end

return libs_lua_websockets_websocket_server_ev
