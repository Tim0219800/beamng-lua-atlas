---@meta
-- tim19Atlas stub generated from lua/common/luaBinding.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Called by the engine once all the C++ classes are registered in the VM: installs the SimObject accessors (outside the vehicle VM) then optimizes the metatables without a parent (removes __newindex without setters, flattens the getters).
---*(internal: called by the engine or the main loop)*
---Source: lua/common/luaBinding.lua:195
---@param classes table<string, table> exposed classes (name -> metatable)
---@param luaVMname string VM name ('vlua' for the vehicle)
function __finalizeLuaBindings(classes, luaVMname) end

--- __index of a C++ class instance: first looks for a metatable field, then a class getter, then walks up the parent class chain (caching). Returns nil if not found.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/luaBinding.lua:6
---@param t userdata|table instance
---@param k any requested key
---@return any  value, method or getter result
function __luaBindIndex(t, k) end

--- __index of classes with static members: like __luaBindIndex but the getters are called without an instance, and a non-function constant is returned as is.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/luaBinding.lua:43
---@param t table static class table
---@param k any requested key
---@return any  value
function __luaBindIndexStatic(t, k) end

--- __newindex of an instance: calls the setter of the class (or of a parent); silently ignores if there is no setter.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/luaBinding.lua:84
---@param t userdata|table instance
---@param k any key
---@param v any value to write
function __luaBindNewindex(t, k, v) end

--- __newindex for static classes: calls the setter without an instance (setFunc(v)).
---*(internal: called by the engine or the main loop)*
---Source: lua/common/luaBinding.lua:112
---@param t table class table
---@param k any key
---@param v any value
function __luaBindNewindexStatic(t, k, v) end

--- Unit test of the bindings (classes TestNamespace.TestClassA/B): assignments, calls, destruction and garbage collection; prints *** Unittest start *** / *** DONE ***.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/luaBinding.lua:249
function testBindings() end

