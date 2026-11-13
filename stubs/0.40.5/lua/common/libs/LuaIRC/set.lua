---@meta
-- tim19Atlas stub generated from lua/common/libs/LuaIRC/set.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `set` de lua/common/libs/LuaIRC/set.lua
---@class libs_LuaIRC_set_set
local libs_LuaIRC_set_set = {}

---Source : lua/common/libs/LuaIRC/set.lua:20
---@param connection any
function libs_LuaIRC_set_set:add(connection) end

--- Select - but if it times out, it returns all connections.
---Source : lua/common/libs/LuaIRC/set.lua:53
function libs_LuaIRC_set_set:poll() end

---Source : lua/common/libs/LuaIRC/set.lua:28
---@param connection any
function libs_LuaIRC_set_set:remove(connection) end

---Source : lua/common/libs/LuaIRC/set.lua:40
function libs_LuaIRC_set_set:select() end

---Source : lua/common/libs/LuaIRC/set.lua:14
---@param t any
function new(t) end

