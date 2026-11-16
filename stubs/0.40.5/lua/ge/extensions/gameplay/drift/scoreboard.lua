---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/scoreboard.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accumulates the statistics of a drift challenge for the end screen: score and number of drifts per tier, quick messages obtained, and performance statistics (average speed, angle, performance factor, distance, duration, max combo). The stats reset to zero at the first onUpdate and via reset(). Also provides a small imgui debug window.
--- Access: extension `gameplay_drift_scoreboard`: `extensions.load("gameplay_drift_scoreboard")`, then the global `gameplay_drift_scoreboard`
---@class gameplay_drift_scoreboard
gameplay_drift_scoreboard = {}

--- Returns {default=false, canBeChanged=true} for the drift debug window.
---Source: lua/ge/extensions/gameplay/drift/scoreboard.lua:119
---@return table  {default = false, canBeChanged = true}
function gameplay_drift_scoreboard.getDriftDebugInfo() end

--- Returns the stats per quick message.
---Source: lua/ge/extensions/gameplay/drift/scoreboard.lua:198
---@return table<string, {count:integer, totalScoreEarned:number, msg:string}>  Keyed by quick message id.
function gameplay_drift_scoreboard.getDriftEventStats() end

--- Compiles the performance statistics on demand (averages computed at the call, not every frame), formatted for the UI and translated (missions.drift.stats.<name>).
---Source: lua/ge/extensions/gameplay/drift/scoreboard.lua:148
---@return table<string, {order:integer, value:string|number, name:string}>  Keys: avrgDriftPerformanceFactor, avrgDriftSpeed, avrgDriftAngle, maxDriftAngle, maxDriftCombo, totalDriftDist, totalIndividualDrifts, totalDriftDuration.
function gameplay_drift_scoreboard.getPerformanceStats() end

--- Returns the stats per tier.
---Source: lua/ge/extensions/gameplay/drift/scoreboard.lua:194
---@return table<string, {totalScore:number, count:integer, name:string, order:integer}>  Keyed by tier id.
function gameplay_drift_scoreboard.getTiersStats() end

--- Hook: at the end of an individual drift, accumulates speeds, performance factors, angles, duration and distance into the raw stats.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/scoreboard.lua:87
---@param data table {totalSpeeds, totalSteps, totalPerformanceFactors, totalAngles, totalDriftTime, driftDistance}.
function gameplay_drift_scoreboard.onDriftActiveDataFinished(data) end

--- Hook: validates the pending quick messages, updates the max combo and adds the score (excluding quick messages) and the count to the drift's tier.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/scoreboard.lua:68
---@param data table {combo, tier = {id}, addedScore}.
function gameplay_drift_scoreboard.onDriftCompletedScored(data) end

--- Hook: a crash cancels the pending quick messages.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/scoreboard.lua:206
function gameplay_drift_scoreboard.onDriftCrash() end

--- Hook: queues a reached quick message (counter and reward); it is only validated at the end of the scored drift.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/scoreboard.lua:53
---@param data table {quickMessageId, reward}.
function gameplay_drift_scoreboard.onDriftQuickMessageReached(data) end

--- Hook: a spinout cancels the pending quick messages.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/scoreboard.lua:210
function gameplay_drift_scoreboard.onDriftSpinout() end

--- Called every frame: on the first call does reset(), then shows the imgui debug window if enabled.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/scoreboard.lua:44
function gameplay_drift_scoreboard.onUpdate() end

--- Resets the performance stats, recreates the tier entries (from gameplay_drift_scoring.getDriftTiers) and quick message entries (from gameplay_drift_quickMessages.getQuickMessages).
---Source: lua/ge/extensions/gameplay/drift/scoreboard.lua:104
function gameplay_drift_scoreboard.reset() end

