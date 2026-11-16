---@meta
-- tim19Atlas stub generated from lua/common/libs/LuaJIT/zone.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- LuaJIT's jit.zone module (Mike Pall, MIT license): hierarchical stack of named "zones", used by the LuaJIT profiler to label portions of code. The module returns a callable table: zone("name") pushes a zone, zone() pops one and returns it. A modder normally does not need it.
--- Access: global `zone`
---@class zone
zone = {}

--- Empties the zone stack (method: zone:flush()). (dynamically assigned)
---Source: lua/common/libs/LuaJIT/zone.lua:dyn
---@param t table The zone table (self)
function zone.flush(t) end

--- Returns the current zone, i.e. the top of the stack (zone:get()), or nil if empty. (dynamically assigned)
---Source: lua/common/libs/LuaJIT/zone.lua:dyn
---@param t table The zone table (self)
---@return string|nil  Name of the current zone
function zone.get(t) end

