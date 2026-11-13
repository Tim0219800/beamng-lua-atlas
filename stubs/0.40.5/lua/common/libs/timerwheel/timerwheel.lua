---@meta
-- tim19Atlas stub generated from lua/common/libs/timerwheel/timerwheel.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Timer wheel implementation
---  Efficient timer for timeout related timers: fast insertion, deletion, and
---  execution (all as O(1) implemented), but with lesser precision.
---  This module will not provide the timer/runloop itself. Use your own runloop
---  and call `wheel:step` to check and execute timers.
---  Implementation:
---  Consider a stack of rings, a timer beyond the current ring size is in the
---  next ring (or beyond). Precision is based on a slot with a specific size.
---  The code explicitly avoids using `pairs`, `ipairs` and `next` to ensure JIT
---  compilation when using LuaJIT
--- Accès : `require("libs/timerwheel/timerwheel")`
---@class libs_timerwheel_timerwheel
local libs_timerwheel_timerwheel = {}

--- Creates a new timer wheel.
---  The options are:
---   - `precision` (optional) precision of the timer wheel in seconds (slot size),
---  defaults to 0.050
---   - `ringsize` (optional) number of slots in each ring, defaults to 72000 (1
---  hour span, based on default `precision`)
---   - `now` (optional) a function returning the curent time in seconds. Defaults
---  to `luasocket.gettime` or `ngx.now` if available.
---   - `err_handler` (optional) a function to use as error handler in a `xpcall` when
---  executing the callback. The default will send the stacktrace on `stderr`.
---  @param opts the options table
---  @return the timerwheel object
---Source : lua/common/libs/timerwheel/timerwheel.lua:59
---@param opts any
function libs_timerwheel_timerwheel.new(opts) end

return libs_timerwheel_timerwheel
