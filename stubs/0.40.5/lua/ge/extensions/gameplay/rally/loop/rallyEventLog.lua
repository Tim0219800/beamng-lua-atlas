---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua (instanciée par la fonction renvoyée par le module)
---@class gameplay_rally_loop_rallyEventLog
local gameplay_rally_loop_rallyEventLog = {}

---Source : lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:115
function gameplay_rally_loop_rallyEventLog:_calcPenaltySummary() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:95
function gameplay_rally_loop_rallyEventLog:_calcTotalPenalty() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:105
function gameplay_rally_loop_rallyEventLog:_calcTotalStageTime() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:19
---@param event any
---@param timestamp any
---@param type any
---@param data any
function gameplay_rally_loop_rallyEventLog:addItem(event, timestamp, type, data) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:185
function gameplay_rally_loop_rallyEventLog:clear() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:55
function gameplay_rally_loop_rallyEventLog:getAllItems() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:51
---@param eventGroup any
function gameplay_rally_loop_rallyEventLog:getItemsByEventGroup(eventGroup) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:59
---@param type any
function gameplay_rally_loop_rallyEventLog:getItemsByType(type) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:91
function gameplay_rally_loop_rallyEventLog:getPenaltySummary() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:69
function gameplay_rally_loop_rallyEventLog:getStageTimes() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:79
function gameplay_rally_loop_rallyEventLog:getTotalPenalty() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:83
function gameplay_rally_loop_rallyEventLog:getTotalStageTime() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:87
function gameplay_rally_loop_rallyEventLog:getTotalTime() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:9
function gameplay_rally_loop_rallyEventLog:init() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyEventLog.lua:43
function gameplay_rally_loop_rallyEventLog:recalculateAggregatedItems() end

