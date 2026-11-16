---@meta
-- tim19Atlas stub generated from lua/common/libs/timerwheel/timerwheel.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Third-party library timerwheel (timer wheel, from the Kong/lua-resty ecosystem): timeout-type timers with O(1) insertion, cancellation and execution, at the cost of limited precision (size of a slot). The module provides no loop: the caller must call `wheel:step()` regularly (at least every `precision` seconds), for example from onUpdate.
--- Access: `require("libs/timerwheel/timerwheel")`
---@class libs_timerwheel_timerwheel
local libs_timerwheel_timerwheel = {}

--- Creates a timer wheel and returns the `wheel` object (methods step, count, set, cancel, peek). Validates the options with assertions.
---Source: lua/common/libs/timerwheel/timerwheel.lua:59
---@param opts table|nil Options: precision (seconds per slot, default 0.050), ringsize (slots per ring, integer > 0, default 72000 = 1 h), now (function returning the time in seconds), err_handler (xpcall error handler).
---@return table  Wheel object.
function libs_timerwheel_timerwheel.new(opts) end

--- Object returned by new(opts). The methods are called with a colon.
---@class libs_timerwheel_timerwheel_wheel
local libs_timerwheel_timerwheel_wheel = {}

--- Cancels a timer.
---Source: lua/common/libs/timerwheel/timerwheel.lua:dyn
---@param id integer Identifier returned by set.
---@return boolean  true if cancelled, false if not found.
function libs_timerwheel_timerwheel_wheel:cancel(id) end

--- Number of pending timers.
---Source: lua/common/libs/timerwheel/timerwheel.lua:dyn
---@return integer  Number of timers.
function libs_timerwheel_timerwheel_wheel:count() end

--- Finds the next timer to expire (O(n) walk).
---Source: lua/common/libs/timerwheel/timerwheel.lua:dyn
---@param max_ahead number|nil Maximum search horizon in seconds.
---@return number|nil  Seconds before the next expiry (may be negative), or nil if there is none.
function libs_timerwheel_timerwheel_wheel:peek(max_ahead) end

--- Schedules a timer that will call cb(arg) in `expire_in` seconds. Raises an error if `cb` is nil.
---Source: lua/common/libs/timerwheel/timerwheel.lua:dyn
---@param expire_in number Timeout in seconds.
---@param cb function Callback, run in an xpcall.
---@param arg any Argument passed to the callback.
---@return integer  (Negative) timer identifier, for cancel.
function libs_timerwheel_timerwheel_wheel:set(expire_in, cb, arg) end

--- Checks and runs the expired timers. To be called regularly by your loop (at least every `precision` seconds).
---Source: lua/common/libs/timerwheel/timerwheel.lua:dyn
---@return boolean  Always true.
function libs_timerwheel_timerwheel_wheel:step() end

return libs_timerwheel_timerwheel
