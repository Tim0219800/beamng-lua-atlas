---@meta
-- tim19Atlas stub generated from lua/common/libs/copas/copas/limit.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Submodule of the third-party Copas library: limits the number of tasks run simultaneously. Each added task is scheduled right away if there is room (otherwise queued); wait lets you wait for all of them to finish. The module returns { new = new }.
--- Access: `require("libs/copas/copas/limit")`
---@class libs_copas_copas_limit
local libs_copas_copas_limit = {}

--- Creates a task runner with at most maxt simultaneous tasks.
---Source: lua/common/libs/copas/copas/limit.lua:121
---@param maxt integer|nil Maximum simultaneous tasks (default 99999)
---@return table  Runner with addthread, removethread, next, wait
function libs_copas_copas_limit.new(maxt) end

--- Internal linked list serving as the task queue.
---@class libs_copas_copas_limit_ll
local libs_copas_copas_limit_ll = {}

--- Creates an empty list.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/copas/copas/limit.lua:57
function libs_copas_copas_limit_ll.new() end

--- Removes and returns the first element (nil if empty).
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/copas/copas/limit.lua:28
function libs_copas_copas_limit_ll:pop() end

--- Adds an element at the end of the list.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/copas/copas/limit.lua:20
---@param item any Element
function libs_copas_copas_limit_ll:push(item) end

--- Removes a given element from the list.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/copas/copas/limit.lua:41
---@param item any Element
function libs_copas_copas_limit_ll:remove(item) end

return libs_copas_copas_limit
