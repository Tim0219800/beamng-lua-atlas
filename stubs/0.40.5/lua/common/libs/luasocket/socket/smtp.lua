---@meta
-- tim19Atlas stub generated from lua/common/libs/luasocket/socket/smtp.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- SMTP client support for the Lua language.
---  LuaSocket toolkit.
---  Author: Diego Nehab
---  Declare module and import dependencies
--- Accès : `require("libs/luasocket/socket/smtp")`
---@class libs_luasocket_socket_smtp
---@field DOMAIN any
---@field PORT number
---@field SERVER string
---@field TIMEOUT number
---@field ZONE string
---@field send any
local libs_luasocket_socket_smtp = {}

---Source : lua/common/libs/luasocket/socket/smtp.lua:233
---@param mesgt any
function libs_luasocket_socket_smtp.message(mesgt) end

---Source : lua/common/libs/luasocket/socket/smtp.lua:116
---@param server any
---@param port any
---@param create any
function libs_luasocket_socket_smtp.open(server, port, create) end

return libs_luasocket_socket_smtp
