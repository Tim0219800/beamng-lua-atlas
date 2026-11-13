---@meta
-- tim19Atlas stub generated from lua/common/libs/luasocket/socket/mbox.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : `require("libs/luasocket/socket/mbox")`
---@class libs_luasocket_socket_mbox
local libs_luasocket_socket_mbox = {}

---Source : lua/common/libs/luasocket/socket/mbox.lua:77
---@param mbox_s any
function libs_luasocket_socket_mbox.parse(mbox_s) end

---Source : lua/common/libs/luasocket/socket/mbox.lua:51
---@param from any
function libs_luasocket_socket_mbox.parse_from(from) end

---Source : lua/common/libs/luasocket/socket/mbox.lua:29
---@param header_s any
function libs_luasocket_socket_mbox.parse_header(header_s) end

---Source : lua/common/libs/luasocket/socket/mbox.lua:36
---@param headers_s any
function libs_luasocket_socket_mbox.parse_headers(headers_s) end

---Source : lua/common/libs/luasocket/socket/mbox.lua:85
---@param message_s any
function libs_luasocket_socket_mbox.parse_message(message_s) end

---Source : lua/common/libs/luasocket/socket/mbox.lua:21
---@param headers_s any
function libs_luasocket_socket_mbox.split_headers(headers_s) end

---Source : lua/common/libs/luasocket/socket/mbox.lua:63
---@param mbox_s any
function libs_luasocket_socket_mbox.split_mbox(mbox_s) end

---Source : lua/common/libs/luasocket/socket/mbox.lua:7
---@param message_s any
function libs_luasocket_socket_mbox.split_message(message_s) end

return libs_luasocket_socket_mbox
