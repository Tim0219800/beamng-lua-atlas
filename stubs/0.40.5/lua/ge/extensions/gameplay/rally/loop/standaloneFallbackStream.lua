---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/loop/standaloneFallbackStream.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fallback data stream for the rally stage UI apps when no rally loop feeds them (stage launched on its own, "standalone"). It keeps the latest data received from a countdown node (active state, countdown, vehicle proximity, clock) and completes it with the stage data from the rally manager (gameplay_rally.getRallyManager():getActiveStageData()), the environment clock, the theme colors and the rallyShowStageApps setting. getStreamData returns the table to send to the UI.
--- Access: extension `gameplay_rally_loop_standaloneFallbackStream`: `extensions.load("gameplay_rally_loop_standaloneFallbackStream")`, then the global `gameplay_rally_loop_standaloneFallbackStream`
---@class gameplay_rally_loop_standaloneFallbackStream
gameplay_rally_loop_standaloneFallbackStream = {}

--- Clears the whole fallback stream state (data, delays, clock, reset flag).
---Source: lua/ge/extensions/gameplay/rally/loop/standaloneFallbackStream.lua:191
function gameplay_rally_loop_standaloneFallbackStream.clear() end

--- Builds the stream table for the UI: activeState, rallyClock, stageData, scheduleData, vehicleProximity, countdownData, showStageApps, uiColors. Chooses between the updated fallback stream, the stand-alone stage data (stageActive state) or an inactive state with reset data.
---Source: lua/ge/extensions/gameplay/rally/loop/standaloneFallbackStream.lua:211
---@param now number|nil Current time (RallyUtil.getTime() or os.clockhp() by default).
---@return table  Stream data.
function gameplay_rally_loop_standaloneFallbackStream.getStreamData(now) end

--- Indicates whether the stream should be used: fallback data exists or a stage is active on the rally manager side.
---Source: lua/ge/extensions/gameplay/rally/loop/standaloneFallbackStream.lua:201
---@return boolean  true if active.
function gameplay_rally_loop_standaloneFallbackStream.isActive() end

--- Hook called when settings change: rereads rallyShowStageApps (true by default).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/standaloneFallbackStream.lua:54
function gameplay_rally_loop_standaloneFallbackStream.onSettingsChanged() end

--- Advances the local wall clock (fallbackClockSecs) by dtSim seconds, modulo 86400, if it was initialized by a node.
---Source: lua/ge/extensions/gameplay/rally/loop/standaloneFallbackStream.lua:205
---@param dtSim number Elapsed simulation time, in seconds.
function gameplay_rally_loop_standaloneFallbackStream.updateClock(dtSim) end

--- Records a data packet coming from a node (activeState, vehicleProximity, countdownData, rallyClock, resetFallbackStreamData) and manages the countdown protection delays and the GO display delay.
---Source: lua/ge/extensions/gameplay/rally/loop/standaloneFallbackStream.lua:279
---@param data table|nil Node packet; ignored if nil.
function gameplay_rally_loop_standaloneFallbackStream.updateStreamData(data) end

