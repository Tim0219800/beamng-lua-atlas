---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/modules/timerModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/flowgraph/modules/timerModule.lua
---@class flowgraph_modules_timerModule_C
local flowgraph_modules_timerModule_C = {}

--- adds a new timer.
---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:38
---@param data any
function flowgraph_modules_timerModule_C:addTimer(data) end

--- called at the end, finalizing all the merge strats.
---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:112
function flowgraph_modules_timerModule_C:afterTrigger() end

---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:18
function flowgraph_modules_timerModule_C:clear() end

---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:134
function flowgraph_modules_timerModule_C:executionStopped() end

--- gets the elapsed time on a timer.
---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:92
---@param id any
function flowgraph_modules_timerModule_C:getElapsedTime(id) end

---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:8
function flowgraph_modules_timerModule_C:getFreeId() end

--- gets the global time depending on the mode.
---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:30
---@param mode any
function flowgraph_modules_timerModule_C:getGlobalTime(mode) end

--- gets the full timer object.
---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:58
---@param id any
function flowgraph_modules_timerModule_C:getTimer(id) end

---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:13
function flowgraph_modules_timerModule_C:init() end

--- checks if the timer is complete.
---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:101
---@param id any
function flowgraph_modules_timerModule_C:isComplete(id) end

---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:105
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function flowgraph_modules_timerModule_C:onUpdate(dtReal, dtSim, dtRaw) end

--- sets some field for the timer, using the variables.
---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:61
---@param id any
---@param field any
---@param val any
function flowgraph_modules_timerModule_C:set(id, field, val) end

--- sets the elapsed time on a timer.
---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:74
---@param id any
---@param time any
function flowgraph_modules_timerModule_C:setElapsedTime(id, time) end

--- sets the desired mode of the timer
---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:83
---@param id any
---@param mode any
function flowgraph_modules_timerModule_C:setMode(id, mode) end

--- pauses or unpauses a timer.
---Source : lua/ge/extensions/flowgraph/modules/timerModule.lua:64
---@param id any
---@param val any
function flowgraph_modules_timerModule_C:setPause(id, val) end

