# `core_lapTimes`

*File: `lua/ge/extensions/core/lapTimes.lua` · VM: Game Engine (GE) · 679 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_lapTimes`: `extensions.load("core_lapTimes")`, then the global `core_lapTimes`

GE extension `core_lapTimes`: prepares for the UI (lap times app) the timers of a "race" race system race: current time, current lap and segment, history of laps and segments, best times, gaps to the previous/best. It is fed by the update*FromRace(race, playerId) functions called by the race engine, stores the results in four tables (fast, slow, static, placements) and sends them to the UI in onUpdate as guihooks streams `lapTimes_fast`, `lapTimes_slow`, `lapTimes_static`, `lapTimes_placement`.

## Notes

- Status: 'stopped', 'started', 'paused', 'complete' (inferred from race.suspended, race.started, state.complete in updateSlowFromRace).
- Time format: formatTime(s) gives 'MM:SS.mmm' (minutes on at least 2 digits, milliseconds truncated); with addSign true, a '+' or '-' is added (gaps). getDiffFlavor returns 'worse' (>0, slower), 'better' (<0), 'same' (=0); in the streams the values without a gap have the flavor 'default'.
- Data read from race: race.time, race.suspended, race.started, race.lapCount, race.path.pathnodes.sorted (segments), race.path.config.closed, race.states[playerId] with startTime, endTime, complete, currentLap (0-based), currentTimes[] (segments of the current lap), historicTimes[] (finished laps: lap, beginTime, endTime, duration, segmentTimes[]). Times are in seconds.
- Fast stream: currentTime (from state.startTime), currentLapTime, currentSegmentTime and their *Formatted versions. Slow stream: status, currentLap/currentSegment (1-based), bestLapTimeFormatted, bestLapIndex, bestSegmentTimesFormatted, lapTimes, segmentTimes, combinedTimes. Static stream: totalLaps, totalSegments, closedCircuit. Placement stream: placements, order (left empty).
- A lap/segment is only marked 'best' if several laps/instances exist to compare.
- Inconsistencies: the fields currentLapDiffToBest*, currentLapDiffToPrevious*, currentSegmentDiffTo* of the fast stream are always set to nil (never computed); updatePlacementFromRace builds nothing (TODO in the code); the circuit closure configuration is not read at the same place depending on the path: onRaceStart(meta) reads meta.pathConfig.isClosed, newRaceStart and updateStaticFromRace read race.path.config.closed; the automatic function list reports onRaceStart(), but it is an empty non-exported local function defined at the end of the file (as are onRaceWaypointReached and onRaceResult): the real M.onRaceStart is the one that takes meta; the playerId parameter of updateStaticFromRace and updatePlacementFromRace is unused.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_lapTimes.formatTime(timeInSeconds, addSign)` | Formats a time in seconds as MM:SS.mmm; with addSign, prefixes '+' (>= 0) or '-' for gaps. | 92 |
| `core_lapTimes.getDiffFlavor(val)` | Qualifies a time gap for display. | 109 |
| `core_lapTimes.initialize()` | Resets the whole state (status 'stopped', laps, segments, best times, stream tables) and requests a full send of the four streams to the UI. | 53 |
| `core_lapTimes.newRaceStart(race)` | New race system hook: configures totalLaps, totalSegments (number of sorted pathnodes) and closedCircuit from the race object. | 641 |
| `core_lapTimes.newRaceStop()` | New race system hook: calls onRaceStop. | 654 |
| `core_lapTimes.onRaceStart()` | Starts tracking a race: calls initialize then reads the number of laps and segments from meta, sets the status to 'started' and requests the sending of the four streams. No effect if meta is nil. *(hook)* | 665 |
| `core_lapTimes.onRaceStop()` | Sets the status to 'stopped' and requests the sending of the four streams. *(hook)* | 147 |
| `core_lapTimes.onUpdate(dtReal, dtSim, dtRaw)` | Per-frame hook: sends to the UI (guihooks.queueStream) the streams marked as to be sent then clears the flags. *(internal)* *(hook)* | 595 |
| `core_lapTimes.setConfiguration(config)` | Updates totalLaps, totalSegments and closedCircuit for the fields present in config. | 120 |
| `core_lapTimes.updateFastFromRace(race, playerId)` | Computes the fast values for a player: time since start, current lap and segment duration (with the end time frozen when the race is finished) and prepares the fast stream. | 156 |
| `core_lapTimes.updatePlacementFromRace(race, playerId)` | Clears and prepares the placements stream (empty: feature not implemented, TODO in the code). | 572 |
| `core_lapTimes.updateSlowFromRace(race, playerId)` | Recomputes the history for a player: status, current lap/segment, best lap, best segments by index, diffs, lapTimes/segmentTimes/combinedTimes lists and prepares the slow stream. | 242 |
| `core_lapTimes.updateStaticFromRace(race, playerId)` | Updates the static values (number of laps, number of segments, closed circuit) from the race and prepares the static stream. | 546 |

### Parameter details

#### `core_lapTimes.formatTime(timeInSeconds, addSign)`

Formats a time in seconds as MM:SS.mmm; with addSign, prefixes '+' (>= 0) or '-' for gaps.

- `timeInSeconds` (*number|nil*) : Time in seconds (negative accepted with addSign).
- `addSign` (*boolean|nil*) : true = adds the sign.
- **returns**: string|nil Formatted text; nil if timeInSeconds is nil.

#### `core_lapTimes.getDiffFlavor(val)`

Qualifies a time gap for display.

- `val` (*number*) : Gap in seconds (positive = slower).
- **returns**: string 'worse', 'better' or 'same'.

#### `core_lapTimes.newRaceStart(race)`

New race system hook: configures totalLaps, totalSegments (number of sorted pathnodes) and closedCircuit from the race object.

- `race` (*table*) : Race object (lapCount, path.pathnodes.sorted, path.config.closed).

#### `core_lapTimes.onRaceStart()`

Starts tracking a race: calls initialize then reads the number of laps and segments from meta, sets the status to 'started' and requests the sending of the four streams. No effect if meta is nil.


#### `core_lapTimes.onUpdate(dtReal, dtSim, dtRaw)`

Per-frame hook: sends to the UI (guihooks.queueStream) the streams marked as to be sent then clears the flags.

- `dtReal` (*number*) : Not used.
- `dtSim` (*number*) : Not used.
- `dtRaw` (*number*) : Not used.

#### `core_lapTimes.setConfiguration(config)`

Updates totalLaps, totalSegments and closedCircuit for the fields present in config.

- `config` (*table*) : {totalLaps?, totalSegments?, closedCircuit?}.

#### `core_lapTimes.updateFastFromRace(race, playerId)`

Computes the fast values for a player: time since start, current lap and segment duration (with the end time frozen when the race is finished) and prepares the fast stream.

- `race` (*table*) : Race object.
- `playerId` (*integer*) : Key of race.states.

#### `core_lapTimes.updatePlacementFromRace(race, playerId)`

Clears and prepares the placements stream (empty: feature not implemented, TODO in the code).

- `race` (*table*) : Race object.
- `playerId` (*integer*) : Not used.

#### `core_lapTimes.updateSlowFromRace(race, playerId)`

Recomputes the history for a player: status, current lap/segment, best lap, best segments by index, diffs, lapTimes/segmentTimes/combinedTimes lists and prepares the slow stream.

- `race` (*table*) : Race object.
- `playerId` (*integer*) : Key of race.states.

#### `core_lapTimes.updateStaticFromRace(race, playerId)`

Updates the static values (number of laps, number of segments, closed circuit) from the race and prepares the static stream.

- `race` (*table*) : Race object.
- `playerId` (*integer*) : Not used.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/lapTimes.lua`.*
