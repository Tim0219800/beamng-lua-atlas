---@meta
-- tim19Atlas stub generated from lua/common/timeEvents.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small scheduler: lets you schedule the execution of a function in X seconds, like `schedule()`. You create an event list with require('timeEvents').create(), add events to it, and call process(dt) on every update.
--- Access: `require("timeEvents")`
---@class timeEvents
local timeEvents = {}

--- Creates and returns a new empty list of timed events.
---Source: lua/common/timeEvents.lua:46
---@return table  object with methods addEvent, clear, process
function timeEvents.create() end

--- Object returned by create(). Events are stored as elements of the array.
---@class timeEvents_mt
local timeEvents_mt = {}

--- Schedules fn in `time` seconds.
---Source: lua/common/timeEvents.lua:27
---@param time number delay in seconds
---@param fn function function with no argument to run
function timeEvents_mt:addEvent(time, fn) end

--- Removes all pending events.
---Source: lua/common/timeEvents.lua:31
function timeEvents_mt:clear() end

--- To be called on every update: advances the delays by dt and runs the events that have expired.
---Source: lua/common/timeEvents.lua:35
---@param dt number elapsed time in seconds
function timeEvents_mt:process(dt) end

return timeEvents
