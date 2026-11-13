---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/codriverTiming.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_rally_codriverTiming` : `extensions.load("gameplay_rally_codriverTiming")`, puis la globale `gameplay_rally_codriverTiming`
---@class gameplay_rally_codriverTiming
gameplay_rally_codriverTiming = {}

---Source : lua/ge/extensions/gameplay/rally/codriverTiming.lua:28
function gameplay_rally_codriverTiming.config() end

---Source : lua/ge/extensions/gameplay/rally/codriverTiming.lua:42
---@param speedMph any
---@param enableSpeedScaling any
---@param offsetSeconds any
function gameplay_rally_codriverTiming.delayForSpeed(speedMph, enableSpeedScaling, offsetSeconds) end

---Source : lua/ge/extensions/gameplay/rally/codriverTiming.lua:36
---@param enableSpeedScaling any
---@param offsetSeconds any
function gameplay_rally_codriverTiming.maxDelay(enableSpeedScaling, offsetSeconds) end

---Source : lua/ge/extensions/gameplay/rally/codriverTiming.lua:32
---@param offsetSeconds any
function gameplay_rally_codriverTiming.minDelay(offsetSeconds) end

--- shift the delay range by `tick` seconds. only the min (rallyCodriverTiming setting)
---  moves; the max follows via the offset, so nothing needs to be re-saved. returns newMin, newMax.
---Source : lua/ge/extensions/gameplay/rally/codriverTiming.lua:54
---@param tick any
function gameplay_rally_codriverTiming.nudge(tick) end

