---@meta
-- tim19Atlas stub generated from lua/common/libs/lua-websockets/websocket/server_copas.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- WebSocket server backend of lua-websockets for the cooperative 'copas' library. listen opens a luasocket server socket, performs the handshake for each incoming connection and calls the handler of the negotiated subprotocol (or the default handler) with a client object.
--- Access: `require("libs/lua-websockets/websocket/server_copas")`
---@class libs_lua_websockets_websocket_server_copas
local libs_lua_websockets_websocket_server_copas = {}

--- Starts a WebSocket server. Raises an error if the socket cannot be opened. Each accepted client is registered and passed to the handler, then the coroutine stays alive as long as client.state is not 'CLOSED'.
---Source: lua/common/libs/lua-websockets/websocket/server_copas.lua:52
---@param opts table port (default 80), interface (default '*'), protocols (table subprotocol -> function(client)), default (function(client) for the other cases), on_error (function(message), default print). protocols or default is required.
---@return table  Object with the method close(_, keep_clients) that removes the server from copas and, unless keep_clients, closes the clients.
function libs_lua_websockets_websocket_server_copas.listen(opts) end

--- Client object passed to the handler (state 'OPEN', is_server = true). Inherits from websocket/sync (send, receive, close).
---@class libs_lua_websockets_websocket_server_copas_client
local libs_lua_websockets_websocket_server_copas_client = {}

--- Sends the message to all the clients of the same subprotocol, then to itself.
---Source: lua/common/libs/lua-websockets/websocket/server_copas.lua:dyn
---@param ... any Same arguments as send (data, opcode).
function libs_lua_websockets_websocket_server_copas_client:broadcast(...) end

--- Called on close: removes the client from the subprotocol's list.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/lua-websockets/websocket/server_copas.lua:dyn
function libs_lua_websockets_websocket_server_copas_client:on_close() end

--- Shutdown then closing the socket.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/lua-websockets/websocket/server_copas.lua:dyn
function libs_lua_websockets_websocket_server_copas_client:sock_close() end

--- Read via copas.receive.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/lua-websockets/websocket/server_copas.lua:dyn
function libs_lua_websockets_websocket_server_copas_client:sock_receive() end

--- Send via copas.send.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/lua-websockets/websocket/server_copas.lua:dyn
function libs_lua_websockets_websocket_server_copas_client:sock_send() end

return libs_lua_websockets_websocket_server_copas
