---@meta
-- tim19Atlas stub generated from lua/common/libs/copas/copas/ftp.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- FTP submodule of the third-party Copas library: identical to LuaSocket's socket.ftp, but uses asynchronous Copas sockets (copas.wrap). Defines copas.ftp with get, put and command. The constants PORT, TIMEOUT, PASSWORD and USER are redirected to the original socket.ftp module when assigned.
--- Access: `require("libs/copas/copas/ftp")`
---@class libs_copas_copas_ftp
---@field get function Downloads a file: get(url_or_table). In string form, returns the concatenated content.
---@field put function Uploads a file: put(url_or_table, body).
local libs_copas_copas_ftp = {}

--- Sends a raw FTP command (like socket.ftp.command) with a Copas socket.
---Source: lua/common/libs/copas/copas/ftp.lua:90
---@param cmdt table LuaSocket command table
function libs_copas_copas_ftp.command(cmdt) end

--- Converts the short form into the advanced form: with body it is a PUT (source = body), otherwise a GET with a target field receiving the result.
---Source: lua/common/libs/copas/copas/ftp.lua:57
---@param u string ftp://... URL
---@param body string|nil Content to send (PUT)
function libs_copas_copas_ftp.parseRequest(u, body) end

return libs_copas_copas_ftp
