---@meta
-- tim19Atlas stub generated from lua/common/libs/copas/copas/timer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : `require("libs/copas/copas/timer")`
---@class libs_copas_copas_timer
---@field __index table
local libs_copas_copas_timer = {}

--- Cancels a running timer.
---  @return timer object, or nil+error
---Source : lua/common/libs/copas/copas/timer.lua:49
---@param self any
function libs_copas_copas_timer.cancel(self) end

--- Creates a new timer object.
---  Note: the callback signature is: `function(timer_obj, params)`.
---  @param opts (table) `opts.delay` timer delay in seconds, `opts.callback` function to execute, `opts.recurring` boolean
---  `opts.params` (optional) this value will be passed to the timer callback, `opts.initial_delay` (optional) the first delay to use, defaults to `delay`.
---  @return timer object, or throws an error on bad input
---Source : lua/common/libs/copas/copas/timer.lua:72
---@param opts any
function libs_copas_copas_timer.new(opts) end

return libs_copas_copas_timer
