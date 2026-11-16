---@meta
-- tim19Atlas stub generated from lua/common/libs/lua-websockets/websocket/client_copas.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- WebSocket client backend of lua-websockets for the cooperative 'copas' library (non-blocking sockets in coroutines). The module returns a constructor function; the returned object is extended by websocket/sync (connect, send, receive, close methods).
--- Access: `require("libs/lua-websockets/websocket/client_copas")`
---@class libs_lua_websockets_websocket_client_copas
local libs_lua_websockets_websocket_client_copas = {}

--- Object returned by the constructor new(ws). ws is an optional options table (timeout field in seconds). The connect/send/receive/close methods come from websocket/sync; the sock_* methods below provide the transport.
---@class libs_lua_websockets_websocket_client_copas_client
local libs_lua_websockets_websocket_client_copas_client = {}

--- Delegates to copas.dohandshake (TLS negotiation) on the socket.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/lua-websockets/websocket/client_copas.lua:dyn
function libs_lua_websockets_websocket_client_copas_client:dohandshake() end

--- Closes the socket.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/lua-websockets/websocket/client_copas.lua:dyn
function libs_lua_websockets_websocket_client_copas_client:sock_close() end

--- Creates a TCP socket (luasocket), applies ws.timeout and connects via copas.connect. Returns nil and the error on failure (except 'already connected').
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/lua-websockets/websocket/client_copas.lua:dyn
---@param host string Host.
---@param port integer Port.
---@return nil|string  nil, error message on failure.
function libs_lua_websockets_websocket_client_copas_client:sock_connect(host, port) end

--- Reads data via copas.receive on the socket.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/lua-websockets/websocket/client_copas.lua:dyn
function libs_lua_websockets_websocket_client_copas_client:sock_receive() end

--- Sends data via copas.send on the socket.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/lua-websockets/websocket/client_copas.lua:dyn
function libs_lua_websockets_websocket_client_copas_client:sock_send() end

