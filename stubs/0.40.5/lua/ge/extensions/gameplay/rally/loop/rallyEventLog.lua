---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Event log. Instance fields: items (ordered list), itemsByEventGroup (table eventGroup -> list), aggregatedItems (totalPenalty, totalStageTime, totalTime, penaltySummary).
---@class gameplay_rally_loop_rallyEventLog
local gameplay_rally_loop_rallyEventLog = {}

--- Builds the penalty summary by group then by penaltyType.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:115
function gameplay_rally_loop_rallyEventLog:_calcPenaltySummary() end

--- Sum of data.amount of the items of type 'penalty'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:95
function gameplay_rally_loop_rallyEventLog:_calcTotalPenalty() end

--- Sum of data.stageTimeSecs of all items.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:105
function gameplay_rally_loop_rallyEventLog:_calcTotalStageTime() end

--- Adds an entry to the log and to the event's group, then recomputes the aggregates. eventId and eventGroup are 'unknown' if absent.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:19
---@param event table Source event with eventId and eventGroup.
---@param timestamp number Timestamp of the entry.
---@param type string Entry type, for example 'penalty'.
---@param data table Free-form data (amount, penaltyType, stageTimeSecs...).
function gameplay_rally_loop_rallyEventLog:addItem(event, timestamp, type, data) end

--- Empties the log (items and groups) and logs a debug message. The aggregates are not recomputed.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:185
function gameplay_rally_loop_rallyEventLog:clear() end

--- Returns all the items in the order they were added.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:55
---@return table  List of items.
function gameplay_rally_loop_rallyEventLog:getAllItems() end

--- Returns the items of an event group (empty table if none).
---Source: lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:51
---@param eventGroup string Group name.
---@return table  List of items.
function gameplay_rally_loop_rallyEventLog:getItemsByEventGroup(eventGroup) end

--- Returns the items whose type matches.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:59
---@param type string Type searched.
---@return table  List of items.
function gameplay_rally_loop_rallyEventLog:getItemsByType(type) end

--- Penalty summary: {totalPenalty, groups = {{eventGroup, totalPenalty, penalties = {{type, count, amount}}}}}. Groups follow the order of first appearance, penalties are sorted by type.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:91
---@return table  Summary (default {totalPenalty=0, groups={}}).
function gameplay_rally_loop_rallyEventLog:getPenaltySummary() end

--- Returns the items that carry data.stageTimeSecs (one per completed stage).
---Source: lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:69
---@return table  List of items.
function gameplay_rally_loop_rallyEventLog:getStageTimes() end

--- Total penalty in seconds (0 if none).
---Source: lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:79
---@return number  Seconds.
function gameplay_rally_loop_rallyEventLog:getTotalPenalty() end

--- Sum of the stage times in seconds.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:83
---@return number  Seconds.
function gameplay_rally_loop_rallyEventLog:getTotalStageTime() end

--- Stage times plus penalties, in seconds.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:87
---@return number  Seconds.
function gameplay_rally_loop_rallyEventLog:getTotalTime() end

--- Initializes the empty lists. Called by the constructor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:9
function gameplay_rally_loop_rallyEventLog:init() end

--- Recomputes totalPenalty, totalStageTime, totalTime and penaltySummary. Called by addItem.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:43
function gameplay_rally_loop_rallyEventLog:recalculateAggregatedItems() end

