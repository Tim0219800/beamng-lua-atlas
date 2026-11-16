---@meta
-- tim19Atlas stub generated from lua/common/libs/LuaIRC/set.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Set of IRC connections.
---@class libs_LuaIRC_set_set
local libs_LuaIRC_set_set = {}

--- Adds a connection (its socket is added to the monitored list).
---Source: lua/common/libs/LuaIRC/set.lua:20
---@param connection table IRC connection with a socket field
function libs_LuaIRC_set_set:add(connection) end

--- Like select, but on timeout returns all the connections (so that they can do their periodic work).
---Source: lua/common/libs/LuaIRC/set.lua:53
---@return table  Connections to process
function libs_LuaIRC_set_set:poll() end

--- Removes a connection from the set.
---Source: lua/common/libs/LuaIRC/set.lua:28
---@param connection table Connection to remove
function libs_LuaIRC_set_set:remove(connection) end

--- Calls socket.select on the sockets with self.timeout and returns the list of connections ready to read.
---Source: lua/common/libs/LuaIRC/set.lua:40
---@return table|nil  Connections ready for reading
---@return string|nil  Error (e.g. "timeout")
function libs_LuaIRC_set_set:select() end

--- Turns the table t into a set (connections and sockets fields created empty, set metatable).
---Source: lua/common/libs/LuaIRC/set.lua:14
---@param t table Configuration table, e.g. {timeout = 1}
---@return table  The set
function new(t) end

