---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/loop/penalties.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_rally_loop_penalties` : `extensions.load("gameplay_rally_loop_penalties")`, puis la globale `gameplay_rally_loop_penalties`
---@class gameplay_rally_loop_penalties
---@field falseStartPenaltySeconds number
---@field timeControlPenaltySecondsPerMinute number
gameplay_rally_loop_penalties = {}

--- Calculate penalty for early arrival
---  Penalty per minute or fraction thereof (see timeControlPenaltySecondsPerMinute)
---  minutesEarly: number of full minutes early
---  Returns: penalty value
---Source : lua/ge/extensions/gameplay/rally/loop/penalties.lua:14
---@param minutesEarly any
function gameplay_rally_loop_penalties.calculateEarlyPenalty(minutesEarly) end

---Source : lua/ge/extensions/gameplay/rally/loop/penalties.lua:26
---@param falseStartCount any
function gameplay_rally_loop_penalties.calculateFalseStartPenalty(falseStartCount) end

--- Calculate penalty for late arrival
---  Penalty per minute or fraction thereof (see timeControlPenaltySecondsPerMinute)
---  minutesLate: number of full minutes late
---  Returns: penalty value
---Source : lua/ge/extensions/gameplay/rally/loop/penalties.lua:22
---@param minutesLate any
function gameplay_rally_loop_penalties.calculateLatePenalty(minutesLate) end

--- Determine if arrival at checkpoint is early, on-time, or late
---  actualTime: actual arrival epoch time in seconds
---  scheduledTime: scheduled epoch time in seconds (can be nil)
---  Returns: table with fields:
---    - status: "early"|"on-time"|"late"
---    - totalPenalty: sum of all penalty amounts (denormalized for performance)
---    - hasPenalty: boolean
---    - penalties: array of individual penalty objects with structured data for i18n
---Source : lua/ge/extensions/gameplay/rally/loop/penalties.lua:38
---@param actualTime any
---@param scheduledTime any
function gameplay_rally_loop_penalties.getTimingStatus(actualTime, scheduledTime) end

