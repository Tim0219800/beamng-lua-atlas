---@meta
-- tim19Atlas stub generated from lua/common/libs/copas/copas/semaphore.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Submodule of the third-party Copas library: counting semaphore for Copas coroutines. take requests resources (and waits if they are lacking), give returns them. The module returns the table semaphore.
--- Access: `require("libs/copas/copas/semaphore")`
---@class libs_copas_copas_semaphore
---@field __index table Metatable of the semaphore objects.
local libs_copas_copas_semaphore = {}

--- Number of resources currently available.
---Source: lua/common/libs/copas/copas/semaphore.lua:154
---@param self table The semaphore
---@return integer  Counter
function libs_copas_copas_semaphore.get_count(self) end

--- Total shortfall of resources requested by the waiting coroutines.
---Source: lua/common/libs/copas/copas/semaphore.lua:159
---@param self table The semaphore
---@return integer  Total deficit
function libs_copas_copas_semaphore.get_wait(self) end

--- Gives resources back to the semaphore (and wakes the waiting coroutines).
---Source: lua/common/libs/copas/copas/semaphore.lua:44
---@param self table The semaphore
---@param given integer|nil Number of resources (default 1)
---@return boolean|nil  true on success
---@return string|nil  "too many" if the maximum is exceeded (the counter is capped)
function libs_copas_copas_semaphore.give(self, given) end

--- Creates a semaphore.
---Source: lua/common/libs/copas/copas/semaphore.lua:17
---@param max integer Maximum number of resources (must be greater than 0)
---@param start integer|nil Resources available at the start (default 0)
---@param seconds number|nil Default timeout in seconds (default 10)
---@return table  The semaphore
function libs_copas_copas_semaphore.new(max, start, seconds) end

--- Requests resources; waits (yielding) as long as there are not enough. With timeout = 0, succeeds or fails immediately with "timeout".
---Source: lua/common/libs/copas/copas/semaphore.lua:111
---@param self table The semaphore
---@param requested integer|nil Number requested (default 1)
---@param timeout number|nil Timeout in seconds (default: the semaphore's)
---@return boolean|nil  true on success
---@return string|nil  Error, e.g. "timeout"
function libs_copas_copas_semaphore.take(self, requested, timeout) end

return libs_copas_copas_semaphore
