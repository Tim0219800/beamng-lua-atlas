---@meta
-- tim19Atlas stub generated from lua/common/libs/copas/copas/timer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Submodule of the third-party Copas library: timers (one-shot or recurring) run in the Copas dispatcher. timer.new immediately arms a timer that will call callback(timer_obj, params) after the delay. The module returns the table timer.
--- Access: `require("libs/copas/copas/timer")`
---@class libs_copas_copas_timer
---@field __index table Metatable of the timer objects.
local libs_copas_copas_timer = {}

--- Cancels an active timer (removes its coroutine from the dispatcher).
---Source: lua/common/libs/copas/copas/timer.lua:49
---@param self table The timer (timer:cancel())
---@return table|nil  The timer, or nil + error if already cancelled
function libs_copas_copas_timer.cancel(self) end

--- Creates and arms a timer.
---Source: lua/common/libs/copas/copas/timer.lua:72
---@param opts table {delay (s), callback, recurring?, params?, initial_delay? (default delay)}
---@return table  Timer object
function libs_copas_copas_timer.new(opts) end

return libs_copas_copas_timer
