---@meta
-- tim19Atlas stub generated from lua/common/libs/copas/copas/lock.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : `require("libs/copas/copas/lock")`
---@class libs_copas_copas_lock
---@field __index table
local libs_copas_copas_lock = {}

--- Acquires the lock.
---  If the lock is owned by another thread, this will yield control, until the
---  lock becomes available, or it times out.
---  If `timeout == 0` then it will immediately return (without yielding).
---  @param timeout (optional) timeout in seconds, if given overrides the timeout passed to `new`.
---  @return wait-time on success, or nil+error+wait_time on failure. Errors can be "timeout", "destroyed", or "lock is not re-entrant"
---Source : lua/common/libs/copas/copas/lock.lua:99
---@param self any
---@param timeout any
function libs_copas_copas_lock.get(self, timeout) end

--- Creates a new lock.
---  @param seconds (optional) default timeout in seconds when acquiring the lock (defaults to 10)
---  @param not_reentrant (optional) if truthy the lock will not allow a coroutine to grab the same lock multiple times
---  @return the lock object
---Source : lua/common/libs/copas/copas/lock.lua:19
---@param seconds any
---@param not_reentrant any
function libs_copas_copas_lock.new(seconds, not_reentrant) end

--- Releases the lock currently held.
---  Releasing a lock that is not owned by the current co-routine will return
---  an error.
---  returns true, or nil+err on an error
---Source : lua/common/libs/copas/copas/lock.lua:153
---@param self any
function libs_copas_copas_lock.release(self) end

return libs_copas_copas_lock
