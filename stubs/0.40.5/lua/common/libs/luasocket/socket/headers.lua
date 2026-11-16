---@meta
-- tim19Atlas stub generated from lua/common/libs/luasocket/socket/headers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Canonical formatting table for header names (MIME/HTTP) of LuaSocket: maps a lowercase name to its usual form (e.g. 'content-type' -> 'Content-Type'). The module also registers itself in socket.headers. Used by socket.http when sending request headers.
--- Access: `require("libs/luasocket/socket/headers")`
---@class libs_luasocket_socket_headers
---@field canonic table<string, string> Lowercase header names to their canonical capitalization; a name absent from the table is sent as is.
local libs_luasocket_socket_headers = {}

return libs_luasocket_socket_headers
