---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua (instanciée par la fonction renvoyée par le module)
---@class gameplay_rally_stage_stageTimingState
local gameplay_rally_stage_stageTimingState = {}

---Source : lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:50
---@param seconds any
function gameplay_rally_stage_stageTimingState:addTime(seconds) end

---Source : lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:39
---@param dt any
function gameplay_rally_stage_stageTimingState:advance(dt) end

---Source : lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:60
---@param time any
function gameplay_rally_stage_stageTimingState:completeAt(time) end

---Source : lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:143
function gameplay_rally_stage_stageTimingState:getFrameDt() end

---Source : lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:139
function gameplay_rally_stage_stageTimingState:getFrameStartTime() end

---Source : lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:123
function gameplay_rally_stage_stageTimingState:getSplitOrder() end

---Source : lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:119
function gameplay_rally_stage_stageTimingState:getSplitTimes() end

---Source : lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:147
function gameplay_rally_stage_stageTimingState:getState() end

---Source : lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:135
function gameplay_rally_stage_stageTimingState:getTime() end

---Source : lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:7
function gameplay_rally_stage_stageTimingState:init() end

---Source : lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:127
function gameplay_rally_stage_stageTimingState:isActive() end

---Source : lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:131
function gameplay_rally_stage_stageTimingState:isComplete() end

---Source : lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:95
---@param splitData any
---@param reason any
function gameplay_rally_stage_stageTimingState:markSplitMissing(splitData, reason) end

---Source : lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:68
---@param splitData any
---@param time any
---@param source any
function gameplay_rally_stage_stageTimingState:recordSplit(splitData, time, source) end

---Source : lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:11
function gameplay_rally_stage_stageTimingState:reset() end

---Source : lua/ge/extensions/gameplay/rally/stage/stageTimingState.lua:23
---@param active any
function gameplay_rally_stage_stageTimingState:setActive(active) end

