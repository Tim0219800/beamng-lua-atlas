---@meta
-- tim19Atlas stub generated from lua/common/libs/luasocket/socket/socket.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- LuaSocket helper module
---  Author: Diego Nehab
---  Declare module and import dependencies
--- Accès : `require("libs/luasocket/socket/socket")`
---@class libs_luasocket_socket_socket
---@field BLOCKSIZE number
---@field sink any
---@field sinkt any
---@field source any
---@field sourcet any
---@field try any
local libs_luasocket_socket_socket = {}

---Source : lua/common/libs/luasocket/socket/socket.lua:27
---@param host any
---@param port any
---@param backlog any
function libs_luasocket_socket_socket.bind(host, port, backlog) end

---Source : lua/common/libs/luasocket/socket/socket.lua:59
---@param table any
function libs_luasocket_socket_socket.choose(table) end

--- Exported auxiliar functions
---Source : lua/common/libs/luasocket/socket/socket.lua:19
---@param address any
---@param port any
---@param laddress any
---@param lport any
function libs_luasocket_socket_socket.connect4(address, port, laddress, lport) end

---Source : lua/common/libs/luasocket/socket/socket.lua:23
---@param address any
---@param port any
---@param laddress any
---@param lport any
function libs_luasocket_socket_socket.connect6(address, port, laddress, lport) end

return libs_luasocket_socket_socket
