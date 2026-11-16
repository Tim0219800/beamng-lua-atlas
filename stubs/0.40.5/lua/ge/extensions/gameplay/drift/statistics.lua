---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/statistics.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Records drift statistics in gameplay_statistic (drift/... keys) and unlocks drift achievements. Listens to the drift end, score, spinout and crash hooks; contains no detection logic.
--- Access: extension `gameplay_drift_statistics`: `extensions.load("gameplay_drift_statistics")`, then the global `gameplay_drift_statistics`
---@class gameplay_drift_statistics
gameplay_drift_statistics = {}

--- Hook: at the end of a drift chain, adds the right/left drifts and updates the records for distance, duration and number of chained drifts. Does nothing without data.chainDriftData.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/statistics.lua:15
---@param data table Contains chainDriftData {rightDrifts, leftDrifts, totalDriftDistance, totalDriftTime, chainedDrifts}.
function gameplay_drift_statistics.onDriftCompleted(data) end

--- Hook: adds the earned score to the total, updates the score record and triggers the DRIFT_SINGLE and DRIFT_TOTAL achievements.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/statistics.lua:26
---@param data table Contains addedScore (number, points added by this drift).
function gameplay_drift_statistics.onDriftCompletedScored(data) end

--- Hook: increments drift/crashes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/statistics.lua:42
function gameplay_drift_statistics.onDriftCrash() end

--- Hook: increments drift/spinOuts.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/statistics.lua:38
function gameplay_drift_statistics.onDriftSpinout() end

