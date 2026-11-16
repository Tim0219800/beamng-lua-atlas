---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/modules/timerModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph module (moduleOrder 0) that manages timers. It keeps three cumulative global clocks (real, sim, raw) updated by onUpdate with dtReal, dtSim and dtRaw; each timer references one of them (mode 'dtSim', 'dtReal' or 'dtRaw'), has a start time, a duration (default 5 s) and can be paused. The values are stored in a variableStorage and finalized at the end of the tick.
--- Access: `require("extensions/flowgraph/modules/timerModule")` (file under extensions/ but not a regular extension)
---@class flowgraph_modules_timerModule
flowgraph_modules_timerModule = {}

--- Creates a timer and returns its id. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/timerModule.lua:dyn
---@param data table mode (default 'dtSim'), time (time already elapsed, default 0), duration (default 5)
---@return integer  timer id
function flowgraph_modules_timerModule.addTimer(data) end

--- Called after the graph tick: applies the pending pauses or resumes then finalizes the variables. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/timerModule.lua:dyn
function flowgraph_modules_timerModule.afterTrigger() end

--- Clears variables and timers, resets the global clocks to 0. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/timerModule.lua:dyn
function flowgraph_modules_timerModule.clear() end

--- Called when the project stops: calls clear(). (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/timerModule.lua:dyn
function flowgraph_modules_timerModule.executionStopped() end

--- Returns the elapsed time: frozen value if paused, otherwise the mode's clock minus the start. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/timerModule.lua:dyn
---@param id integer timer id
---@return number  elapsed time (s)
function flowgraph_modules_timerModule.getElapsedTime(id) end

--- Increments and returns a timer id. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/timerModule.lua:dyn
---@return integer  id
function flowgraph_modules_timerModule.getFreeId() end

--- Returns the global clock of the requested mode. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/timerModule.lua:dyn
---@param mode string 'dtSim', 'dtReal' or 'dtRaw'
---@return number  cumulative time (s), 0 if the mode is unknown
function flowgraph_modules_timerModule.getGlobalTime(mode) end

--- Returns the full timer object (start, mode, duration, isPaused...). (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/timerModule.lua:dyn
---@param id integer timer id
---@return table|nil  timer
function flowgraph_modules_timerModule.getTimer(id) end

--- Creates the variableStorage and calls clear(). (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/timerModule.lua:dyn
function flowgraph_modules_timerModule.init() end

--- True if the elapsed time has reached the duration. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/timerModule.lua:dyn
---@param id integer timer id
---@return boolean  completed
function flowgraph_modules_timerModule.isComplete(id) end

--- Called on every manager update: adds dtReal, dtSim and dtRaw to the global clocks. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/timerModule.lua:dyn
---@param dtReal number real time delta (s)
---@param dtSim number simulation time delta (s)
---@param dtRaw number raw time delta (s)
function flowgraph_modules_timerModule.onUpdate(dtReal, dtSim, dtRaw) end

--- Changes a timer field (start, mode, duration) via the variableStorage. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/timerModule.lua:dyn
---@param id integer timer id
---@param field string start, mode or duration
---@param val any new value
function flowgraph_modules_timerModule.set(id, field, val) end

--- Sets a timer's elapsed time (paused: stores the value; otherwise recomputes the start). (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/timerModule.lua:dyn
---@param id integer timer id
---@param time number elapsed time (s)
function flowgraph_modules_timerModule.setElapsedTime(id, time) end

--- Changes the timer's clock mode while keeping the elapsed time (if not paused). (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/timerModule.lua:dyn
---@param id integer timer id
---@param mode string 'dtSim', 'dtReal' or 'dtRaw'
function flowgraph_modules_timerModule.setMode(id, mode) end

--- Pauses or resumes a timer; the effect is applied in afterTrigger. Does nothing if the requested state is already the current one; warns if a flag is already set. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/timerModule.lua:dyn
---@param id integer timer id
---@param val boolean true = pause, false = resume
function flowgraph_modules_timerModule.setPause(id, val) end

--- Local class `C` of lua/ge/extensions/flowgraph/modules/timerModule.lua
---@class flowgraph_modules_timerModule_C
local flowgraph_modules_timerModule_C = {}

--- adds a new timer.
---Source: lua/ge/extensions/flowgraph/modules/timerModule.lua:38
---@param data any
function flowgraph_modules_timerModule_C:addTimer(data) end

--- called at the end, finalizing all the merge strats.
---Source: lua/ge/extensions/flowgraph/modules/timerModule.lua:112
function flowgraph_modules_timerModule_C:afterTrigger() end

---Source: lua/ge/extensions/flowgraph/modules/timerModule.lua:18
function flowgraph_modules_timerModule_C:clear() end

---Source: lua/ge/extensions/flowgraph/modules/timerModule.lua:134
function flowgraph_modules_timerModule_C:executionStopped() end

--- gets the elapsed time on a timer.
---Source: lua/ge/extensions/flowgraph/modules/timerModule.lua:92
---@param id any
function flowgraph_modules_timerModule_C:getElapsedTime(id) end

---Source: lua/ge/extensions/flowgraph/modules/timerModule.lua:8
function flowgraph_modules_timerModule_C:getFreeId() end

--- gets the global time depending on the mode.
---Source: lua/ge/extensions/flowgraph/modules/timerModule.lua:30
---@param mode any
function flowgraph_modules_timerModule_C:getGlobalTime(mode) end

--- gets the full timer object.
---Source: lua/ge/extensions/flowgraph/modules/timerModule.lua:58
---@param id any
function flowgraph_modules_timerModule_C:getTimer(id) end

---Source: lua/ge/extensions/flowgraph/modules/timerModule.lua:13
function flowgraph_modules_timerModule_C:init() end

--- checks if the timer is complete.
---Source: lua/ge/extensions/flowgraph/modules/timerModule.lua:101
---@param id any
function flowgraph_modules_timerModule_C:isComplete(id) end

---Source: lua/ge/extensions/flowgraph/modules/timerModule.lua:105
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function flowgraph_modules_timerModule_C:onUpdate(dtReal, dtSim, dtRaw) end

--- sets some field for the timer, using the variables.
---Source: lua/ge/extensions/flowgraph/modules/timerModule.lua:61
---@param id any
---@param field any
---@param val any
function flowgraph_modules_timerModule_C:set(id, field, val) end

--- sets the elapsed time on a timer.
---Source: lua/ge/extensions/flowgraph/modules/timerModule.lua:74
---@param id any
---@param time any
function flowgraph_modules_timerModule_C:setElapsedTime(id, time) end

--- sets the desired mode of the timer
---Source: lua/ge/extensions/flowgraph/modules/timerModule.lua:83
---@param id any
---@param mode any
function flowgraph_modules_timerModule_C:setMode(id, mode) end

--- pauses or unpauses a timer.
---Source: lua/ge/extensions/flowgraph/modules/timerModule.lua:64
---@param id any
---@param val any
function flowgraph_modules_timerModule_C:setPause(id, val) end

