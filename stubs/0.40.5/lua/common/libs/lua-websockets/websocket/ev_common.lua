---@meta
-- tim19Atlas stub generated from lua/common/libs/lua-websockets/websocket/ev_common.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : globale `message_io`, `send_io_stop`
---@class message_io
message_io = {}

---Source : lua/common/libs/lua-websockets/websocket/ev_common.lua:21
---@param sock any
---@param loop any
function message_io.async_send(sock, loop) end

---Source : lua/common/libs/lua-websockets/websocket/ev_common.lua:99
---@param sock any
---@param loop any
---@param on_message any
---@param on_error any
function message_io.message_io(sock, loop, on_message, on_error) end

