---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Timing state object.
---@class gameplay_rally_stage_stageTimingState
local gameplay_rally_stage_stageTimingState = {}

--- Adds seconds to the elapsed time (penalty, for example for a recovery).
---Source: lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:50
---@param seconds number Seconds to add, > 0
---@return boolean  true if the time was added
function gameplay_rally_stage_stageTimingState:addTime(seconds) end

--- Advances the timer by dt if it is active and not finished, storing the start and duration of the frame; otherwise frameDt is 0.
---Source: lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:39
---@param dt number|nil Time step in seconds (0 if nil)
function gameplay_rally_stage_stageTimingState:advance(dt) end

--- Ends the timer: status 'complete', freezes finishTime and elapsedTime.
---Source: lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:60
---@param time number|nil Finish time; current elapsed time if nil
function gameplay_rally_stage_stageTimingState:completeAt(time) end

--- Duration of the last frame processed by advance (0 if inactive).
---Source: lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:143
---@return number  seconds
function gameplay_rally_stage_stageTimingState:getFrameDt() end

--- Time at the start of the last frame processed by advance.
---Source: lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:139
---@return number  seconds
function gameplay_rally_stage_stageTimingState:getFrameStartTime() end

--- List of pathnodeIds in recording order.
---Source: lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:123
---@return table  splitOrder
function gameplay_rally_stage_stageTimingState:getSplitOrder() end

--- Table of splits keyed by pathnodeId.
---Source: lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:119
---@return table  splitTimes
function gameplay_rally_stage_stageTimingState:getSplitTimes() end

--- Snapshot of the state: status, active, complete, elapsedTime, finishTime, frameStartTime, frameDt, splitTimes, splitOrder (the splits tables are shared, not copied).
---Source: lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:147
---@return table  State
function gameplay_rally_stage_stageTimingState:getState() end

--- Finish time if it exists, otherwise elapsed time (seconds).
---Source: lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:135
---@return number  seconds
function gameplay_rally_stage_stageTimingState:getTime() end

--- Calls reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:7
function gameplay_rally_stage_stageTimingState:init() end

--- True if the timer is running (active and not finished).
---Source: lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:127
---@return boolean
function gameplay_rally_stage_stageTimingState:isActive() end

--- True if the timer is finished.
---Source: lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:131
---@return boolean
function gameplay_rally_stage_stageTimingState:isComplete() end

--- Marks a split as missing (without time) with a reason; the entry replaces any existing entry.
---Source: lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:95
---@param splitData table Same structure as recordSplit
---@param reason string|nil Reason (default splitData.missingReason or 'missing')
---@return table|nil  Recorded entry
function gameplay_rally_stage_stageTimingState:markSplitMissing(splitData, reason) end

--- Records a split time for a path node, if splitData.isSplitTiming. Fills in splitData.time and splitData.source if absent.
---Source: lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:68
---@param splitData table {isSplitTiming, pathnodeId, pathnodeName, pathnodeType, splitLabel}
---@param time number|nil Split time (current time if nil)
---@param source string|nil Origin of the time ('tracker' by default)
---@return table|nil  Recorded entry, nil if splitData is invalid
function gameplay_rally_stage_stageTimingState:recordSplit(splitData, time, source) end

--- Resets everything: status idle, inactive, not finished, time 0, no splits.
---Source: lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:11
function gameplay_rally_stage_stageTimingState:reset() end

--- Activates or pauses the timer (status 'active' / 'idle'). No effect if the timer is finished (it stays inactive).
---Source: lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:23
---@param active boolean true to start/resume (only the strict value true counts)
function gameplay_rally_stage_stageTimingState:setActive(active) end

