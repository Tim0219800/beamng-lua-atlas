---@meta
-- tim19Atlas stub generated from lua/common/libs/lua-websockets/websocket.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Entry point of the third-party lua-websockets library (Gerhard Lipp, MIT license), a pure-Lua WebSocket (RFC 6455) implementation. This module groups the client and server submodules (loaded on demand) and the frame opcode constants. It is loaded via require('libs/lua-websockets/websocket').
--- Access: `require("libs/lua-websockets/websocket")`
---@class libs_lua_websockets_websocket
---@field BINARY integer Opcode 2: binary message.
---@field CLOSE integer Opcode 8: connection close.
---@field CONTINUATION integer Opcode 0: continuation frame of a fragmented message.
---@field PING integer Opcode 9: ping.
---@field PONG integer Opcode 10: pong.
---@field TEXT integer Opcode 1: text message.
---@field client table Lazy table (see websocket/client.lua): client.new / client.sync (synchronous backend), client.copas, client.ev.
---@field server table Lazy table (see websocket/server.lua): server.copas, server.ev.
local libs_lua_websockets_websocket = {}

return libs_lua_websockets_websocket
