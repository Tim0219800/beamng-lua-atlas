---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/codriverTiming.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Computes the rally co-driver delay: the gap (in seconds) between the end of a note announcement and the car's arrival at the corner. The minimum delay comes from the user setting 'rallyCodriverTiming' (plus an offset specific to the voice pack); it increases with speed between startSpeedMph and endSpeedMph up to an extra maxDelayOffsetSeconds. Default values are read from /gameplay/rally/codriverTiming.json.
--- Access: extension `gameplay_rally_codriverTiming`: `extensions.load("gameplay_rally_codriverTiming")`, then the global `gameplay_rally_codriverTiming`
---@class gameplay_rally_codriverTiming
gameplay_rally_codriverTiming = {}

--- Returns the loaded (and cached) configuration: maxDelayOffsetSeconds, startSpeedMph, endSpeedMph.
---Source: lua/ge/extensions/gameplay/rally/codriverTiming.lua:28
---@return table  {maxDelayOffsetSeconds, startSpeedMph, endSpeedMph}.
function gameplay_rally_codriverTiming.config() end

--- Delay for a given speed: minDelay below startSpeedMph, then linear interpolation up to minDelay + maxDelayOffsetSeconds at endSpeedMph (capped).
---Source: lua/ge/extensions/gameplay/rally/codriverTiming.lua:42
---@param speedMph number Vehicle speed in mph.
---@param enableSpeedScaling boolean|nil false to always return the minimum.
---@param offsetSeconds number|nil Voice pack offset.
---@return number  Timeout in seconds.
function gameplay_rally_codriverTiming.delayForSpeed(speedMph, enableSpeedScaling, offsetSeconds) end

--- Maximum delay in seconds (reached at endSpeedMph): minDelay + maxDelayOffsetSeconds, or minDelay if speed scaling is disabled.
---Source: lua/ge/extensions/gameplay/rally/codriverTiming.lua:36
---@param enableSpeedScaling boolean|nil false to disable the speed-related part.
---@param offsetSeconds number|nil Voice pack offset.
---@return number  Maximum delay in seconds.
function gameplay_rally_codriverTiming.maxDelay(enableSpeedScaling, offsetSeconds) end

--- Minimum delay in seconds: rallyCodriverTiming setting + voice pack offset.
---Source: lua/ge/extensions/gameplay/rally/codriverTiming.lua:32
---@param offsetSeconds number|nil Voice pack offset (0 if nil).
---@return number  Minimum delay in seconds.
function gameplay_rally_codriverTiming.minDelay(offsetSeconds) end

--- Shifts the delay range by 'tick' seconds: only the minimum (rallyCodriverTiming setting, clamped to [1, 10]) moves, the maximum follows via the offset. Saves the new setting.
---Source: lua/ge/extensions/gameplay/rally/codriverTiming.lua:54
---@param tick number Change in seconds (positive or negative).
---@return number  New minimum delay.
---@return number  New maximum delay (min + maxDelayOffsetSeconds).
function gameplay_rally_codriverTiming.nudge(tick) end

