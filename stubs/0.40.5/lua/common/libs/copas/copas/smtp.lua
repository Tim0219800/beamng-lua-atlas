---@meta
-- tim19Atlas stub generated from lua/common/libs/copas/copas/smtp.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- SMTP submodule of the third-party Copas library: identical to LuaSocket's socket.smtp but with asynchronous Copas sockets. Defines copas.smtp; the constants PORT, SERVER, TIMEOUT, DOMAIN and TIMEZONE are redirected to socket.smtp when assigned, other reads fall back to socket.smtp.
--- Access: `require("libs/copas/copas/smtp")`
---@class libs_copas_copas_smtp
local libs_copas_copas_smtp = {}

--- Sends an email like socket.smtp.send, using a Copas socket by default for mailt.create.
---Source: lua/common/libs/copas/copas/smtp.lua:29
---@param mailt table LuaSocket message table (from, rcpt, source, server, ...)
---@return any  Result of socket.smtp.send (1 or nil + error)
function libs_copas_copas_smtp.send(mailt) end

return libs_copas_copas_smtp
