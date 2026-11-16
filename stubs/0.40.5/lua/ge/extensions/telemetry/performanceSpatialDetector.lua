---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/performanceSpatialDetector.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Performance dip detector for the performanceSpatial tracker. It follows an exponential moving average of the frame time (baseline, alpha 0.05) and opens an episode when the FPS drops below an absolute threshold or when the frame time exceeds baseline * ratio. The episode ends on return to normal and only produces an event if it lasted long enough. A cooldown delay and a per-session event cap limit the noise.
--- Access: extension `telemetry_performanceSpatialDetector`: `extensions.load("telemetry_performanceSpatialDetector")`, then the global `telemetry_performanceSpatialDetector`
---@class telemetry_performanceSpatialDetector
telemetry_performanceSpatialDetector = {}

--- Creates a detector.
---Source: lua/ge/extensions/telemetry/performanceSpatialDetector.lua:107
---@param config table dipFpsThreshold, dipFrameTimeRatio, dipMinDurationMs, dipCooldownSeconds, maxDipEventsPerSession, maxEpisodeMs (optional).
---@return Detector  Detector instance.
function telemetry_performanceSpatialDetector.new(config) end

--- Detector returned by new(config).
---@class telemetry_performanceSpatialDetector_Detector
local telemetry_performanceSpatialDetector_Detector = {}

--- True if the cooldown delay has elapsed and the session's event cap is not reached.
---Source: lua/ge/extensions/telemetry/performanceSpatialDetector.lua:58
---@param nowMs number Current time in ms.
---@return boolean  true if a new episode can be opened.
function telemetry_performanceSpatialDetector_Detector:canReport(nowMs) end

--- Forces the end of the open episode and returns its event if it lasted at least dipMinDurationMs.
---Source: lua/ge/extensions/telemetry/performanceSpatialDetector.lua:62
---@param nowMs number Current time in ms.
---@return table|nil  Event {durationMs, worstAgoMs, baselineFrameMs, trigger, thresholds...} or nil.
function telemetry_performanceSpatialDetector_Detector:finish(nowMs) end

--- Forgets the baseline and the current episode.
---Source: lua/ge/extensions/telemetry/performanceSpatialDetector.lua:53
function telemetry_performanceSpatialDetector_Detector:reset() end

--- Processes a sample. Returns a "capture this frame" boolean (episode start or new worst frame time) then possibly the event of a finished episode. Outside an episode, updates the baseline.
---Source: lua/ge/extensions/telemetry/performanceSpatialDetector.lua:66
---@param nowMs number Current time in ms.
---@param fps number Instantaneous FPS.
---@param frameMs number Frame duration in ms.
---@param absoluteAllowed boolean|nil false if the FPS cap is intentional (the absolute trigger is then ignored).
---@return boolean  true if a snapshot must be captured.
---@return table|nil  End-of-episode event.
function telemetry_performanceSpatialDetector_Detector:update(nowMs, fps, frameMs, absoluteAllowed) end

