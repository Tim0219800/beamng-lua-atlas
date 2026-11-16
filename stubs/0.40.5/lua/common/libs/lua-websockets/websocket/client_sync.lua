---@meta
-- tim19Atlas stub generated from lua/common/libs/lua-websockets/websocket/client_sync.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Synchronous (blocking) WebSocket client backend of lua-websockets, based on luasocket. The module returns a constructor function _anon(also accessible via websocket.client.new). The object is extended by websocket/sync, which gives it connect, send, receive and close. To be used for a simple WebSocket client in a game Lua script.
--- Access: `require("libs/lua-websockets/websocket/client_sync")`
---@class libs_lua_websockets_websocket_client_sync
local libs_lua_websockets_websocket_client_sync = {}

--- Object returned by the constructor new(ws). ws is an optional options table (timeout in seconds). connect/send/receive/close come from websocket/sync.
---@class libs_lua_websockets_websocket_client_sync_client
local libs_lua_websockets_websocket_client_sync_client = {}

--- Wraps the socket with ssl.wrap then starts the TLS negotiation. Unusable in practice because ssl is nil.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/lua-websockets/websocket/client_sync.lua:dyn
---@param ssl_params table TLS parameters.
function libs_lua_websockets_websocket_client_sync_client:dohandshake(ssl_params) end

--- Closes the socket.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/lua-websockets/websocket/client_sync.lua:dyn
function libs_lua_websockets_websocket_client_sync_client:sock_close() end

--- Creates a luasocket TCP socket, applies ws.timeout and connects. Returns nil and the error on failure.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/lua-websockets/websocket/client_sync.lua:dyn
---@param host string Host.
---@param port integer Port.
function libs_lua_websockets_websocket_client_sync_client:sock_connect(host, port) end

--- Reads data on the socket (luasocket receive).
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/lua-websockets/websocket/client_sync.lua:dyn
function libs_lua_websockets_websocket_client_sync_client:sock_receive() end

--- Sends data on the socket (luasocket send).
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/lua-websockets/websocket/client_sync.lua:dyn
function libs_lua_websockets_websocket_client_sync_client:sock_send() end

