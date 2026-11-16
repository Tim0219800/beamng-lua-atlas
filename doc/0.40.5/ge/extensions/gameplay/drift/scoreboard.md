# `gameplay_drift_scoreboard`

*File: `lua/ge/extensions/gameplay/drift/scoreboard.lua` · VM: Game Engine (GE) · 230 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_drift_scoreboard`: `extensions.load("gameplay_drift_scoreboard")`, then the global `gameplay_drift_scoreboard`

Accumulates the statistics of a drift challenge for the end screen: score and number of drifts per tier, quick messages obtained, and performance statistics (average speed, angle, performance factor, distance, duration, max combo). The stats reset to zero at the first onUpdate and via reset(). Also provides a small imgui debug window.

## Notes

- The score hooks ignore events when general drift is paused or frozen (gameplay_drift_general.getPaused/getFrozen).
- The quick messages' score is subtracted from the tier's score (multiplied by the combo) so as not to be counted twice.
- getPerformanceStats divides by counters that are 0 before the first drift: the averages then give NaN; and table.sort on the compiledStats table (text keys) sorts nothing, the order is carried by the order field.
- The average speed is converted from km/h to m/s (/3.6) before translateVelocity; the distance goes through translateDistance.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_drift_scoreboard.getDriftDebugInfo()` | Returns {default=false, canBeChanged=true} for the drift debug window. | 119 |
| `gameplay_drift_scoreboard.getDriftEventStats()` | Returns the stats per quick message. | 198 |
| `gameplay_drift_scoreboard.getPerformanceStats()` | Compiles the performance statistics on demand (averages computed at the call, not every frame), formatted for the UI and translated (missions.drift.stats.<name>). | 148 |
| `gameplay_drift_scoreboard.getTiersStats()` | Returns the stats per tier. | 194 |
| `gameplay_drift_scoreboard.onDriftActiveDataFinished(data)` | Hook: at the end of an individual drift, accumulates speeds, performance factors, angles, duration and distance into the raw stats. *(internal)* *(hook)* | 87 |
| `gameplay_drift_scoreboard.onDriftCompletedScored(data)` | Hook: validates the pending quick messages, updates the max combo and adds the score (excluding quick messages) and the count to the drift's tier. *(internal)* *(hook)* | 68 |
| `gameplay_drift_scoreboard.onDriftCrash()` | Hook: a crash cancels the pending quick messages. *(internal)* *(hook)* | 206 |
| `gameplay_drift_scoreboard.onDriftQuickMessageReached(data)` | Hook: queues a reached quick message (counter and reward); it is only validated at the end of the scored drift. *(internal)* *(hook)* | 53 |
| `gameplay_drift_scoreboard.onDriftSpinout()` | Hook: a spinout cancels the pending quick messages. *(internal)* *(hook)* | 210 |
| `gameplay_drift_scoreboard.onUpdate()` | Called every frame: on the first call does reset(), then shows the imgui debug window if enabled. *(internal)* *(hook)* | 44 |
| `gameplay_drift_scoreboard.reset()` | Resets the performance stats, recreates the tier entries (from gameplay_drift_scoring.getDriftTiers) and quick message entries (from gameplay_drift_quickMessages.getQuickMessages). | 104 |

### Parameter details

#### `gameplay_drift_scoreboard.getDriftDebugInfo()`

Returns {default=false, canBeChanged=true} for the drift debug window.

- **returns**: table {default = false, canBeChanged = true}

#### `gameplay_drift_scoreboard.getDriftEventStats()`

Returns the stats per quick message.

- **returns**: table<string, {count:integer, totalScoreEarned:number, msg:string}> Keyed by quick message id.

#### `gameplay_drift_scoreboard.getPerformanceStats()`

Compiles the performance statistics on demand (averages computed at the call, not every frame), formatted for the UI and translated (missions.drift.stats.<name>).

- **returns**: table<string, {order:integer, value:string|number, name:string}> Keys: avrgDriftPerformanceFactor, avrgDriftSpeed, avrgDriftAngle, maxDriftAngle, maxDriftCombo, totalDriftDist, totalIndividualDrifts, totalDriftDuration.

#### `gameplay_drift_scoreboard.getTiersStats()`

Returns the stats per tier.

- **returns**: table<string, {totalScore:number, count:integer, name:string, order:integer}> Keyed by tier id.

#### `gameplay_drift_scoreboard.onDriftActiveDataFinished(data)`

Hook: at the end of an individual drift, accumulates speeds, performance factors, angles, duration and distance into the raw stats.

- `data` (*table*) : {totalSpeeds, totalSteps, totalPerformanceFactors, totalAngles, totalDriftTime, driftDistance}.

#### `gameplay_drift_scoreboard.onDriftCompletedScored(data)`

Hook: validates the pending quick messages, updates the max combo and adds the score (excluding quick messages) and the count to the drift's tier.

- `data` (*table*) : {combo, tier = {id}, addedScore}.

#### `gameplay_drift_scoreboard.onDriftQuickMessageReached(data)`

Hook: queues a reached quick message (counter and reward); it is only validated at the end of the scored drift.

- `data` (*table*) : {quickMessageId, reward}.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/drift/scoreboard.lua`.*
