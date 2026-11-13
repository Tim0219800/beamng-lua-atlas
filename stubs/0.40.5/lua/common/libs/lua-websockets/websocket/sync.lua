---@meta
-- tim19Atlas stub generated from lua/common/libs/lua-websockets/websocket/sync.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : `require("libs/lua-websockets/websocket/sync")`
---@class libs_lua_websockets_websocket_sync
local libs_lua_websockets_websocket_sync = {}

---Source : lua/common/libs/lua-websockets/websocket/sync.lua:186
---@param obj any
function libs_lua_websockets_websocket_sync.extend(obj) end

--- Classe locale `obj` de lua/common/libs/lua-websockets/websocket/sync.lua
---@class libs_lua_websockets_websocket_sync_obj
local libs_lua_websockets_websocket_sync_obj = {}

---Source : lua/common/libs/lua-websockets/websocket/sync.lua:95
---@param code any
---@param reason any
function libs_lua_websockets_websocket_sync_obj:close(code, reason) end

---Source : lua/common/libs/lua-websockets/websocket/sync.lua:126
---@param ws_url any
---@param ws_protocol any
---@param options any
function libs_lua_websockets_websocket_sync_obj:connect(ws_url, ws_protocol, options) end

---Source : lua/common/libs/lua-websockets/websocket/sync.lua:8
function libs_lua_websockets_websocket_sync_obj:receive() end

---Source : lua/common/libs/lua-websockets/websocket/sync.lua:83
---@param data any
---@param opcode any
function libs_lua_websockets_websocket_sync_obj:send(data, opcode) end

return libs_lua_websockets_websocket_sync
