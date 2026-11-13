---@meta
-- tim19Atlas stub generated from lua/common/libs/copas/copas/limit.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Limits resource usage while executing tasks.
---  Tasks added will be run in parallel, with a maximum of
---  simultaneous tasks to prevent consuming all/too many resources.
---  Every task added will immediately be scheduled (if there is room)
---  using the `wait` method one can wait for completion.
--- Accès : `require("libs/copas/copas/limit")`
---@class libs_copas_copas_limit
local libs_copas_copas_limit = {}

--- creats a new tasksrunner, with maximum maxt simultaneous threads
---Source : lua/common/libs/copas/copas/limit.lua:121
---@param maxt any
function libs_copas_copas_limit.new(maxt) end

--- Classe locale `ll` de lua/common/libs/copas/copas/limit.lua
---@class libs_copas_copas_limit_ll
local libs_copas_copas_limit_ll = {}

---Source : lua/common/libs/copas/copas/limit.lua:57
function libs_copas_copas_limit_ll.new() end

---Source : lua/common/libs/copas/copas/limit.lua:28
function libs_copas_copas_limit_ll:pop() end

---Source : lua/common/libs/copas/copas/limit.lua:20
---@param item any
function libs_copas_copas_limit_ll:push(item) end

---Source : lua/common/libs/copas/copas/limit.lua:41
---@param item any
function libs_copas_copas_limit_ll:remove(item) end

return libs_copas_copas_limit
