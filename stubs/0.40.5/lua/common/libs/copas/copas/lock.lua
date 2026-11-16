---@meta
-- tim19Atlas stub generated from lua/common/libs/copas/copas/lock.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Submodule of the third-party Copas library: lock (mutex) between Copas coroutines. A coroutine that requests an already-held lock yields until it is released or the timeout expires. By default the lock is re-entrant and the timeout is 10 s. The module returns the table lock.
--- Access: `require("libs/copas/copas/lock")`
---@class libs_copas_copas_lock
---@field __index table Metatable of the lock objects (lock itself).
local libs_copas_copas_lock = {}

--- Acquires the lock; yields while another coroutine holds it. With timeout = 0, returns immediately without yielding.
---Source: lua/common/libs/copas/copas/lock.lua:99
---@param self table The lock (call lock:get)
---@param timeout number|nil Timeout in seconds, takes precedence over the one from new
---@return number|nil  Wait time on success, otherwise nil
---@return string|nil  Error: timeout, destroyed or lock is not re-entrant
---@return number|nil  Wait time on failure
function libs_copas_copas_lock.get(self, timeout) end

--- Creates a lock.
---Source: lua/common/libs/copas/copas/lock.lua:19
---@param seconds number|nil Default acquisition timeout in seconds (default 10)
---@param not_reentrant boolean|nil If true, a coroutine cannot re-acquire a lock it already holds
---@return table  The lock
function libs_copas_copas_lock.new(seconds, not_reentrant) end

--- Releases the lock held by the current coroutine.
---Source: lua/common/libs/copas/copas/lock.lua:153
---@param self table The lock (call lock:release)
---@return boolean|nil  true if released
---@return string|nil  Error message
function libs_copas_copas_lock.release(self) end

return libs_copas_copas_lock
