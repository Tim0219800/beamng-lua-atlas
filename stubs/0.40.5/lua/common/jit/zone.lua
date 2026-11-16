---@meta
-- tim19Atlas stub generated from lua/common/jit/zone.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- LuaJIT's jit.zone module (Mike Pall, MIT license, 2005-2026): hierarchical stack of named "zones" used by the profiler (jit.p with the z option) to group samples by logical zone. The module is a callable object: zone('name') pushes a zone, zone() with no argument pops one (error "empty zone stack" if empty).
--- Access: global `zone`
---@class zone
zone = {}

--- Completely empties the zone stack. (dynamically assigned)
---Source: lua/common/jit/zone.lua:dyn
---@param t table The module itself (called with ':' : zone:flush()).
function zone.flush(t) end

--- Returns the name of the current zone (top of the stack), nil if the stack is empty. (dynamically assigned)
---Source: lua/common/jit/zone.lua:dyn
---@param t table The module itself (call zone:get()).
---@return string|nil  Name of the current zone.
function zone.get(t) end

