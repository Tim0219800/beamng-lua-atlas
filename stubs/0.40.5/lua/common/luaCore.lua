---@meta
-- tim19Atlas stub generated from lua/common/luaCore.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Function that does nothing (default value for callbacks).
---Source: lua/common/luaCore.lua:41
function nop() end

--- Does require(module) in a pcall: returns the module, or nil if loading fails (module absent or error in the module).
---Source: lua/common/luaCore.lua:8
---@param module string module name
---@return any|nil  module or nil
function require_optional(module) end

--- Forces a file reload: clears package.loaded[module] then does require. Logs a warning if the module is falsy after loading.
---Source: lua/common/luaCore.lua:21
---@param module string module name
---@return any  reloaded module
function rerequire(module) end

--- Unloads a module: removes package.loaded[m] and the global of the same name.
---Source: lua/common/luaCore.lua:15
---@param m string module name
function unrequire(m) end

---@type any
ffi = nil
