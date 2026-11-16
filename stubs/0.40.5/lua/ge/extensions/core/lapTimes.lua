---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/lapTimes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_lapTimes`: prepares for the UI (lap times app) the timers of a "race" race system race: current time, current lap and segment, history of laps and segments, best times, gaps to the previous/best. It is fed by the update*FromRace(race, playerId) functions called by the race engine, stores the results in four tables (fast, slow, static, placements) and sends them to the UI in onUpdate as guihooks streams `lapTimes_fast`, `lapTimes_slow`, `lapTimes_static`, `lapTimes_placement`.
--- Access: extension `core_lapTimes`: `extensions.load("core_lapTimes")`, then the global `core_lapTimes`
---@class core_lapTimes
core_lapTimes = {}

--- Formats a time in seconds as MM:SS.mmm; with addSign, prefixes '+' (>= 0) or '-' for gaps.
---Source: lua/ge/extensions/core/lapTimes.lua:92
---@param timeInSeconds number|nil Time in seconds (negative accepted with addSign).
---@param addSign boolean|nil true = adds the sign.
---@return string|nil  Formatted text; nil if timeInSeconds is nil.
function core_lapTimes.formatTime(timeInSeconds, addSign) end

--- Qualifies a time gap for display.
---Source: lua/ge/extensions/core/lapTimes.lua:109
---@param val number Gap in seconds (positive = slower).
---@return string  'worse', 'better' or 'same'.
function core_lapTimes.getDiffFlavor(val) end

--- Resets the whole state (status 'stopped', laps, segments, best times, stream tables) and requests a full send of the four streams to the UI.
---Source: lua/ge/extensions/core/lapTimes.lua:53
function core_lapTimes.initialize() end

--- New race system hook: configures totalLaps, totalSegments (number of sorted pathnodes) and closedCircuit from the race object.
---Source: lua/ge/extensions/core/lapTimes.lua:641
---@param race table Race object (lapCount, path.pathnodes.sorted, path.config.closed).
function core_lapTimes.newRaceStart(race) end

--- New race system hook: calls onRaceStop.
---Source: lua/ge/extensions/core/lapTimes.lua:654
function core_lapTimes.newRaceStop() end

--- Starts tracking a race: calls initialize then reads the number of laps and segments from meta, sets the status to 'started' and requests the sending of the four streams. No effect if meta is nil.
---Source: lua/ge/extensions/core/lapTimes.lua:665
function core_lapTimes.onRaceStart() end

--- Sets the status to 'stopped' and requests the sending of the four streams.
---Source: lua/ge/extensions/core/lapTimes.lua:147
function core_lapTimes.onRaceStop() end

--- Per-frame hook: sends to the UI (guihooks.queueStream) the streams marked as to be sent then clears the flags.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/lapTimes.lua:595
---@param dtReal number Not used.
---@param dtSim number Not used.
---@param dtRaw number Not used.
function core_lapTimes.onUpdate(dtReal, dtSim, dtRaw) end

--- Updates totalLaps, totalSegments and closedCircuit for the fields present in config.
---Source: lua/ge/extensions/core/lapTimes.lua:120
---@param config table {totalLaps?, totalSegments?, closedCircuit?}.
function core_lapTimes.setConfiguration(config) end

--- Computes the fast values for a player: time since start, current lap and segment duration (with the end time frozen when the race is finished) and prepares the fast stream.
---Source: lua/ge/extensions/core/lapTimes.lua:156
---@param race table Race object.
---@param playerId integer Key of race.states.
function core_lapTimes.updateFastFromRace(race, playerId) end

--- Clears and prepares the placements stream (empty: feature not implemented, TODO in the code).
---Source: lua/ge/extensions/core/lapTimes.lua:572
---@param race table Race object.
---@param playerId integer Not used.
function core_lapTimes.updatePlacementFromRace(race, playerId) end

--- Recomputes the history for a player: status, current lap/segment, best lap, best segments by index, diffs, lapTimes/segmentTimes/combinedTimes lists and prepares the slow stream.
---Source: lua/ge/extensions/core/lapTimes.lua:242
---@param race table Race object.
---@param playerId integer Key of race.states.
function core_lapTimes.updateSlowFromRace(race, playerId) end

--- Updates the static values (number of laps, number of segments, closed circuit) from the race and prepares the static stream.
---Source: lua/ge/extensions/core/lapTimes.lua:546
---@param race table Race object.
---@param playerId integer Not used.
function core_lapTimes.updateStaticFromRace(race, playerId) end

