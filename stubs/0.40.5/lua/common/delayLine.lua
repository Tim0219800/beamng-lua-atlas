---@meta
-- tim19Atlas stub generated from lua/common/delayLine.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Generic delay line: each data packet pushed into the line comes out after the same delay. Originally created to simulate the time unburnt fuel takes to travel through the exhaust before burning. The line must be polled regularly (pop/popSum) with the time step to retrieve what has reached the end.
--- Access: `require("delayLine")`
---@class delayLine
local delayLine = {}

--- Creates a delay line.
---Source: lua/common/delayLine.lua:92
---@param delay number Delay in seconds applied to each packet.
---@return table  Object with the methods push, peek, pop, popSum, reset.
function delayLine.new(delay) end

--- Object returned by new(delay). Fields: delay, length, currentTime, data, times.
---@class delayLine_delayLine
local delayLine_delayLine = {}

--- Returns, without removing them or advancing time, the packets that would have arrived within dt seconds.
---Source: lua/common/delayLine.lua:dyn
---@param dt number Horizon in seconds.
---@return table|nil  List of packets; nil if the line is empty.
function delayLine_delayLine:peek(dt) end

--- Advances time by dt, removes and returns all packets that are due.
---Source: lua/common/delayLine.lua:dyn
---@param dt number Elapsed time in seconds.
---@return table|nil  List of arrived packets; nil if the line is empty.
function delayLine_delayLine:pop(dt) end

--- Like pop but returns the (numeric) sum of the arrived packets.
---Source: lua/common/delayLine.lua:dyn
---@param dt number Elapsed time in seconds.
---@return number  Sum of the arrived packets (0 if none).
function delayLine_delayLine:popSum(dt) end

--- Inserts a data packet; it will come out at currentTime + delay.
---Source: lua/common/delayLine.lua:dyn
---@param payload any Data to delay.
function delayLine_delayLine:push(payload) end

--- Empties the line and resets the internal time to 0.
---Source: lua/common/delayLine.lua:dyn
function delayLine_delayLine:reset() end

return delayLine
