# `gameplay_rally_aiCompetitors`

*File: `lua/ge/extensions/gameplay/rally/aiCompetitors.lua` · VM: Game Engine (GE) · 560 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_aiCompetitors`: `extensions.load("gameplay_rally_aiCompetitors")`, then the global `gameplay_rally_aiCompetitors`

Simulates AI competitors for the leaderboard of a rally special stage or loop. The competitors' parameters (skill, consistency, risk, name) and the model coefficients are read from gameplay/rally/aiCompetitorsConfig.json when the module loads. For each competitor, a result (safe, push, minor_incident, major_incident, dnf) is drawn at random, then a time is sampled from a normal distribution anchored on a reference time (by default the 'silverTime' medal). The module also formats the times and builds the rows of the table shown in the UI.

## Example

```lua
local lb = gameplay_rally_aiCompetitors.computeLeaderboard(playerTime, silverTime, 'Moi')
-- lb.rows[i] = {position, name, time, delta, deltaVsLeader, deltaVsAhead, dnf}
gameplay_rally_aiCompetitors.applyOfficialPlayerTotalSeconds(lb, 312.4)
```

## Notes

- Times are in seconds; the texts are formatted 'h:mm:ss.d' / 'm:ss.d' / 's.d' (a single tenth digit, rounded to 0.1 s).
- The results are random (math.random): each call to computeLeaderboard gives a different ranking for the AIs.
- Each incident (minor: 1 to 2, major: 2 to 5) adds 5 s to a competitor's time; a DNF gives a nil time.
- In multi-stage, a DNF on one special stage forces the DNF on all following ones; the sort first places those with the fewest DNF columns.
- If aiCompetitorsConfig.json is not found, PARAMS is nil: the competitor list is empty but the density/weight functions (which use PARAMS) would raise an error if paramTable is not provided.
- The 'general' sub-object of the config JSON is flattened into the parameter table; the competitor list is read from 'competitors' (or 'drivers').

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rally_aiCompetitors.applyOfficialPlayerTotalSeconds(leaderboard, totalSecs)` | Overwrites the player row's total time with the official total from the rally event log (time of all special stages + penalties). In multi-stage updates finalTime/finalDnf, in single stage time/dnf; the deltas are not recomputed. | 521 |
| `gameplay_rally_aiCompetitors.computeLeaderboard(playerTimeOrTimes, silverTimeOrTimes, playerName, playerFinalSortSecs)` | Builds the player + AI competitors ranking. With two numbers: a single special stage. With two arrays of the same length (>= 1): several special stages (loop). Returns {rows = {}} if the inputs are invalid. | 548 |
| `gameplay_rally_aiCompetitors.computeMixtureWeights(paramTable, skill, risk)` | Computes the normalized weights of the 5 possible results (safe, push, minor_incident, major_incident, dnf) for a given skill and risk level. Uses a fixed consistency of 0.5 (with no effect on the weights). | 212 |
| `gameplay_rally_aiCompetitors.getReferenceTime(missionTypeData)` | Returns the reference time (medal designated by referenceStarKey) of a mission, or nil if it is absent or not strictly positive. | 14 |
| `gameplay_rally_aiCompetitors.mixtureDensityTimes(paramTable, referenceSec, skill, consistency, risk, timeLo, timeHi, sampleCount, precomputedWeights)` | Computes the density of the Gaussian mixture of finish times (preview for the editor). Uses the same weights and means/standard deviations as the sampling; the DNF has no density. | 177 |

### Parameter details

#### `gameplay_rally_aiCompetitors.applyOfficialPlayerTotalSeconds(leaderboard, totalSecs)`

Overwrites the player row's total time with the official total from the rally event log (time of all special stages + penalties). In multi-stage updates finalTime/finalDnf, in single stage time/dnf; the deltas are not recomputed.

- `leaderboard` (*table*) : Result of computeLeaderboard (must have rows and playerRowIndex).
- `totalSecs` (*number*) : Official total in seconds (> 0).

#### `gameplay_rally_aiCompetitors.computeLeaderboard(playerTimeOrTimes, silverTimeOrTimes, playerName, playerFinalSortSecs)`

Builds the player + AI competitors ranking. With two numbers: a single special stage. With two arrays of the same length (>= 1): several special stages (loop). Returns {rows = {}} if the inputs are invalid.

- `playerTimeOrTimes` (*number|number[]*) : Player time (or list of times per special stage).
- `silverTimeOrTimes` (*number|number[]*) : Reference (silver) time of the special stage, or list per special stage; must be > 0.
- `playerName` (*string|nil*) : Display name; nil = 'Player' with translation key missions.aiCompetitorsLeaderboard.player.
- `playerFinalSortSecs` (*number|nil*) : Official total (special stages + penalties) used to rank the player.
- **returns**: table {rows, playerRowIndex}; in multi: also multiStage=true and stageCount, rows with stageCells/finalTime/finalDnf; in single: rows with time/delta/deltaVsLeader/deltaVsAhead/dnf.

#### `gameplay_rally_aiCompetitors.computeMixtureWeights(paramTable, skill, risk)`

Computes the normalized weights of the 5 possible results (safe, push, minor_incident, major_incident, dnf) for a given skill and risk level. Uses a fixed consistency of 0.5 (with no effect on the weights).

- `paramTable` (*table|nil*) : Model coefficients (safe_weight_base, push_weight_floor, etc.); nil = those of the config file.
- `skill` (*number*) : Competitor skill (0 to 1 expected, inferred from code).
- `risk` (*number*) : Risk propensity (0 to 1 expected, inferred from code).
- **returns**: number[] 5 weights summing to 1, in the order safe, push, minor_incident, major_incident, dnf.

#### `gameplay_rally_aiCompetitors.getReferenceTime(missionTypeData)`

Returns the reference time (medal designated by referenceStarKey) of a mission, or nil if it is absent or not strictly positive.

- `missionTypeData` (*table|nil*) : Mission type data containing for example silverTime.
- **returns**: number|nil Reference time in seconds.

#### `gameplay_rally_aiCompetitors.mixtureDensityTimes(paramTable, referenceSec, skill, consistency, risk, timeLo, timeHi, sampleCount, precomputedWeights)`

Computes the density of the Gaussian mixture of finish times (preview for the editor). Uses the same weights and means/standard deviations as the sampling; the DNF has no density.

- `paramTable` (*table|nil*) : Model coefficients; nil = file config.
- `referenceSec` (*number*) : Reference time in seconds.
- `skill` (*number*) : Skill.
- `consistency` (*number*) : Consistency (1 = very consistent: reduced standard deviation).
- `risk` (*number*) : Risk propensity.
- `timeLo` (*number*) : Lower bound of the time axis.
- `timeHi` (*number*) : Upper bound of the time axis.
- `sampleCount` (*integer|nil*) : Number of points (minimum 2, 500 by default).
- `precomputedWeights` (*number[]|nil*) : Weights already computed, to avoid recomputing them.
- **returns**: table {times, mixture, weights, components (5 density arrays per result), sampleCount}.

## Fields

| Field | Type | Description |
|---|---|---|
| `referenceStarKey` | string | Key of the medal time used as the pace reference for the simulated competitors. Is 'silverTime' by default; getReferenceTime reads it from missionTypeData. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/aiCompetitors.lua`.*
