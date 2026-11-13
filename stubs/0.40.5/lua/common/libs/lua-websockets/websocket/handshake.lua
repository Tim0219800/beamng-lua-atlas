---@meta
-- tim19Atlas stub generated from lua/common/libs/lua-websockets/websocket/handshake.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : `require("libs/lua-websockets/websocket/handshake")`
---@class libs_lua_websockets_websocket_handshake
local libs_lua_websockets_websocket_handshake = {}

---Source : lua/common/libs/lua-websockets/websocket/handshake.lua:67
---@param request any
---@param protocols any
function libs_lua_websockets_websocket_handshake.accept_upgrade(request, protocols) end

---Source : lua/common/libs/lua-websockets/websocket/handshake.lua:14
---@param request any
function libs_lua_websockets_websocket_handshake.http_headers(request) end

---Source : lua/common/libs/lua-websockets/websocket/handshake.lua:7
---@param sec_websocket_key any
function libs_lua_websockets_websocket_handshake.sec_websocket_accept(sec_websocket_key) end

---Source : lua/common/libs/lua-websockets/websocket/handshake.lua:40
---@param req any
function libs_lua_websockets_websocket_handshake.upgrade_request(req) end

return libs_lua_websockets_websocket_handshake
