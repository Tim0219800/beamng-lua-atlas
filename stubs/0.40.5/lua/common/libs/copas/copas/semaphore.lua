---@meta
-- tim19Atlas stub generated from lua/common/libs/copas/copas/semaphore.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : `require("libs/copas/copas/semaphore")`
---@class libs_copas_copas_semaphore
---@field __index table
local libs_copas_copas_semaphore = {}

--- returns current available resources
---Source : lua/common/libs/copas/copas/semaphore.lua:154
---@param self any
function libs_copas_copas_semaphore.get_count(self) end

--- returns total shortage for requested resources
---Source : lua/common/libs/copas/copas/semaphore.lua:159
---@param self any
function libs_copas_copas_semaphore.get_wait(self) end

--- Gives resources.
---  @param given (optional, default 1) number of resources to return. If more
---  than the maximum are returned then it will be capped at the maximum and
---  error "too many" will be returned.
---Source : lua/common/libs/copas/copas/semaphore.lua:44
---@param self any
---@param given any
function libs_copas_copas_semaphore.give(self, given) end

--- create a new semaphore
---  @param max maximum number of resources the semaphore can hold (this maximum does NOT include resources that have been given but not yet returned).
---  @param seconds (optional, default 10) default semaphore timeout in seconds
---  @param start (optional, default 0) the initial resources available
---Source : lua/common/libs/copas/copas/semaphore.lua:17
---@param max any
---@param start any
---@param seconds any
function libs_copas_copas_semaphore.new(max, start, seconds) end

--- Requests resources from the semaphore.
---  Waits if there are not enough resources available before returning.
---  @param requested (optional, default 1) the number of resources requested
---  @param timeout (optional, defaults to semaphore timeout) timeout in
---  seconds. If 0 it will either succeed or return immediately with error "timeout"
---  @return true
---Source : lua/common/libs/copas/copas/semaphore.lua:111
---@param self any
---@param requested any
---@param timeout any
function libs_copas_copas_semaphore.take(self, requested, timeout) end

return libs_copas_copas_semaphore
