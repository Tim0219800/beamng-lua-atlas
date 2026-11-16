---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/stage/stageObserver.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Observer object returned by the constructor; optional options: authorityMode, checkWindowBehindMeters, checkWindowAheadMeters, missWindowBehindMeters.
---@class gameplay_rally_stage_stageObserver
local gameplay_rally_stage_stageObserver = {}

--- Returns the current authority mode.
---Source: lua/ge/extensions/gameplay/rally/stage/stageObserver.lua:151
---@return string  'tracker' or 'shadow'
function gameplay_rally_stage_stageObserver:getAuthorityMode() end

--- Stage end time if known, otherwise last sampled stage time.
---Source: lua/ge/extensions/gameplay/rally/stage/stageObserver.lua:325
---@return number|nil  seconds
function gameplay_rally_stage_stageObserver:getStageTime() end

--- Snapshot: authorityMode, stageComplete, stageFinishTime, currentStageTime, currentStageTimeRounded (to the tenth), trackerState, raceActive, raceComplete.
---Source: lua/ge/extensions/gameplay/rally/stage/stageObserver.lua:330
---@return table  State
function gameplay_rally_stage_stageObserver:getState() end

--- Initializes the authority mode, the window sizes and the corner storage, then calls reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/stage/stageObserver.lua:137
---@param options table|nil See the class description
function gameplay_rally_stage_stageObserver:init(options) end

--- Fills in splitData.time and splitData.source ('race') if they are absent.
---Source: lua/ge/extensions/gameplay/rally/stage/stageObserver.lua:220
---@param splitData table|nil Split data
---@param time number Split time in seconds
function gameplay_rally_stage_stageObserver:recordRaceSplit(splitData, time) end

--- Resets the previous distance, the observation start index, the previous footprint, the stage end state, the last values and the updateSerial counter.
---Source: lua/ge/extensions/gameplay/rally/stage/stageObserver.lua:155
function gameplay_rally_stage_stageObserver:reset() end

--- Forgets the previous distance and footprint to avoid a false crossing after a teleport.
---Source: lua/ge/extensions/gameplay/rally/stage/stageObserver.lua:173
function gameplay_rally_stage_stageObserver:resetAfterTeleport() end

--- Forgets the previous footprint: the next update only stores it, without detecting any crossing.
---Source: lua/ge/extensions/gameplay/rally/stage/stageObserver.lua:169
function gameplay_rally_stage_stageObserver:resetFootprint() end

--- Sets the authority mode: 'tracker' or, for any other value, 'shadow'.
---Source: lua/ge/extensions/gameplay/rally/stage/stageObserver.lua:147
---@param mode string 'tracker' or 'shadow'
function gameplay_rally_stage_stageObserver:setAuthorityMode(mode) end

--- Updates the observation for the frame: reads the stage time, gets the vehicle corners, advances the observation window, tests the crossing of nearby pathnodes and updates trackerObserved/trackerMissed, trackerTime, time and source, as well as stageTimingState.
---Source: lua/ge/extensions/gameplay/rally/stage/stageObserver.lua:226
---@param context table {tracker (distFromStart, state), pathnodeObservationList (or splitList), vehId, raceData, stageTime, stageFrameStartTime, stageFrameDt, stageTimingState}
function gameplay_rally_stage_stageObserver:update(context) end

