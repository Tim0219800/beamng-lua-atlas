---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/loop/speedingDetector.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Speed detector. Instance fields: manager, currentLimitKph, bufferSize (5), data (circular buffer), writeIndex, count, sampleRate (1 s), penaltyRateLimit (60 s), penalties (list of triggered penalties), maxSpeedOver/maxProbability (60 / 0.05), strictMaxSpeedOver/strictMaxProbability (5 / 0.2), strictMode.
---@class gameplay_rally_loop_speedingDetector
local gameplay_rally_loop_speedingDetector = {}

--- Adds a speed to the circular buffer, overwriting the oldest if needed.
---Source: lua/ge/extensions/gameplay/rally/loop/speedingDetector.lua:42
---@param sample number Speed in km/h.
function gameplay_rally_loop_speedingDetector:addSample(sample) end

--- ImGui window "Speeding Detector Debug": limit, current and average speeds, probability, penalties and samples. Currently never called by update.
---Source: lua/ge/extensions/gameplay/rally/loop/speedingDetector.lua:155
function gameplay_rally_loop_speedingDetector:drawDebug() end

--- Average of the valid samples in the buffer.
---Source: lua/ge/extensions/gameplay/rally/loop/speedingDetector.lua:49
---@return number|nil  km/h, nil if no samples.
function gameplay_rally_loop_speedingDetector:getAverageSpeed() end

--- Speed of player vehicle 0 in km/h (speed norm * 3.6).
---Source: lua/ge/extensions/gameplay/rally/loop/speedingDetector.lua:35
---@return number|nil  km/h, nil if there is no player vehicle.
function gameplay_rally_loop_speedingDetector:getCurrentSpeedKph() end

--- Initializes the buffer and parameters. Called by the constructor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/speedingDetector.lua:9
---@param manager table rallyLoopManager (receives recordSpeedingPenalty).
function gameplay_rally_loop_speedingDetector:init(manager) end

--- Randomly decides whether a penalty is triggered based on the average relative to the limit: linear probability from 0 (at the limit) to maxProbability (at maxSpeedOver above).
---Source: lua/ge/extensions/gameplay/rally/loop/speedingDetector.lua:60
---@param maxSpeedOver number Excess (km/h) to reach the maximum probability.
---@param maxProbability number Maximum probability (0 to 1).
---@return boolean  true if the penalty is triggered.
---@return number  Probability used (0 to 1).
function gameplay_rally_loop_speedingDetector:stochasticPenalty(maxSpeedOver, maxProbability) end

--- Call every frame. Accumulates time, takes a sample every second and, if the 60 s delay has elapsed, draws a penalty; on a penalty, stores {averageSpeed, instantSpeed, speedLimit, speedOver, probability, strictMode} and calls manager:recordSpeedingPenalty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/speedingDetector.lua:86
---@param dtSim number Elapsed simulation time, in seconds.
---@param limitKph number|nil Speed limit in km/h (nil = no limit, never a penalty).
---@param strictMode boolean|nil true to use the strict parameters.
function gameplay_rally_loop_speedingDetector:update(dtSim, limitKph, strictMode) end

